# simulacoes --------------------------------------------------------------

# vou simular a confiança
# do intervalo x_barra -1% até x_barra +1%

# preciso saber a distribuição amostral do x_barra

# o teorema central do limite garante que o x_barra

# tem média igual a média populacional

# e desvio padrão igual ao desvio padrão populacional

# dividido por raiz n

media_populacional = 1/100

N = 100

# pra proporção o desvio padrao populacional tem uma fórmula:

desvio_padrao_x_barra = sqrt(
  media_populacional*(1-media_populacional)
)/sqrt(N)

amostra_xb = rnorm(
  10000,
  mean = media_populacional,
  sd = desvio_padrao_x_barra)

# mean((amostra_xb < 0)| ((amostra_xb-1/100) < 1/100) & (amostra_xb+1/100) >1/100))

mean(amostra_xb <= 2/100)
# fazendo por simulação

# mas podemos fazer a conta diretamente tb

pnorm(
  2/100,
  mean = media_populacional,
  sd = desvio_padrao_x_barra)



# pra outras médias populacionais a confiança seria igual? ----------------


media_populacional = 50/100

N = 100

# pra proporção o desvio padrao populacional tem uma fórmula:

desvio_padrao_x_barra = sqrt(
  media_populacional*(1-media_populacional)
)/sqrt(N)

amostra_xb = rnorm(
  10000,
  mean = media_populacional,
  sd = desvio_padrao_x_barra)

mean(
  ((amostra_xb-1/100) < 50/100) &
  ((amostra_xb+1/100) > 50/100)
)




x_barra <- rnorm(10000, 0.5, sd = 0.05)
sigma_chapeu <- sqrt(x_barra*(1-x_barra))/sqrt(100)

mean(
  (x_barra+2*sigma_chapeu) > 0.5 &
  (x_barra-2*sigma_chapeu < 0.5)
)

x_barra <- rnorm(10000, 0.02, sd = sqrt(0.02*(1-0.02))/sqrt(1000))
sigma_chapeu <- sqrt(x_barra*(1-x_barra))/sqrt(100)

mean(
  (x_barra+2*sigma_chapeu) > 0.01 &
    (x_barra-2*sigma_chapeu < 0.01)
)
