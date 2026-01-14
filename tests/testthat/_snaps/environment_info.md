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
      $iris_subset$columns
      [1] "Sepal.Length" "Sepal.Width"  "Petal.Length" "Petal.Width"  "Species"     
      
      $iris_subset$types
      $iris_subset$types$Sepal.Length
      [1] "numeric"
      
      $iris_subset$types$Sepal.Width
      [1] "numeric"
      
      $iris_subset$types$Petal.Length
      [1] "numeric"
      
      $iris_subset$types$Petal.Width
      [1] "numeric"
      
      $iris_subset$types$Species
      [1] "character"
      
      
      $iris_subset$dimensions
      $iris_subset$dimensions$rows
      [1] 3
      
      $iris_subset$dimensions$cols
      [1] 5
      
      
      $iris_subset$numeric
      $iris_subset$numeric$Sepal.Length
      $iris_subset$numeric$Sepal.Length$has_na
      [1] FALSE
      
      $iris_subset$numeric$Sepal.Length$has_negative
      [1] FALSE
      
      $iris_subset$numeric$Sepal.Length$has_zero
      [1] FALSE
      
      $iris_subset$numeric$Sepal.Length$has_positive
      [1] TRUE
      
      
      $iris_subset$numeric$Sepal.Width
      $iris_subset$numeric$Sepal.Width$has_na
      [1] FALSE
      
      $iris_subset$numeric$Sepal.Width$has_negative
      [1] FALSE
      
      $iris_subset$numeric$Sepal.Width$has_zero
      [1] FALSE
      
      $iris_subset$numeric$Sepal.Width$has_positive
      [1] TRUE
      
      
      $iris_subset$numeric$Petal.Length
      $iris_subset$numeric$Petal.Length$has_na
      [1] FALSE
      
      $iris_subset$numeric$Petal.Length$has_negative
      [1] FALSE
      
      $iris_subset$numeric$Petal.Length$has_zero
      [1] FALSE
      
      $iris_subset$numeric$Petal.Length$has_positive
      [1] TRUE
      
      
      $iris_subset$numeric$Petal.Width
      $iris_subset$numeric$Petal.Width$has_na
      [1] FALSE
      
      $iris_subset$numeric$Petal.Width$has_negative
      [1] FALSE
      
      $iris_subset$numeric$Petal.Width$has_zero
      [1] FALSE
      
      $iris_subset$numeric$Petal.Width$has_positive
      [1] TRUE
      
      
      
      $iris_subset$character
      $iris_subset$character$Species
      $iris_subset$character$Species$n_unique
      [1] 1
      
      $iris_subset$character$Species$has_na
      [1] FALSE
      
      $iris_subset$character$Species$all_empty
      [1] FALSE
      
      
      
      
      $mtcars_subset
      $mtcars_subset$columns
      [1] "mpg"  "cyl"  "disp" "hp"  
      
      $mtcars_subset$types
      $mtcars_subset$types$mpg
      [1] "numeric"
      
      $mtcars_subset$types$cyl
      [1] "numeric"
      
      $mtcars_subset$types$disp
      [1] "numeric"
      
      $mtcars_subset$types$hp
      [1] "numeric"
      
      
      $mtcars_subset$dimensions
      $mtcars_subset$dimensions$rows
      [1] 3
      
      $mtcars_subset$dimensions$cols
      [1] 4
      
      
      $mtcars_subset$numeric
      $mtcars_subset$numeric$mpg
      $mtcars_subset$numeric$mpg$has_na
      [1] FALSE
      
      $mtcars_subset$numeric$mpg$has_negative
      [1] FALSE
      
      $mtcars_subset$numeric$mpg$has_zero
      [1] FALSE
      
      $mtcars_subset$numeric$mpg$has_positive
      [1] TRUE
      
      
      $mtcars_subset$numeric$cyl
      $mtcars_subset$numeric$cyl$has_na
      [1] FALSE
      
      $mtcars_subset$numeric$cyl$has_negative
      [1] FALSE
      
      $mtcars_subset$numeric$cyl$has_zero
      [1] FALSE
      
      $mtcars_subset$numeric$cyl$has_positive
      [1] TRUE
      
      
      $mtcars_subset$numeric$disp
      $mtcars_subset$numeric$disp$has_na
      [1] FALSE
      
      $mtcars_subset$numeric$disp$has_negative
      [1] FALSE
      
      $mtcars_subset$numeric$disp$has_zero
      [1] FALSE
      
      $mtcars_subset$numeric$disp$has_positive
      [1] TRUE
      
      
      $mtcars_subset$numeric$hp
      $mtcars_subset$numeric$hp$has_na
      [1] FALSE
      
      $mtcars_subset$numeric$hp$has_negative
      [1] FALSE
      
      $mtcars_subset$numeric$hp$has_zero
      [1] FALSE
      
      $mtcars_subset$numeric$hp$has_positive
      [1] TRUE
      
      
      
      
      $simple_df
      $simple_df$columns
      [1] "a" "b"
      
      $simple_df$types
      $simple_df$types$a
      [1] "integer"
      
      $simple_df$types$b
      [1] "character"
      
      
      $simple_df$dimensions
      $simple_df$dimensions$rows
      [1] 3
      
      $simple_df$dimensions$cols
      [1] 2
      
      
      $simple_df$numeric
      $simple_df$numeric$a
      $simple_df$numeric$a$has_na
      [1] FALSE
      
      $simple_df$numeric$a$has_negative
      [1] FALSE
      
      $simple_df$numeric$a$has_zero
      [1] FALSE
      
      $simple_df$numeric$a$has_positive
      [1] TRUE
      
      
      
      $simple_df$character
      $simple_df$character$b
      $simple_df$character$b$n_unique
      [1] 3
      
      $simple_df$character$b$has_na
      [1] FALSE
      
      $simple_df$character$b$all_empty
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
      $datastructure$analysis_data$columns
      [1] "id"       "value"    "category"
      
      $datastructure$analysis_data$types
      $datastructure$analysis_data$types$id
      [1] "integer"
      
      $datastructure$analysis_data$types$value
      [1] "numeric"
      
      $datastructure$analysis_data$types$category
      [1] "character"
      
      
      $datastructure$analysis_data$dimensions
      $datastructure$analysis_data$dimensions$rows
      [1] 10
      
      $datastructure$analysis_data$dimensions$cols
      [1] 3
      
      
      $datastructure$analysis_data$numeric
      $datastructure$analysis_data$numeric$id
      $datastructure$analysis_data$numeric$id$has_na
      [1] FALSE
      
      $datastructure$analysis_data$numeric$id$has_negative
      [1] FALSE
      
      $datastructure$analysis_data$numeric$id$has_zero
      [1] FALSE
      
      $datastructure$analysis_data$numeric$id$has_positive
      [1] TRUE
      
      
      $datastructure$analysis_data$numeric$value
      $datastructure$analysis_data$numeric$value$has_na
      [1] FALSE
      
      $datastructure$analysis_data$numeric$value$has_negative
      [1] TRUE
      
      $datastructure$analysis_data$numeric$value$has_zero
      [1] FALSE
      
      $datastructure$analysis_data$numeric$value$has_positive
      [1] TRUE
      
      
      
      $datastructure$analysis_data$character
      $datastructure$analysis_data$character$category
      $datastructure$analysis_data$character$category$n_unique
      [1] 2
      
      $datastructure$analysis_data$character$category$has_na
      [1] FALSE
      
      $datastructure$analysis_data$character$category$all_empty
      [1] FALSE
      
      
      
      
      $datastructure$result_data
      $datastructure$result_data$columns
      [1] "group" "mean" 
      
      $datastructure$result_data$types
      $datastructure$result_data$types$group
      [1] "character"
      
      $datastructure$result_data$types$mean
      [1] "numeric"
      
      
      $datastructure$result_data$dimensions
      $datastructure$result_data$dimensions$rows
      [1] 2
      
      $datastructure$result_data$dimensions$cols
      [1] 2
      
      
      $datastructure$result_data$numeric
      $datastructure$result_data$numeric$mean
      $datastructure$result_data$numeric$mean$has_na
      [1] FALSE
      
      $datastructure$result_data$numeric$mean$has_negative
      [1] TRUE
      
      $datastructure$result_data$numeric$mean$has_zero
      [1] FALSE
      
      $datastructure$result_data$numeric$mean$has_positive
      [1] TRUE
      
      
      
      $datastructure$result_data$character
      $datastructure$result_data$character$group
      $datastructure$result_data$character$group$n_unique
      [1] 2
      
      $datastructure$result_data$character$group$has_na
      [1] FALSE
      
      $datastructure$result_data$character$group$all_empty
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
      $datastructure$my_data$columns
      [1] "x" "y"
      
      $datastructure$my_data$types
      $datastructure$my_data$types$x
      [1] "integer"
      
      $datastructure$my_data$types$y
      [1] "character"
      
      
      $datastructure$my_data$dimensions
      $datastructure$my_data$dimensions$rows
      [1] 5
      
      $datastructure$my_data$dimensions$cols
      [1] 2
      
      
      $datastructure$my_data$numeric
      $datastructure$my_data$numeric$x
      $datastructure$my_data$numeric$x$has_na
      [1] FALSE
      
      $datastructure$my_data$numeric$x$has_negative
      [1] FALSE
      
      $datastructure$my_data$numeric$x$has_zero
      [1] FALSE
      
      $datastructure$my_data$numeric$x$has_positive
      [1] TRUE
      
      
      
      $datastructure$my_data$character
      $datastructure$my_data$character$y
      $datastructure$my_data$character$y$n_unique
      [1] 5
      
      $datastructure$my_data$character$y$has_na
      [1] FALSE
      
      $datastructure$my_data$character$y$all_empty
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
      $datastructure$mixed_types$columns
      [1] "id"     "name"   "score"  "passed" "date"  
      
      $datastructure$mixed_types$types
      $datastructure$mixed_types$types$id
      [1] "integer"
      
      $datastructure$mixed_types$types$name
      [1] "character"
      
      $datastructure$mixed_types$types$score
      [1] "numeric"
      
      $datastructure$mixed_types$types$passed
      [1] "logical"
      
      $datastructure$mixed_types$types$date
      [1] "Date"
      
      
      $datastructure$mixed_types$dimensions
      $datastructure$mixed_types$dimensions$rows
      [1] 3
      
      $datastructure$mixed_types$dimensions$cols
      [1] 5
      
      
      $datastructure$mixed_types$numeric
      $datastructure$mixed_types$numeric$id
      $datastructure$mixed_types$numeric$id$has_na
      [1] FALSE
      
      $datastructure$mixed_types$numeric$id$has_negative
      [1] FALSE
      
      $datastructure$mixed_types$numeric$id$has_zero
      [1] FALSE
      
      $datastructure$mixed_types$numeric$id$has_positive
      [1] TRUE
      
      
      $datastructure$mixed_types$numeric$score
      $datastructure$mixed_types$numeric$score$has_na
      [1] FALSE
      
      $datastructure$mixed_types$numeric$score$has_negative
      [1] FALSE
      
      $datastructure$mixed_types$numeric$score$has_zero
      [1] FALSE
      
      $datastructure$mixed_types$numeric$score$has_positive
      [1] TRUE
      
      
      
      $datastructure$mixed_types$character
      $datastructure$mixed_types$character$name
      $datastructure$mixed_types$character$name$n_unique
      [1] 3
      
      $datastructure$mixed_types$character$name$has_na
      [1] FALSE
      
      $datastructure$mixed_types$character$name$all_empty
      [1] FALSE
      
      
      
      
      $datastructure$wide_data
      $datastructure$wide_data$columns
      [1] "col1" "col2" "col3" "col4" "col5" "col6" "col7" "col8"
      
      $datastructure$wide_data$types
      $datastructure$wide_data$types$col1
      [1] "integer"
      
      $datastructure$wide_data$types$col2
      [1] "integer"
      
      $datastructure$wide_data$types$col3
      [1] "integer"
      
      $datastructure$wide_data$types$col4
      [1] "integer"
      
      $datastructure$wide_data$types$col5
      [1] "integer"
      
      $datastructure$wide_data$types$col6
      [1] "integer"
      
      $datastructure$wide_data$types$col7
      [1] "integer"
      
      $datastructure$wide_data$types$col8
      [1] "integer"
      
      
      $datastructure$wide_data$dimensions
      $datastructure$wide_data$dimensions$rows
      [1] 3
      
      $datastructure$wide_data$dimensions$cols
      [1] 8
      
      
      $datastructure$wide_data$numeric
      $datastructure$wide_data$numeric$col1
      $datastructure$wide_data$numeric$col1$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col1$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col1$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col1$has_positive
      [1] TRUE
      
      
      $datastructure$wide_data$numeric$col2
      $datastructure$wide_data$numeric$col2$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col2$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col2$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col2$has_positive
      [1] TRUE
      
      
      $datastructure$wide_data$numeric$col3
      $datastructure$wide_data$numeric$col3$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col3$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col3$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col3$has_positive
      [1] TRUE
      
      
      $datastructure$wide_data$numeric$col4
      $datastructure$wide_data$numeric$col4$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col4$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col4$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col4$has_positive
      [1] TRUE
      
      
      $datastructure$wide_data$numeric$col5
      $datastructure$wide_data$numeric$col5$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col5$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col5$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col5$has_positive
      [1] TRUE
      
      
      $datastructure$wide_data$numeric$col6
      $datastructure$wide_data$numeric$col6$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col6$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col6$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col6$has_positive
      [1] TRUE
      
      
      $datastructure$wide_data$numeric$col7
      $datastructure$wide_data$numeric$col7$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col7$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col7$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col7$has_positive
      [1] TRUE
      
      
      $datastructure$wide_data$numeric$col8
      $datastructure$wide_data$numeric$col8$has_na
      [1] FALSE
      
      $datastructure$wide_data$numeric$col8$has_negative
      [1] FALSE
      
      $datastructure$wide_data$numeric$col8$has_zero
      [1] FALSE
      
      $datastructure$wide_data$numeric$col8$has_positive
      [1] TRUE
      
      
      
      
      
      $packages
      $packages[[1]]
      [1] "base"     "stats"    "utils"    "testthat" "rainer"  
      
      
      $error_message
      [1] ""
      

