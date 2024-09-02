
# Dados -------------------------------------------------------------------

dados_rolagens <- readRDS("dados/experimento_dado.rds")


# Fazendo contagens -------------------------------------------------------

X <- dados_rolagens$resultado

table(X)
# é o jeito de contar do R básico

contagens <- dados_rolagens |>
  count(resultado)
# esse é o jeito do tidyverse

# Fazer o gráfico ---------------------------------------------------------

# Jeito 1
contagens |>
  ggplot(aes(x = resultado, y = n)) +
  geom_col(fill = "royalblue") +
  theme_bw() +
  labs(x = "Resultado do dado", y = "Frequência do resultado")
# esse é o jeito com ggplot que é bom porque é flexível

# Jeito 2
dados_rolagens |>
  ggplot(aes(x = resultado)) +
  geom_bar(fill = "royalblue") +
  theme_bw() +
  labs(x = "Resultado do dado", y = "Frequência do resultado")

# dados de temperatura ----------------------------------------------------

dados_temperatura <- readRDS("dados/chuvas_A701.rds")

dados_temperatura |>
  ggplot(aes(x = `Tair_mean (c)`)) +
  geom_bar() +
  theme_bw()

dados_temperatura |>
  count(`Tair_mean (c)`)


# Como fazer histogramas em R ---------------------------------------------

# Jeito 1: ggplot2

min(dados_temperatura$`Tair_mean (c)`)
max(dados_temperatura$`Tair_mean (c)`)

(25.15-16.75833)/5

dados_temperatura |>
  ggplot(aes(x = `Tair_mean (c)`)) +
  geom_histogram(
     bins = 5
  )
# quebra as faixas uniformemente entre o minimo e maximo

dados_temperatura |>
  ggplot(aes(x = `Tair_mean (c)`)) +
  geom_histogram(
    fill = "royalblue",
    color = "white",
    binwidth = 1,
    center = 0.5
  ) +
  scale_x_continuous(
    breaks = seq(16, 26),
    minor_breaks = 1) +
  theme_bw()
# quebra as faixas de acordo com a interpretação da faixa

# Jeito 2: R básico

hist(dados_temperatura$`Tair_mean (c)`, breaks = "Sturges")

# o R básico mistura uma fórmula pro numero de quebras
# com um número "bonitinho"
nclass.Sturges

ceiling(log2(31)+1)

### existem outros jeitos de criar faixas?

hist(dados_temperatura$`Tair_mean (c)`, breaks = "FD")

# Comparação com histogramas ----------------------------------------------

dados_peso <- readRDS("dados/dados_pesos.rds")

hist(dados_peso$wt)

dados_peso |>
  ggplot(aes(x = wt)) +
  geom_histogram()
# começou feio

dados_peso |>
  ggplot(aes(x = wt)) +
  geom_histogram(
    binwidth = 5, center = 2.5, fill = 'royalblue', color = 'white'
  )

dados_peso |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    binwidth = 5, center = 2.5, color = 'white'
  )

dados_peso |> count(genero)

dados_peso |>
  ggplot(aes(x = wt, fill = genero)) +
  geom_histogram(
    binwidth = 5, center = 2.5, color = 'white', position = 'dodge'
  )

# criando nosso proprio grafico de contagens para histograma --------------

dados_peso |>
  mutate(
    faixa_peso = cut(wt, seq(0, 100, 5))
  ) |>
  count(genero, faixa_peso) |>
  group_by(genero) |>
  mutate(
    p = n/sum(n)
  ) |>
  ggplot(aes(x = faixa_peso, y = p, fill = genero)) +
  geom_col(position = 'dodge') +
  scale_y_continuous(labels = scales::percent) +
  theme_minimal()
# fazendo na mão


# Histogramas de variaveis qualitativas? ----------------------------------

dados_peso |>
  mutate(
    genero = factor(genero, c("Mulher", "Homem"))
  ) |>
  ggplot(aes(x = genero)) +
  geom_bar()

# sim! mas o R precisa ou receber ou criar uma ordem
# entre os valores para conseguir plotar no X
