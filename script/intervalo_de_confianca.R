library(infer)

sample_mean <- dados %>%
  specify(response = p32c, success = "Sim") %>%
  calculate(stat = "prop")
# esse aqui ^ você consegue ler o código
# ele diz o que tá fazendo

#mean(dados$p32c == "Sim")
#sum(dados$p32c == "Sim")/2079
# esse aqui vc tem que interpretar o código ^

# define a sampling distribution
sampling_dist <- dados %>%
  specify(response = p32c, success = "Sim") %>%
  assume("z")
# assume 'z' eu tô mandando o R entender
# que pra tudo que seguir eu quero que seja
# considerada uma distribuição teórica normal

# get the confidence interval---note that the
# point estimate is required here
ci <- get_confidence_interval(
  sampling_dist,
  level = .95,
  point_estimate = sample_mean
)

sqrt(sample_mean*(1-sample_mean))/sqrt(2079)

sampling_dist |>
  visualise() +
  shade_confidence_interval(ci)

# distribuição t ----------------------------------------------------------

library(infer)

sample_mean <- dados %>%
  specify(response = idade1) %>%
  calculate(stat = "mean")

# define a sampling distribution
sampling_dist <- dados %>%
  specify(response = idade1) %>%
  assume("t")

# get the confidence interval---note that the
# point estimate is required here
ci <- get_confidence_interval(
  sampling_dist,
  level = .95,
  point_estimate = sample_mean
)

sampling_dist |>
  visualise() +
  shade_confidence_interval(ci)

# distribuicao t amostra pequena ------------------------------------------

library(infer)

sample_mean <- dados %>%
  sample_n(5) |>
  specify(response = idade1) %>%
  calculate(stat = "mean")

# define a sampling distribution
sampling_dist <- dados %>%
  sample_n(5) |>
  specify(response = idade1) %>%
  assume("t")

# get the confidence interval---note that the
# point estimate is required here
ci <- get_confidence_interval(
  sampling_dist,
  level = .95,
  point_estimate = sample_mean
)

sampling_dist |>
  visualise() +
  shade_confidence_interval(ci)

