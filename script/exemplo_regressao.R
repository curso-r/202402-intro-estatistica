library(palmerpenguins)
library(tidyverse)
library(jtools)
library(tidyverse)

# grafico -----------------------------------------------------------------

penguins |>
  ggplot(
    aes(
      x = bill_depth_mm,
      y = bill_length_mm
    )
  ) +
  geom_point()

# grafico com reta --------------------------------------------------------

penguins |>
  ggplot(
    aes(x = bill_depth_mm, y = bill_length_mm)
  ) +
  geom_point() +
  geom_smooth(method = 'lm', se = FALSE) +
  geom_hline(yintercept = 43.92, color = 'red')

# modelo ------------------------------------------------------------------

modelo <- lm(
  bill_length_mm ~ bill_depth_mm,
  data = penguins)


# saída do R --------------------------------------------------------------

modelo |>
  summary()

# outras saidas -----------------------------------------------------------

coef(modelo)

confint(modelo)

predict(modelo)[1]
penguins$bill_length_mm[1]

predict(modelo, interval = "confidence")

hist(modelo$residuals, breaks = 20)

shapiro.test(modelo$residuals)

library(tune)

augment(modelo)

# stargazer ---------------------------------------------------------------

library(stargazer)

stargazer(modelo, type = "latex")

# jtools ------------------------------------------------------------------

summ(modelo)
