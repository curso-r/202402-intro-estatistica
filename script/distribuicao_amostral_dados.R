# Como construi a base ----------------------------------------------------

# dado_vermelho_x10 <- sample(1:6, size = 10, replace = TRUE)
#
# dado_branco_x10  <- sample(1:6, size = 10, replace = TRUE)
#
# amostra_soma <- dado_vermelho_x10 + dado_branco_x10

# isso é um exemplo ^

# Respondendo as perguntas ------------------------------------------------

minha_amostra <- readxl::read_excel("dados/dados_do_meu_amigo_casa.xlsx")

simulacoes <- readxl::read_excel(
  "dados/simulacao_1000_amostras_tamanho_10.xlsx",
  sheet = "soma_dos_dados")

# quantos % das amostras não vejo 6?

simulacoes |>
  mutate(
    nenhum_6 = (lancamento_1 != 6) &
      (lancamento_2 != 6) &
      (lancamento_3 != 6) &
      (lancamento_4 != 6) &
      (lancamento_5 != 6) &
      (lancamento_6 != 6) &
      (lancamento_7 != 6) &
      (lancamento_8 != 6) &
      (lancamento_9 != 6) &
      (lancamento_10 != 6)
  ) |>
  count(nenhum_6)

238/(238+762)
# 23%

# ou seja, é comum ver pelo menos 1 número 6

