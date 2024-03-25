library(palmerpenguins)
library(tidyverse)
library(jtools)

# grafico -----------------------------------------------------------------

penguins |>
  ggplot(
    aes(x = bill_depth_mm, y = bill_length_mm)
  ) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE)

# modelo ------------------------------------------------------------------

modelo <- lm(
  bill_length_mm ~ bill_depth_mm,
  data = penguins |>
    mutate(
      year = factor(year)
    ))

modelo |>
  summary()

# stargazer ---------------------------------------------------------------

stargazer(modelo, type = "text")

# jtools ------------------------------------------------------------------

summ(modelo)
