library(tidyverse)

dados <- readxl::read_excel("script/BD_CIS0684.xlsx")

dados |>
  filter(
    sexo == "Feminino"
  ) |>
  t_test(idade1 ~ NULL, mu = 0)

dados |>
  filter(
    sexo == "Feminino"
  ) |>
  lm(idade1 ~ 1, data = _) |>
  summary()

# nesse casi ^ a hipótese da regressão é que (y_i - \bar{y})
# tem distribuição normal e isso é verdade também
# no caso de amostragem simples, por conta do teorema
# central do limite.

modelo_regressao <- dados |>
  filter(
    sexo == "Feminino"
  ) |>
  lm(idade1 ~ 1, data = _)

hist(residuals(modelo_regressao))
