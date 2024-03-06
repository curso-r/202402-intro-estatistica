# Pacotes -----------------------------------------------------------------

library(tidyverse)
library(purrr)

# Simulacao no R ----------------------------------------------------------

# Dados -------------------------------------------------------------------

numero_de_simulacoes <- 10000
espaco_amostral <- 1:6
tamanho_da_amostra <- 100

amostras <- map(1:numero_de_simulacoes,
           sample,
           x = espaco_amostral,
           size = tamanho_da_amostra)

medias <- map_dbl(amostras, mean)

tabela <- tibble(medias)

tabela |>
  ggplot(aes(x = medias)) +
  geom_histogram(
    fill = 'royalblue', color = 'white',
    bins = floor(numero_de_simulacoes^(1/3))
  ) +
  theme_bw(15) +
  labs(x = "Médias", y = "Contagem")

# Dados + Normal ----------------------------------------------------------

tabela |>
  ggplot(aes(x = medias,  after_stat(density))) +
  geom_histogram(
    fill = 'royalblue', color = 'white',
    bins = floor(numero_de_simulacoes^(1/3))
  ) +
  theme_bw(15) +
  labs(x = "Médias", y = "Densidade")

media <- mean(medias)
sd <- sd(medias)

tabela |>
  mutate(
    normal = dnorm(medias, media, sd)
  ) |>
  ggplot(aes(x = medias,  after_stat(density))) +
  geom_histogram(
    fill = 'royalblue', color = 'white',
    bins = floor(numero_de_simulacoes^(1/3))
  ) +
  theme_bw(15) +
  geom_line(aes(x = medias, y = normal),
            color = 'red', size = 3) +
  labs(x = "Médias", y = "Densidade")


