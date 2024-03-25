# Teste de proporção no R -------------------------------------------------

numero_desemprego_pnad_2024 = 0.078*180000

prop.test(
  x = 14040,
  n = 180000,
  p = 0.077,
  alternative = "two.sided")

prop.test(
  x = 14040,
  n = 180000,
  p = 0.077,
  alternative = "greater")

# Área da normal no R -----------------------------------------------------

?pnorm

1-pnorm(
  0.078,
  0.077,
  sqrt(0.077*(1-0.077))/sqrt(180000)
  )

# Ler dados ---------------------------------------------------------------

library(tidyverse)

dados <- readxl::read_excel("script/BD_CIS0684.xlsx")

p32c_mulheres <- dados |>
  filter(sexo == "Feminino") |>
  count(p32c)

prop.test(
  x = 294,
  n = 1089,
  p = 0.22
)

prop.test(
  x = p32c_mulheres$n[2],
  n = sum(p32c_mulheres$n),
  p = 0.26
)

p32c_homens <- dados |>
  filter(sexo == "Masculino") |>
  count(p32c)

prop.test(
  x = p32c_homens$n[2],
  n = sum(p32c_homens$n),
  p = 0.26
)

# pergunta do helder, porque testamos a segunda categoria?
# porque colocamos "[2]"?

# porque queremos testar a probabilidade de "sim"

# daria pra testar a probabilidade de "não" também:

prop.test(
  x = p32c_homens$n[1],
  n = sum(p32c_homens$n),
  p = 0.74
)

# cálculo correto
library(survey)
#
dclus1<-svydesign(id=~nquest, weights=~PESO, data=dados)

dclus_mulheres <- svydesign(
  id=~nquest,
  weights=~PESO,
  data=filter(dados, sexo == "Feminino")
  )

tabela_contagem <- svytable(~p32c, dclus_mulheres)

prop.test(tabela_contagem, p = 0.74)
# o proptest aceita tabelas de survei se precisar!

# Tidy test ---------------------------------------------------------------

library(infer)

dados |>
  filter(
    sexo == "Feminino"
  ) |>
  prop_test(p32c ~ NULL, p = 0.3, success = "Sim")
# essa função é alternativa ao prop.test padrão do R
# que aceita tabelas diretamente como input

# pra gente não precisar fazer contagem na mão

modelo <- dados |>
  filter(sexo == "Feminino") |>
  specify(response = p32c, success = "Sim")

estatistica <- modelo |>
  hypothesize(null = "point", p = 0.3) |>
  calculate(stat = "z")

grafico_ggplot <- modelo |>
  assume("z") |>
  visualise() +
  shade_p_value(obs_stat = estatistica, direction = "both")

grafico_ggplot +
  labs(caption = "valor-p calculado de 3,32%") +
  theme_bw() +
  labs(x = "Valor da estatística do teste", y = "",
       title = "Distribuição amostral teórica")

?infer::prop_test
