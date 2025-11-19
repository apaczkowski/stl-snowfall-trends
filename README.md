# stl-snowfall-trends
St. Louis Snowfall Trends (1973–2024)

This project analyzes daily GSOD weather records for St. Louis (1973–2024) to identify trends in:
Total annual snowfall (inches)
Number of snow days per year
Long-term trends in snowfall frequency
Data is based on Global Summary of the Day (GSOD) observations downloaded using the GSODR R package.

Project Structure
stl-snowfall-trends/
├── data/
│   ├── stl_raw.csv                     # Raw GSOD export for St. Louis
│   └── yearly_snowfall_summary.csv     # Cleaned and summarized annual data
├── R/
│   └── analyze_snowfall.R              # Main analysis script
└── README.md

Summary of Findings
From 1973–2024 (52 years):
St. Louis snowfall has shown a long-term decline.
Linear regression estimates a trend of
–0.265 snow days per year.
The 1970s and early 1980s had much higher snowfall levels.
2023 shows one of the lowest snow years on record (2 snow days).

Script Overview (analyze_snowfall.R)
The analysis script performs the following steps:
Loads GSOD station data for St. Louis.
Cleans date fields and converts snow depth (SNDP) from millimeters to inches.
Identifies days with measurable snowfall.
Aggregates annual snowfall totals and snow-day counts.
Computes the linear trend of snow days over time.
Saves output to data/yearly_snowfall_summary.csv.
Generates plots of snowfall and trendlines.

Requirements
R packages used:
install.packages(c(
  "GSODR",
  "dplyr",
  "ggplot2",
  "readr"
))

Running the Script
From R or Posit Cloud:
source("R/analyze_snowfall.R")


This will produce:
data/yearly_snowfall_summary.csv
PNG plots for:
Snow days per year
Total snowfall per year

A printed trendline summary (slope, intercept)
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
