# stl-snowfall-trends
# St. Louis Snowfall Trends (1973–2024)

This project analyzes daily GSOD weather records for St. Louis (1973–2024) to identify trends in:

- Total annual snowfall (inches)
- Number of snow days per year
- Long-term snowfall frequency trends

Data is based on Global Summary of the Day (GSOD) observations downloaded using the GSODR R package.

## Project Structure
stl-snowfall-trends/
├── data/
│ ├── stl_raw.csv # Raw GSOD export for St. Louis
│ └── yearly_snowfall_summary.csv # Cleaned and summarized annual data
├── R/
│ └── analyze_snowfall.R # Main analysis script
└── README.md

---

## Summary of Findings

From 1973–2024 (52 years):

- St. Louis snowfall has shown a long-term decline.
- Linear regression estimates a trend of –0.265 snow days per year.
- The 1970s and early 1980s had much higher snowfall totals.
- 2023 is one of the lowest snow years on record (2 snow days).

---

## Script Overview (analyze_snowfall.R)

The analysis script performs:

1. Loading GSOD station data for St. Louis
2. Cleaning date fields and converting SNDP (mm → inches)
3. Identifying days with measurable snowfall
4. Aggregating yearly snowfall totals and snow-day counts
5. Computing the linear trend of snow days over time
6. Saving results to data/yearly_snowfall_summary.csv
7. Generating plots of snowfall and trendlines

---

## Requirements

Install dependencies:
install.packages(c(
  "GSODR",
  "dplyr",
  "ggplot2",
  "readr"
))

Running the Script

Run the full analysis from R or Posit Cloud:
source("R/analyze_snowfall.R")

This will create:
data/yearly_snowfall_summary.csv
PNG plots for snowfall and snow-day trends

A printed trendline summary (slope estimate)
Example Output (Summary CSV)
year,total_snow_in,snow_days,total_days_recorded
1973,81.50,12,12
1977,326.50,60,60
1978,629.99,65,65
...
2023,3.20,2,2
2024,28.00,15,15


Linear trend:
Estimated snow days trend: -0.265 days per year
