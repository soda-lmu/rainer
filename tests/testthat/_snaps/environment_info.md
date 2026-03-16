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
      $iris_subset$dimensions
      $iris_subset$dimensions$rows
      [1] 3
      
      $iris_subset$dimensions$cols
      [1] 5
      
      
      $iris_subset$columns
      $iris_subset$columns$Sepal.Length
      $iris_subset$columns$Sepal.Length$type
      [1] "numeric"
      
      $iris_subset$columns$Sepal.Length$has_na
      [1] FALSE
      
      $iris_subset$columns$Sepal.Length$has_zero
      [1] FALSE
      
      
      $iris_subset$columns$Sepal.Width
      $iris_subset$columns$Sepal.Width$type
      [1] "numeric"
      
      $iris_subset$columns$Sepal.Width$has_na
      [1] FALSE
      
      $iris_subset$columns$Sepal.Width$has_zero
      [1] FALSE
      
      
      $iris_subset$columns$Petal.Length
      $iris_subset$columns$Petal.Length$type
      [1] "numeric"
      
      $iris_subset$columns$Petal.Length$has_na
      [1] FALSE
      
      $iris_subset$columns$Petal.Length$has_zero
      [1] FALSE
      
      
      $iris_subset$columns$Petal.Width
      $iris_subset$columns$Petal.Width$type
      [1] "numeric"
      
      $iris_subset$columns$Petal.Width$has_na
      [1] FALSE
      
      $iris_subset$columns$Petal.Width$has_zero
      [1] FALSE
      
      
      $iris_subset$columns$Species
      $iris_subset$columns$Species$type
      [1] "character"
      
      $iris_subset$columns$Species$has_na
      [1] FALSE
      
      $iris_subset$columns$Species$n_unique
      [1] 1
      
      $iris_subset$columns$Species$all_empty
      [1] FALSE
      
      
      
      
      $mtcars_subset
      $mtcars_subset$dimensions
      $mtcars_subset$dimensions$rows
      [1] 3
      
      $mtcars_subset$dimensions$cols
      [1] 4
      
      
      $mtcars_subset$columns
      $mtcars_subset$columns$mpg
      $mtcars_subset$columns$mpg$type
      [1] "numeric"
      
      $mtcars_subset$columns$mpg$has_na
      [1] FALSE
      
      $mtcars_subset$columns$mpg$has_zero
      [1] FALSE
      
      
      $mtcars_subset$columns$cyl
      $mtcars_subset$columns$cyl$type
      [1] "numeric"
      
      $mtcars_subset$columns$cyl$has_na
      [1] FALSE
      
      $mtcars_subset$columns$cyl$has_zero
      [1] FALSE
      
      
      $mtcars_subset$columns$disp
      $mtcars_subset$columns$disp$type
      [1] "numeric"
      
      $mtcars_subset$columns$disp$has_na
      [1] FALSE
      
      $mtcars_subset$columns$disp$has_zero
      [1] FALSE
      
      
      $mtcars_subset$columns$hp
      $mtcars_subset$columns$hp$type
      [1] "numeric"
      
      $mtcars_subset$columns$hp$has_na
      [1] FALSE
      
      $mtcars_subset$columns$hp$has_zero
      [1] FALSE
      
      
      
      
      $simple_df
      $simple_df$dimensions
      $simple_df$dimensions$rows
      [1] 3
      
      $simple_df$dimensions$cols
      [1] 2
      
      
      $simple_df$columns
      $simple_df$columns$a
      $simple_df$columns$a$type
      [1] "integer"
      
      $simple_df$columns$a$has_na
      [1] FALSE
      
      $simple_df$columns$a$has_zero
      [1] FALSE
      
      
      $simple_df$columns$b
      $simple_df$columns$b$type
      [1] "character"
      
      $simple_df$columns$b$has_na
      [1] FALSE
      
      $simple_df$columns$b$n_unique
      [1] 3
      
      $simple_df$columns$b$all_empty
      [1] FALSE
      
      
      
      

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
      $datastructure$analysis_data$dimensions
      $datastructure$analysis_data$dimensions$rows
      [1] 10
      
      $datastructure$analysis_data$dimensions$cols
      [1] 3
      
      
      $datastructure$analysis_data$columns
      $datastructure$analysis_data$columns$id
      $datastructure$analysis_data$columns$id$type
      [1] "integer"
      
      $datastructure$analysis_data$columns$id$has_na
      [1] FALSE
      
      $datastructure$analysis_data$columns$id$has_zero
      [1] FALSE
      
      
      $datastructure$analysis_data$columns$value
      $datastructure$analysis_data$columns$value$type
      [1] "numeric"
      
      $datastructure$analysis_data$columns$value$has_na
      [1] FALSE
      
      $datastructure$analysis_data$columns$value$has_zero
      [1] FALSE
      
      
      $datastructure$analysis_data$columns$category
      $datastructure$analysis_data$columns$category$type
      [1] "character"
      
      $datastructure$analysis_data$columns$category$has_na
      [1] FALSE
      
      $datastructure$analysis_data$columns$category$n_unique
      [1] 2
      
      $datastructure$analysis_data$columns$category$all_empty
      [1] FALSE
      
      
      
      
      $datastructure$result_data
      $datastructure$result_data$dimensions
      $datastructure$result_data$dimensions$rows
      [1] 2
      
      $datastructure$result_data$dimensions$cols
      [1] 2
      
      
      $datastructure$result_data$columns
      $datastructure$result_data$columns$group
      $datastructure$result_data$columns$group$type
      [1] "character"
      
      $datastructure$result_data$columns$group$has_na
      [1] FALSE
      
      $datastructure$result_data$columns$group$n_unique
      [1] 2
      
      $datastructure$result_data$columns$group$all_empty
      [1] FALSE
      
      
      $datastructure$result_data$columns$mean
      $datastructure$result_data$columns$mean$type
      [1] "numeric"
      
      $datastructure$result_data$columns$mean$has_na
      [1] FALSE
      
      $datastructure$result_data$columns$mean$has_zero
      [1] FALSE
      
      
      
      
      
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
      $datastructure$my_data$dimensions
      $datastructure$my_data$dimensions$rows
      [1] 5
      
      $datastructure$my_data$dimensions$cols
      [1] 2
      
      
      $datastructure$my_data$columns
      $datastructure$my_data$columns$x
      $datastructure$my_data$columns$x$type
      [1] "integer"
      
      $datastructure$my_data$columns$x$has_na
      [1] FALSE
      
      $datastructure$my_data$columns$x$has_zero
      [1] FALSE
      
      
      $datastructure$my_data$columns$y
      $datastructure$my_data$columns$y$type
      [1] "character"
      
      $datastructure$my_data$columns$y$has_na
      [1] FALSE
      
      $datastructure$my_data$columns$y$n_unique
      [1] 5
      
      $datastructure$my_data$columns$y$all_empty
      [1] FALSE
      
      
      
      
      
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
      $datastructure$mixed_types$dimensions
      $datastructure$mixed_types$dimensions$rows
      [1] 3
      
      $datastructure$mixed_types$dimensions$cols
      [1] 5
      
      
      $datastructure$mixed_types$columns
      $datastructure$mixed_types$columns$id
      $datastructure$mixed_types$columns$id$type
      [1] "integer"
      
      $datastructure$mixed_types$columns$id$has_na
      [1] FALSE
      
      $datastructure$mixed_types$columns$id$has_zero
      [1] FALSE
      
      
      $datastructure$mixed_types$columns$name
      $datastructure$mixed_types$columns$name$type
      [1] "character"
      
      $datastructure$mixed_types$columns$name$has_na
      [1] FALSE
      
      $datastructure$mixed_types$columns$name$n_unique
      [1] 3
      
      $datastructure$mixed_types$columns$name$all_empty
      [1] FALSE
      
      
      $datastructure$mixed_types$columns$score
      $datastructure$mixed_types$columns$score$type
      [1] "numeric"
      
      $datastructure$mixed_types$columns$score$has_na
      [1] FALSE
      
      $datastructure$mixed_types$columns$score$has_zero
      [1] FALSE
      
      
      $datastructure$mixed_types$columns$passed
      $datastructure$mixed_types$columns$passed$type
      [1] "logical"
      
      $datastructure$mixed_types$columns$passed$has_na
      [1] FALSE
      
      
      $datastructure$mixed_types$columns$date
      $datastructure$mixed_types$columns$date$type
      [1] "Date"
      
      $datastructure$mixed_types$columns$date$has_na
      [1] FALSE
      
      
      
      
      $datastructure$wide_data
      $datastructure$wide_data$dimensions
      $datastructure$wide_data$dimensions$rows
      [1] 3
      
      $datastructure$wide_data$dimensions$cols
      [1] 8
      
      
      $datastructure$wide_data$columns
      $datastructure$wide_data$columns$col1
      $datastructure$wide_data$columns$col1$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col1$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col1$has_zero
      [1] FALSE
      
      
      $datastructure$wide_data$columns$col2
      $datastructure$wide_data$columns$col2$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col2$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col2$has_zero
      [1] FALSE
      
      
      $datastructure$wide_data$columns$col3
      $datastructure$wide_data$columns$col3$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col3$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col3$has_zero
      [1] FALSE
      
      
      $datastructure$wide_data$columns$col4
      $datastructure$wide_data$columns$col4$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col4$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col4$has_zero
      [1] FALSE
      
      
      $datastructure$wide_data$columns$col5
      $datastructure$wide_data$columns$col5$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col5$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col5$has_zero
      [1] FALSE
      
      
      $datastructure$wide_data$columns$col6
      $datastructure$wide_data$columns$col6$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col6$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col6$has_zero
      [1] FALSE
      
      
      $datastructure$wide_data$columns$col7
      $datastructure$wide_data$columns$col7$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col7$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col7$has_zero
      [1] FALSE
      
      
      $datastructure$wide_data$columns$col8
      $datastructure$wide_data$columns$col8$type
      [1] "integer"
      
      $datastructure$wide_data$columns$col8$has_na
      [1] FALSE
      
      $datastructure$wide_data$columns$col8$has_zero
      [1] FALSE
      
      
      
      
      
      $packages
      $packages[[1]]
      [1] "base"     "stats"    "utils"    "testthat" "rainer"  
      
      
      $error_message
      [1] ""
      

