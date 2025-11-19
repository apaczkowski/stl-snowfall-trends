###############################################
# St. Louis Snow Days Trend Analysis (GSOD)
# Using GSODR on Posit Cloud
# Station: St. Louis Lambert Airport
# Station ID: 724340-13994
# Years: 1973–2024
###############################################

# -------------------------------
# 0. Load required packages
# -------------------------------
library(GSODR)
library(dplyr)
library(ggplot2)

# -------------------------------
# 1. Set station and years
# -------------------------------
stl_station <- "724340-13994"  # Lambert Airport
years_to_download <- 1973:2024

message("Downloading historical GSOD data for St. Louis Lambert Airport...")
stl_data <- get_GSOD(
  station = stl_station,
  years = years_to_download
)

# Validate download
if(nrow(stl_data) == 0){
  stop("No data returned. Check station ID or years.")
}

# -------------------------------
# 2. Compute snow days
# -------------------------------
# Use SNDP > 0 or I_SNOW_ICE == 1 to define a snow day
snow_data <- stl_data %>%
  mutate(
    date = as.Date(YEARMODA),
    year = as.integer(format(date, "%Y")),
    snow_day = ifelse(!is.na(SNDP) & SNDP > 0 | I_SNOW_ICE == 1, 1, 0)
  )

# -------------------------------
# 3. Summarize yearly snow days
# -------------------------------
yearly_snow_days <- snow_data %>%
  group_by(year) %>%
  summarise(
    snow_days = sum(snow_day, na.rm = TRUE),
    total_days_recorded = n()
  ) %>%
  ungroup()

# -------------------------------
# 4. Plot snow days trends
# -------------------------------
ggplot(yearly_snow_days, aes(x = year, y = snow_days)) +
  geom_line(color = "blue", linewidth = 1) +
  geom_point(color = "darkblue") +
  geom_smooth(method = "loess", se = TRUE, color = "red", linetype = "dashed") +
  labs(
    title = "Historical Snow Days at St. Louis Lambert Airport",
    x = "Year",
    y = "Number of Snow Days",
    caption = "Data source: NOAA GSOD via GSODR"
  ) +
  theme_minimal()

# -------------------------------
# 5. Save summary CSV
# -------------------------------
write.csv(yearly_snow_days, "stl_yearly_snow_days.csv", row.names = FALSE)
message("Yearly snow days summary saved to stl_yearly_snow_days.csv")

# -------------------------------
# 6. Compute linear trend
# -------------------------------
if(nrow(yearly_snow_days) > 1){
  trend_model <- lm(snow_days ~ year, data = yearly_snow_days)
  slope <- coef(trend_model)["year"]
  message(sprintf("Estimated snow days trend: %.3f days per year", slope))
} else {
  message("Not enough data to compute a linear trend.")
}















