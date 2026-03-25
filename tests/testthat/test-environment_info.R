library(testthat)
library(withr)

# Define example script to be used across tests
EXAMPLE_SCRIPT <- c(
  "# Statistical Analysis Script",
  "",
  "# Load required libraries",
  "library(dplyr)",
  "library(ggplot2)",
  "",
  "# Set parameters",
  "threshold <- 0.05",
  "",
  "# Define helper function",
  "calculate_mean <- function(x) mean(x, na.rm = TRUE)",
  "",
  "# Load and prepare data",
  "analysis_data <- read.csv('input.csv')",
  "",
  "# Perform analysis",
  "result_data <- analysis_data %>%",
  "  group_by(category) %>%",
  "  summarise(mean = calculate_mean(value))",
  "",
  "# Display results",
  "print(result_data)"
)

# Test current_script function with RStudio API mock
test_that("current_script snapshot with mocked RStudio API", {
  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = EXAMPLE_SCRIPT)
    },
    .package = "rstudioapi"
  )

  result <- current_script()
  expect_snapshot(result)
})

test_that("current_script returns NULL when not in RStudio", {
  local_mocked_bindings(
    getSourceEditorContext = function() {
      stop("RStudio not available")
    },
    .package = "rstudioapi"
  )

  result <- current_script()
  expect_null(result)
})

test_that("current_script returns NULL when script content is NULL", {
  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = NULL)
    },
    .package = "rstudioapi"
  )

  result <- current_script()
  expect_null(result)
})

# Test environment_objects function
test_that("environment_objects snapshot with various object types", {
  test_env <- new.env(parent = emptyenv())

  test_env$my_dataframe <- data.frame(
    id = 1:5,
    name = c("Alice", "Bob", "Charlie", "David", "Eve"),
    score = c(85, 92, 78, 88, 95)
  )
  test_env$another_df <- data.frame(x = 1:3, y = 4:6)
  test_env$my_variable <- 42
  test_env$text_var <- "Hello, World!"
  test_env$vector_var <- c(1, 2, 3, 4, 5)
  test_env$my_function <- function(x) x^2
  test_env$another_function <- function(a, b) a + b

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  result <- environment_objects()
  expect_snapshot(result)
})

test_that("environment_objects snapshot with empty environment", {
  test_env <- new.env(parent = emptyenv())

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  result <- environment_objects()
  expect_snapshot(result)
})

# Test header function
test_that("header snapshot with multiple dataframes", {
  test_env <- new.env(parent = emptyenv())

  test_env$iris_subset <- data.frame(
    Sepal.Length = c(5.1, 4.9, 4.7),
    Sepal.Width = c(3.5, 3.0, 3.2),
    Petal.Length = c(1.4, 1.4, 1.3),
    Petal.Width = c(0.2, 0.2, 0.2),
    Species = c("setosa", "setosa", "setosa")
  )

  test_env$mtcars_subset <- data.frame(
    mpg = c(21.0, 21.0, 22.8),
    cyl = c(6, 6, 4),
    disp = c(160, 160, 108),
    hp = c(110, 110, 93)
  )

  test_env$simple_df <- data.frame(
    a = 1:3,
    b = c("x", "y", "z")
  )

  test_env$my_var <- 100
  test_env$my_func <- function(x) x

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  result <- header()
  expect_snapshot(result)
})

test_that("header snapshot with no dataframes", {
  test_env <- new.env(parent = emptyenv())

  test_env$var1 <- 42
  test_env$var2 <- "text"
  test_env$func1 <- function(x) x + 1

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  result <- header()
  expect_snapshot(result)
})

# Test environment_info function
test_that("environment_info snapshot with complete environment", {
  test_env <- new.env(parent = emptyenv())
  set.seed(42)
  test_env$analysis_data <- data.frame(
    id = 1:10,
    value = rnorm(10),
    category = rep(c("A", "B"), 5)
  )
  test_env$result_data <- data.frame(
    group = c("A", "B"),
    mean = c(0.5, -0.3)
  )
  test_env$threshold <- 0.05
  test_env$calculate_mean <- function(x) mean(x, na.rm = TRUE)

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = EXAMPLE_SCRIPT)
    },
    .package = "rstudioapi"
  )

  local_mocked_bindings(
    last_code = function() {
      "result_data <- analysis_data %>% group_by(category) %>% summarise(mean = calculate_mean(value))"
    }
  )

  local_mocked_bindings(
    geterrmessage = function() "Error in mean(x) : object 'x' not found",
    .package = "base"
  )

  local_mocked_bindings(
    loadedNamespaces = function() c("base", "stats", "graphics", "grDevices", "utils", "datasets", "methods", "testthat", "rainer", "dplyr", "ggplot2"),
    .package = "base"
  )

  result <- environment_info(error = TRUE)
  expect_snapshot(result)
})

test_that("environment_info snapshot without error message", {
  test_env <- new.env(parent = emptyenv())
  test_env$my_data <- data.frame(x = 1:5, y = letters[1:5])
  test_env$config <- list(setting1 = TRUE, setting2 = 100)

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = EXAMPLE_SCRIPT)
    },
    .package = "rstudioapi"
  )

  local_mocked_bindings(
    last_code = function() {
      "config <- list(setting1 = TRUE, setting2 = 100)"
    }
  )

  local_mocked_bindings(
    loadedNamespaces = function() c("base", "stats", "graphics", "utils", "testthat", "rainer"),
    .package = "base"
  )

  result <- environment_info(error = FALSE)
  expect_snapshot(result)
})

test_that("environment_info snapshot with minimal environment", {
  test_env <- new.env(parent = emptyenv())

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  local_mocked_bindings(
    getSourceEditorContext = function() {
      stop("Not in RStudio")
    },
    .package = "rstudioapi"
  )

  local_mocked_bindings(
    interactive = function() FALSE,
    .package = "base"
  )

  local_mocked_bindings(
    loadedNamespaces = function() c("base", "testthat", "rainer"),
    .package = "base"
  )

  result <- environment_info(error = FALSE)
  expect_snapshot(result)
})

test_that("environment_info snapshot with complex nested dataframes", {
  test_env <- new.env(parent = emptyenv())

  test_env$wide_data <- data.frame(
    col1 = 1:3, col2 = 4:6, col3 = 7:9, col4 = 10:12,
    col5 = 13:15, col6 = 16:18, col7 = 19:21, col8 = 22:24
  )

  test_env$mixed_types <- data.frame(
    id = 1:3,
    name = c("John", "Jane", "Bob"),
    score = c(85.5, 92.3, 78.9),
    passed = c(TRUE, TRUE, FALSE),
    date = as.Date(c("2025-01-01", "2025-01-02", "2025-01-03"))
  )

  test_env$text_processor <- function(text) toupper(text)
  test_env$counter <- 0

  local_mocked_bindings(
    .GlobalEnv = test_env,
    .package = "base"
  )

  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = EXAMPLE_SCRIPT)
    },
    .package = "rstudioapi"
  )

  local_mocked_bindings(
    last_code = function() {
      "mixed_types <- data.frame(id = 1:3, name = c('John', 'Jane', 'Bob'), score = c(85.5, 92.3, 78.9), passed = c(TRUE, TRUE, FALSE), date = as.Date(c('2025-01-01', '2025-01-02', '2025-01-03')))"
    }
  )

  local_mocked_bindings(
    geterrmessage = function() "",
    .package = "base"
  )

  local_mocked_bindings(
    loadedNamespaces = function() c("base", "stats", "utils", "testthat", "rainer"),
    .package = "base"
  )

  result <- environment_info(error = TRUE)
  expect_snapshot(result)
})

# Test current_script length limiting
test_that("current_script truncates long scripts correctly", {
  long_script <- paste0("line_", 1:250)

  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = long_script)
    },
    .package = "rstudioapi"
  )

  result <- current_script()

  # Should contain the omission message
  expect_true(grepl("lines omitted", result))

  # Should contain first line with correct line number
  expect_true(grepl("L1:line_1", result))

  # Should contain last line with correct original line number
  expect_true(grepl("L201:line_201", result))

  expect_true(grepl("L250:line_250", result))

  # Should not contain a middle line
  expect_false(grepl("L160:line_160", result))
})

test_that("current_script truncates long individual lines correctly", {
  long_line <- paste0(rep("a", 600), collapse = "")
  script_with_long_line <- c("normal line", long_line, "another normal line")

  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = script_with_long_line)
    },
    .package = "rstudioapi"
  )

  result <- current_script()

  # Should contain truncation marker
  expect_true(grepl("\\.\\.\\[line truncated\\]", result))

  # Normal lines should be unchanged
  expect_true(grepl("normal line", result))
})

test_that("current_script does not truncate short scripts", {
  local_mocked_bindings(
    getSourceEditorContext = function() {
      list(contents = EXAMPLE_SCRIPT)
    },
    .package = "rstudioapi"
  )

  result <- current_script()

  # Should not contain omission message
  expect_false(grepl("lines omitted", result))

  # Should contain all lines
  expect_true(grepl("library\\(dplyr\\)", result))
  expect_true(grepl("print\\(result_data\\)", result))
})
