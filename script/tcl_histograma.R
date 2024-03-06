
# Pacote ------------------------------------------------------------------

library(tidyverse)
library(readxl)

# populacoes --------------------------------------------------------------

pop1 <- read_excel("populacao1.xlsx")
pop2 <- read_excel("populacao2.xlsx")
pop3 <- read_excel("populacao3.xlsx")

# Distribuição populacional da pop1 ---------------------------------------

hist(pop1$altura)

# Minha Amostra -----------------------------------------------------------

n <- 5000

minha_amostra <- sample(x = pop1$altura, size = n, replace = FALSE)

hist(minha_amostra)


# Outras amostras possíveis -----------------------------------------------

numero_de_simulacoes <- 10000

amostras <- map(
  1:numero_de_simulacoes,
  function(x){
  sample(
    x = pop1$altura,
    size = n,
    replace = FALSE
  )
  }
)

medias_amostrais <- amostras |>
  map_dbl(mean)

hist(medias_amostrais)


# Minha amostra pop 2 -----------------------------------------------------

n <- 5000

minha_amostra2 <- sample(x = pop2$altura, size = n, replace = TRUE)

hist(minha_amostra2)
hist(pop2$altura)


# amostral pop2 -----------------------------------------------------------

numero_de_simulacoes <- 10000

amostras_pop2 <- map(
  1:numero_de_simulacoes,
  function(x){
    sample(
      x = pop2$altura,
      size = n,
      replace = TRUE
    )
  }
)

medias_amostrais_pop2 <- amostras_pop2 |>
  map_dbl(mean)

hist(medias_amostrais_pop2)

# Minha amostra pop 3 -----------------------------------------------------

n <- 5000

minha_amostra3 <- sample(x = pop3$altura, size = n, replace = TRUE)

hist(minha_amostra3)


# amostral pop3 -----------------------------------------------------------

numero_de_simulacoes <- 10000

amostras_pop3 <- map(
  1:numero_de_simulacoes,
  function(x){
    sample(
      x = pop3$altura,
      size = n,
      replace = TRUE
    )
  }
)

medias_amostrais_pop3 <- amostras_pop3 |>
  map_dbl(mean)

hist(medias_amostrais_pop3)

