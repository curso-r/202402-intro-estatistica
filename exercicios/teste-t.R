library(infer)

modelo <- dados %>%
  filter(sexo == "Feminino") |>
  specify(response = idade1)

sample_mean <- modelo %>%
  calculate(stat = "mean")

# define a sampling distribution
sampling_dist <- modelo %>%
  assume("t")

estatistica <- modelo |>
  hypothesize(null = "point", mu = 41) %>%
  calculate(stat = "t")

sampling_dist |>
  visualise() +
  shade_p_value(obs_stat = estatistica, direction = "both")


# teste-t amostra pequena -------------------------------------------------

modelo2 <- dados %>%
  filter(sexo == "Feminino") |>
  head(5) |>
  specify(response = idade1)

sample_mean <- modelo2 %>%
  calculate(stat = "mean")

# define a sampling distribution
sampling_dist2 <- modelo2 %>%
  assume("t")

estatistica2 <- modelo2 |>
  hypothesize(null = "point", mu = 41) %>%
  calculate(stat = "t")

sampling_dist2 |>
  visualise() +
  shade_p_value(obs_stat = estatistica2, direction = "both")

