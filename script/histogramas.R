library(tidyverse)

# Dados de clima ----------------------------------------------------------

chuvas <- readRDS("dados/chuvas_A701.rds")

# Dados de peso -----------------------------------------------------------

dados_pesos <- readRDS("dados/dados_pesos.rds")

# Histogramas -------------------------------------------------------------

X <- chuvas$`Tair_mean (c)`

# Jeito 1: R básico -------------------------------------------------------

hist(X)

# Os histogramas do R (tanto do R básico)
# quanto do ggplot2 usam faixas de
# tamanho igual. faixas uniformes

min(X)
max(X)

numero_de_colunas <- 10
# contamos na mão!

tamanho_da_faixa <- (max(X)-min(X))/numero_de_colunas

tamanho_da_faixa

#primeira faixa
min(X)
#começa em

min(X)+tamanho_da_faixa
# termina em

# segunda faixa

min(X)+tamanho_da_faixa
# começa em

min(X)+2*tamanho_da_faixa
# termina em

# Como o R escolhe o número de colunas?
?hist

# por padrão o R usa um chute inicial
# do numero de quebras pela fórmula:
ceiling(log2(length(X))+1)

hist(X, breaks = 6)

# Jeito 2: ggplot2

chuvas |>
  ggplot(aes(x =`Tair_mean (c)`)) +
  geom_histogram(
    color = "white"
  )
# padrão do ggplot é usar 30

chuvas |>
  ggplot(aes(x =`Tair_mean (c)`)) +
  geom_histogram(
    color = "white",
    bins = 7
  )

chuvas |>
  ggplot(aes(x =`Tair_mean (c)`)) +
  geom_histogram(
    color = "white",
    bins = 7
  )

hist(X)

# Histograma para comparações ---------------------------------------------

dados_pesos |>
  count(genero)

dados_pesos |>
  ggplot(aes(x = wt)) +
  geom_histogram(
    bins = ceiling(log2(150)+1),
    color = 'white',
    fill = 'royalblue'
  ) +
  theme_bw(15) +
  facet_wrap(~genero)

dados_pesos |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    aes(y = ..density..),
    bins = ceiling(log2(150)+1),
    color = 'white'
  ) +
  theme_bw(15) +
  facet_wrap(~genero, nrow = 2) +
  theme(legend.position = 'bottom')

dados_pesos |>
  filter(genero != "Homem") |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    aes(y = ..density..),
    bins = 7,
    color = 'white'
  ) +
  theme_bw(15) +
  facet_wrap(~genero, nrow = 2) +
  theme(legend.position = 'bottom')

dados_pesos |>
  filter(genero != "Mulher") |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    aes(y = ..density..),
    bins = 9,
    color = 'white'
  ) +
  theme_bw(15) +
  facet_wrap(~genero, nrow = 2) +
  theme(legend.position = 'bottom')

dados_pesos |>
  group_by(genero) |>
  summarise(
    wt_max = max(wt),
    wt_min = min(wt)
  )

(15/50)/(4.55)

dados_pesos |>
  #filter(genero != "Homem") |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_density(
    #aes(y = ..density..),
    bins = 7,
    color = 'white'
  ) +
  theme_bw(15) +
  facet_wrap(~genero, nrow = 2) +
  theme(legend.position = 'bottom')
