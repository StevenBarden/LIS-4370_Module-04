#       Class : LIS-4370 R Programming for Data Science
#      GitHub : StevenBarden/LIS-4370_Module-04
# Description : This script analyzes and visualizes hospital patient data, including blood pressure readings, initial assessments, and final emergency decisions. It incorporates data validation, error handling, and structured analysis for accurate insights.
#  Assignment : Assignments - Week 03 Lab - Visualization (Update)
#   Class URL : https://usflearn.instructure.com/courses/1926966/assignments/17606439
#     Purpose : Analyze hospital patient data, visualize blood pressure distributions and doctor assessments
#      Author : Steven Barden <stevenbarden@usf.edu>
#     Created : 2025-02-09-1130-25
#    Modified : 2025-02-10-2328-39
# Description : This script analyzes and visualizes hospital patient data, including blood pressure readings, 
#               initial assessments, and final emergency decisions. It incorporates data validation, 
#               error handling, and structured analysis for accurate insights.

# --- SETUP ---
# Set base directory
base_location <- "C:\\Users\\Admin\\OneDrive\\College\\_____DESKTOP ICONS\\2025-USF-Spring\\4370\\Module04"

# Set working directory
tryCatch({
    setwd(base_location)
}, error = function(e) {
    stop("Error setting the working directory: ", e$message)
})

# Verify working directory
tryCatch({
    print(getwd())
}, error = function(e) {
    stop("Error retrieving the working directory: ", e$message)
})

# Ensure printed outputs wrap properly
options(width = as.integer(system2("tput", "cols", stdout = TRUE)))

# --- UTILITY FUNCTIONS ---
# Function to check, install, and load required libraries
check_and_load_library <- function(package) {
    if (!require(package, character.only = TRUE)) {
        tryCatch({
            cat("Installing package:", package, "\n")
            install.packages(package)
            library(package, character.only = TRUE)
            cat("Successfully loaded:", package, "\n")
        }, error = function(e) {
            stop(paste("Failed to install/load package:", package, "-", e$message))
        })
    } else {
        cat("Package already loaded:", package, "\n")
    }
}

# List of required packages
required_packages <- c("ggplot2")

# Load all required packages
tryCatch({
    lapply(required_packages, check_and_load_library)
}, error = function(e) {
    stop("Package loading failed: ", e$message)
})

# --- DATA LOADING ---
load_hospital_data <- function() {
    tryCatch({
        # Create dataset
        Frequency <- c(0.6, 0.3, 0.4, 0.4, 0.2, 0.6, 0.3, 0.4, 0.9, 0.2)
        BP <- c(103, 87, 32, 42, 59, 109, 78, 205, 135, 176)
        First <- c(1, 1, 1, 1, 0, 0, 0, 0, NA, 1)  # bad=1, good=0, NA for missing data
        Second <- c(0, 0, 1, 1, 0, 0, 1, 1, 1, 1)  # low=0, high=1
        FinalDecision <- c(0, 1, 0, 1, 0, 1, 0, 1, 1, 1)  # low=0, high=1
        
        hospital_data <- data.frame(Frequency, BP, First, Second, FinalDecision)
        cat("Successfully created hospital data frame.\n")
        return(hospital_data)
    }, error = function(e) {
        stop("Error loading hospital data: ", e$message)
    })
}

# --- MAIN ANALYSIS ---
main_analysis <- function(hospital_data) {
    tryCatch({
        cat("Starting main analysis...\n")
        
        # Set layout: Two boxplots on the left, one horizontal boxplot on the right
        par(mfrow = c(1,3))  # 1 row, 3 columns
        
        # Boxplot 1: BP grouped by Final Decision
        boxplot(BP ~ FinalDecision, data=hospital_data, 
                main="BP by Final Decision",
                xlab="Final Decision", ylab="Blood Pressure",
                names=c("Low", "High"),
                col=c("lightblue", "salmon"))
        
        # Boxplot 2: BP grouped by First Doctor's Assessment
        boxplot(BP ~ First, data=hospital_data, 
                main="BP by First Assessment",
                xlab="Doctor's Rating (0=Good, 1=Bad)", ylab="Blood Pressure",
                names=c("Good", "Bad"),
                col=c("lightgreen", "lightcoral"))
        
        # Boxplot 3: Distribution of Blood Pressure (Horizontal)
        boxplot(hospital_data$BP, 
                main="Distribution of Blood Pressure",
                xlab="Blood Pressure",
                col="lightblue",
                horizontal=TRUE)
        
        # Reset graphical parameters to default
        par(mfrow = c(1,1))
        
        # Display summary statistics
        print(summary(hospital_data))
        
        cat("Main analysis completed successfully.\n")
    }, error = function(e) {
        stop("Error in main analysis: ", e$message)
    })
}

# --- EXECUTION ---
tryCatch({
    hospital_data <- load_hospital_data()
    main_analysis(hospital_data)
}, error = function(e) {
    stop("Script execution failed: ", e$message)
})

# --- END OF SCRIPT ---


