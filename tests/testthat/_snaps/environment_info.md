# current_script snapshot with mocked RStudio API

    Code
      result
    Output
      [1] "L1:# Statistical Analysis Script\nL2:\nL3:# Load required libraries\nL4:library(dplyr)\nL5:library(ggplot2)\nL6:\nL7:# Set parameters\nL8:threshold <- 0.05\nL9:\nL10:# Define helper function\nL11:calculate_mean <- function(x) mean(x, na.rm = TRUE)\nL12:\nL13:# Load and prepare data\nL14:analysis_data <- read.csv('input.csv')\nL15:\nL16:# Perform analysis\nL17:result_data <- analysis_data %>%\nL18:  group_by(category) %>%\nL19:  summarise(mean = calculate_mean(value))\nL20:\nL21:# Display results\nL22:print(result_data)"

# environment_objects snapshot with various object types

    Code
      result
    Output
      $another_df
      [1] "dataframe"
      
      $another_function
      [1] "function"
      
      $my_dataframe
      [1] "dataframe"
      
      $my_function
      [1] "function"
      
      $my_variable
      [1] "variable"
      
      $text_var
      [1] "variable"
      
      $vector_var
      [1] "variable"
      

# environment_objects snapshot with empty environment

    Code
      result
    Output
      named list()

# header snapshot with multiple dataframes

    Code
      result
    Output
      $iris_subset
      [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"     
      
      $mtcars_subset
      [1] "mpg"  "cyl"  "disp" "hp"  
      
      $simple_df
      [1] "a" "b"
      

# header snapshot with no dataframes

    Code
      result
    Output
      [1] "No datasets loaded in the session"

# environment_info snapshot with complete environment

    Code
      result
    Output
      $last_executed_code
      [1] "result_data <- analysis_data %>% group_by(category) %>% summarise(mean = calculate_mean(value))"
      
      $script
      [1] "L1:# Statistical Analysis Script\nL2:\nL3:# Load required libraries\nL4:library(dplyr)\nL5:library(ggplot2)\nL6:\nL7:# Set parameters\nL8:threshold <- 0.05\nL9:\nL10:# Define helper function\nL11:calculate_mean <- function(x) mean(x, na.rm = TRUE)\nL12:\nL13:# Load and prepare data\nL14:analysis_data <- read.csv('input.csv')\nL15:\nL16:# Perform analysis\nL17:result_data <- analysis_data %>%\nL18:  group_by(category) %>%\nL19:  summarise(mean = calculate_mean(value))\nL20:\nL21:# Display results\nL22:print(result_data)"
      
      $objects
      $objects$analysis_data
      [1] "dataframe"
      
      $objects$calculate_mean
      [1] "function"
      
      $objects$result_data
      [1] "dataframe"
      
      $objects$threshold
      [1] "variable"
      
      
      $datastructure
      $datastructure$analysis_data
      [1] "id"       "value"    "category"
      
      $datastructure$result_data
      [1] "group" "mean" 
      
      
      $packages
      $packages[[1]]
       [1] "base"      "stats"     "graphics"  "grDevices" "utils"     "datasets" 
       [7] "methods"   "testthat"  "rainer"    "dplyr"     "ggplot2"  
      
      
      $error_message
      [1] "Error in mean(x) : object 'x' not found"
      

# environment_info snapshot without error message

    Code
      result
    Output
      $last_executed_code
      [1] "config <- list(setting1 = TRUE, setting2 = 100)"
      
      $script
      [1] "L1:# Statistical Analysis Script\nL2:\nL3:# Load required libraries\nL4:library(dplyr)\nL5:library(ggplot2)\nL6:\nL7:# Set parameters\nL8:threshold <- 0.05\nL9:\nL10:# Define helper function\nL11:calculate_mean <- function(x) mean(x, na.rm = TRUE)\nL12:\nL13:# Load and prepare data\nL14:analysis_data <- read.csv('input.csv')\nL15:\nL16:# Perform analysis\nL17:result_data <- analysis_data %>%\nL18:  group_by(category) %>%\nL19:  summarise(mean = calculate_mean(value))\nL20:\nL21:# Display results\nL22:print(result_data)"
      
      $objects
      $objects$config
      [1] "variable"
      
      $objects$my_data
      [1] "dataframe"
      
      
      $datastructure
      $datastructure$my_data
      [1] "x" "y"
      
      
      $packages
      $packages[[1]]
      [1] "base"     "stats"    "graphics" "utils"    "testthat" "rainer"  
      
      

# environment_info snapshot with minimal environment

    Code
      result
    Output
      $last_executed_code
      [1] NA
      
      $script
      NULL
      
      $objects
      named list()
      
      $datastructure
      [1] "No datasets loaded in the session"
      
      $packages
      $packages[[1]]
      [1] "base"     "testthat" "rainer"  
      
      

# environment_info snapshot with complex nested dataframes

    Code
      result
    Output
      $last_executed_code
      [1] "mixed_types <- data.frame(id = 1:3, name = c('John', 'Jane', 'Bob'), score = c(85.5, 92.3, 78.9), passed = c(TRUE, TRUE, FALSE), date = as.Date(c('2025-01-01', '2025-01-02', '2025-01-03')))"
      
      $script
      [1] "L1:# Statistical Analysis Script\nL2:\nL3:# Load required libraries\nL4:library(dplyr)\nL5:library(ggplot2)\nL6:\nL7:# Set parameters\nL8:threshold <- 0.05\nL9:\nL10:# Define helper function\nL11:calculate_mean <- function(x) mean(x, na.rm = TRUE)\nL12:\nL13:# Load and prepare data\nL14:analysis_data <- read.csv('input.csv')\nL15:\nL16:# Perform analysis\nL17:result_data <- analysis_data %>%\nL18:  group_by(category) %>%\nL19:  summarise(mean = calculate_mean(value))\nL20:\nL21:# Display results\nL22:print(result_data)"
      
      $objects
      $objects$counter
      [1] "variable"
      
      $objects$mixed_types
      [1] "dataframe"
      
      $objects$text_processor
      [1] "function"
      
      $objects$wide_data
      [1] "dataframe"
      
      
      $datastructure
      $datastructure$mixed_types
      [1] "id"     "name"   "score"  "passed" "date"  
      
      $datastructure$wide_data
      [1] "col1" "col2" "col3" "col4" "col5" "col6" "col7" "col8"
      
      
      $packages
      $packages[[1]]
      [1] "base"     "stats"    "utils"    "testthat" "rainer"  
      
      
      $error_message
      [1] ""
      

