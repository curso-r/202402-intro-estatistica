# install.packages("palmerpenguins")
library(palmerpenguins)
library(tidyverse)

penguins %>% ggpairs(mapping = aes(colour = species))

penguins |>
  ggplot(
    aes(x = bill_depth_mm, y = bill_length_mm)
  ) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)


lm(
  bill_length_mm ~ bill_depth_mm,
  data = penguins |>
    mutate(
      year = factor(year)
    )) |>
  summary()
