# LIS-4370_Module-04
This script analyzes and visualizes hospital patient data, including blood pressure readings, initial assessments, and final emergency decisions. It incorporates data validation, error handling, and structured analysis for accurate insights.

# Hospital Patient Data Analysis and Visualization

## Overview
This script processes and visualizes hospital patient data, including blood pressure readings, initial assessments, and final emergency decisions. It includes data validation, error handling, and structured analysis.

## Features
- **Data Loading**: Reads patient data, including blood pressure, doctor assessments, and emergency decisions.
- **Visualization**:
  - Boxplots to analyze blood pressure distribution.
  - Blood pressure comparisons based on medical assessments.
  - A heart image visualization using Base64 decoding.
- **Error Handling**: Catches and manages errors in data processing and visualization.
- **Customizable**: Can be expanded to include more patient data and visualization types.

## Installation
Ensure you have **R** installed along with the following packages:
install.packages(c("ggplot2", "grid", "gridExtra", "png", "base64enc"))

Usage
Clone the repository:
git clone https://github.com/your-username/repository-name.git

Set the working directory in R:
setwd("path/to/repository")

Run the script:
source("your_script_name.R")

Requirements
R version 4.x or higher
Required libraries: ggplot2, grid, gridExtra, png, base64enc

Notes
The working directory should be set correctly before running the script.
If any package is missing, it will be installed automatically.

Author
Steven Barden
Course: LIS-4370 R Programming for Data Science
University of South Florida
Date: February 10, 2025
