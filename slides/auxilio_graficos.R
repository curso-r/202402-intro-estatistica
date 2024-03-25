X <- seq(0.071, 0.079, 0.00001)

curva_normal <- tibble(
  X = X,
  densidade = dnorm(X, 0.077, sqrt(0.077*(1-0.077))/sqrt(180000))
)

curva_normal |>
  ggplot(aes(x = X, y = densidade)) +
  geom_line() +
  geom_vline(xintercept = 0.078, col = 'blue') +
  scale_x_continuous(
    breaks = seq(0.071, 0.078, 0.001),
    labels = seq(0.071, 0.078, 0.001)
    ) +
  theme_bw() +
  labs(x = "Possíveis médias amostrais",
       y = "Densidade Hipotética")

curva_normal |>
  ggplot(aes(x = X, y = densidade)) +
  geom_line() +
  geom_vline(xintercept = 0.078, col = 'blue') +
  geom
  scale_x_continuous(
    breaks = seq(0.071, 0.078, 0.001),
    labels = seq(0.071, 0.078, 0.001)
  ) +
  theme_bw() +
  labs(x = "Possíveis médias amostrais",
       y = "Densidade Hipotética")
