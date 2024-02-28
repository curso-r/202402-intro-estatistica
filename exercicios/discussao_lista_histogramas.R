#Classifique de acordo com o tipo de variável
#as variáveis primeiro_andar_area, segundo_andar_area e
#geral_qualidade e moradia_estilo

casas <- dados::casas

casas |>
  select(primeiro_andar_area, segundo_andar_area,
         geral_qualidade, moradia_estilo) |>
  View()

# primeiro_andar_area

# conceitualmente quantitativa contínua porque
# embora esteja em m2 eu posso interpretar
# em outras unidade de distancia bem pequenas

# segundo_andar_area
# aqui é legal pensar que é mista (pode ser mista
# qualitativa não ordinal + quantitativa contínua ou
# quantitativa discreta + qualitativa não ordinal)

mean(casas$segundo_andar_area)

casas |>
  filter(moradia_estilo == "dois andares") |>
  pull(segundo_andar_area) |>
  mean()

median(casas$segundo_andar_area)

casas |>
  filter(moradia_estilo == "dois andares") |>
  pull(segundo_andar_area) |>
  median()

# Ex 4 item c)

casas

# histograma de densidade que fosse comparar
# primeiro_andar_area dos apartamentos por ex
# acima da média vs na média (e outras comparações)

hist(casas$primeiro_andar_area)

# round(log(2930, base = 2))
# o padrão do R é tipo esse ^

# outra opção é round(sqrt(2930))

casas |>
  ggplot(aes(x = primeiro_andar_area)) +
  geom_histogram(
    bins = 11
  )

# como posso comparar histogramas

casas |>
  filter(geral_qualidade == "boa") |>
  ggplot(aes(x = primeiro_andar_area)) +
  geom_histogram(
    bins = 11
  )

casas |>
  filter(
    str_detect(geral_qualidade, "abaixo da")
    ) |>
  ggplot(aes(x = primeiro_andar_area)) +
  geom_histogram(
    bins = 11
  )

# dá pra ver tudo junto e comparar?

casas |>
  ggplot(aes(x = primeiro_andar_area)) +
  geom_histogram(
    aes(y = after_stat(density)),
    bins = 11
  ) +
  facet_wrap(~geral_qualidade)

# outro jeito fazer:

casas |>
  ggplot(aes(x = primeiro_andar_area)) +
  geom_histogram(
    #aes(y = after_stat(density)),
    bins = 11
  ) +
  facet_wrap(~geral_qualidade,
             scales = 'free_y')
