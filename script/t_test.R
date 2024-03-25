library(tidyverse)

dados <- readxl::read_excel("script/BD_CIS0684.xlsx")

dados |>
  filter(
    sexo == "Feminino"
  ) |>
  prop_test(p32c ~ NULL, p = 0.3, success = "Sim")

dados |>
  filter(
    sexo == "Feminino"
  ) |>
  t_test(idade1 ~ NULL, mu = 42)

# a diferença entre esses dois testes é que
# o teste t calcula o valor-p (compara a média observada
# com o que esperaria de outras amostras) a partir
# de uma distribuição t de student, com mais
# dispersão do que a normal

dados |>
  filter(
    sexo == "Feminino"
  ) |>
  t_test(idade1 ~ NULL, mu = 41)


# plotar o teste-t --------------------------------------------------------

modelo <- dados |>
  filter(sexo == "Feminino") |>
  specify(response = idade1)

estatistica <- modelo |>
  hypothesize(null = "point", mu = 41) |>
  calculate(stat = "t")

modelo |>
  assume("t") |>
  visualise() +
  shade_p_value(obs_stat = estatistica, direction = "both")

