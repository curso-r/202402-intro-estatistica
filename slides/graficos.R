populacao <- c(15,
18,
21,
65,
43,
50,
23,
22,
61,
10,
11,
14,
31,
21,
50,
22,
32,
91)

medias_amostrais <- purrr::map_dbl(1:1000000,
                           function(x){
                             mean(sample(populacao, size = 8))
                           })


exemplos_de_medias <- tibble::tibble(
  exemplos = c(medias_amostrais[1:2], 33.3375, 27.75)
)

library(tidyverse)

sd(populacao)/sqrt(8)

tibble(
  medias = medias_amostrais
) |>
  ggplot() +
  geom_histogram(aes(x = medias), bins = 100) +
  #geom_vline(aes(xintercept = exemplos), linetype = 2) +
  geom_vline(xintercept = 33.33, color = 'red', size = 2) +
  geom_vline(xintercept = 33.33-7.861859, color = 'darkgreen', size = 2) +
  geom_vline(xintercept = 33.33+7.861859, color = 'darkgreen', size = 2) +
  labs(x = "Médias amostrais", y = "Contagem")

tibble(
  medias = populacao
) |>
  ggplot() +
  geom_histogram(aes(x = medias),boundary = 0, bins = 4) +
  #geom_vline(aes(xintercept = exemplos), linetype = 2) +
  #geom_vline(xintercept = 33.33, color = 'red', size = 2) +
  labs(x = "Idade da população", y = "Contagem")


hist(amostras, breaks = 100)

amostras_por_tamanho = NULL

for(size in 4:15){

  print(size)
  amostras_por_tamanho <- bind_rows(
    amostras_por_tamanho,
    tibble(
      tamanho = size,
      amostras = purrr::map_dbl(1:100000,
                                   function(x){
                                     mean(sample(populacao, size = size))
                                   })))
}

amostras_por_tamanho |>
  ggplot(aes(x = amostras, y = factor(tamanho))) +
  ggridges::geom_density_ridges2() +
  geom_vline(xintercept = 33.33, col = 'red', size = 2) +
  labs(x = "Médias amostrais", y = "Tamanho de amostra")

amostras_por_tamanho |>
  group_by(tamanho) |>
  summarise(
    desvio_padrao_media = sd(amostras)
  ) |>
  mutate(
    curva_teorica = sd(populacao)/sqrt(tamanho)
  ) |>
  ggplot(aes(x = tamanho, y = desvio_padrao_media)) +
  geom_line() +
  geom_line(aes(y  = curva_teorica), color = 'red')
