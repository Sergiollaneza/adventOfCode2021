
# Dependencies ------------------------------------------------------------

library(tidyverse)

input <- read_csv("input.txt", col_names = "Depth")


# Calculate number of increments -----------------------------------------------------------------

# Calculates the difference between one row and the previous one and filters out the negatives
increments <- input %>%
  mutate(Difference = Depth - lag(Depth)) %>%
  dplyr::filter(Difference > 0) %>%
  nrow()

# Answer: 1521


# Calculate number of increments on the sliding window --------------------

# All rows except the first and the last are in the middle of a window
slidingIncrements <- input %>%
  mutate(WindowValue = Depth + lag(Depth) + lead(Depth),
         Difference = WindowValue - lag(WindowValue)) %>%
  dplyr::filter(Difference > 0) %>%
  nrow()


# Answer: 1543





