hist(sort(medias_amostrais), probability = TRUE)

media_populacional <- mean(pop1$altura)
desv_pad <- sd(pop1$altura)

lines(
  sort(medias_amostrais),
  dnorm(
    sort(medias_amostrais),
    mean = media_populacional,
    sd = desv_pad/sqrt(n)
  ), col = 'red'
)


# Vida real ---------------------------------------------------------------

plot(type = 'l',
  sort(medias_amostrais),
  dnorm(
    sort(medias_amostrais),
    mean = mean(minha_amostra),
    # POSSO COLOCAR O AMOSTRAL!
    sd = sd(minha_amostra)/sqrt(n)
    # O AMOSTRAL!
  ),
  col = 'blue'
)


# população 2 -------------------------------------------------------------

n <- 5000

minha_amostra2 <- sample(x = pop2$altura, size = n, replace = TRUE)

plot(type = 'l',
     seq(1.84, 1.86, 0.0001),
     dnorm(
       seq(1.84, 1.86, 0.0001),
       mean = mean(minha_amostra2),
       # POSSO COLOCAR O AMOSTRAL!
       sd = sd(minha_amostra2)/sqrt(n)
       # O AMOSTRAL!
     ),
     col = 'purple'
)

lines(type = 'l',
     seq(1.84, 1.86, 0.0001),
     dnorm(
       seq(1.84, 1.86, 0.0001),
       mean = mean(pop2$altura),
       # POSSO COLOCAR O AMOSTRAL!
       sd = sd(pop2$altura)/sqrt(n)
       # O AMOSTRAL!
     ),
     col = 'red'
)


# pop3 --------------------------------------------------------------------

plot(type = 'l',
      seq(1.55, 1.56, 0.0001),
      dnorm(
        seq(1.55, 1.56, 0.0001),
        mean = mean(minha_amostra3),
        # POSSO COLOCAR O AMOSTRAL!
        sd = sd(minha_amostra3)/sqrt(n)
      ),
      col = 'purple'
)

lines(type = 'l',
     seq(1.53, 1.57, 0.0001),
     dnorm(
       seq(1.53, 1.57, 0.0001),
       mean = mean(pop3$altura),
       # POSSO COLOCAR O AMOSTRAL!
       sd = sd(pop3$altura)/sqrt(n)
     ),
     col = 'red'
)
