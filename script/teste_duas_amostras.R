# duas amostras -----------------------------------------------------------

prop_test(dados,
          p32c ~ sexo,
          order = c("Masculino", "Feminino"))

t_test(dados,
          idade1 ~ sexo,
          order = c("Masculino", "Feminino"))
