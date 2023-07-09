#Instalando os Pacotes para manipulação

install.packages("tidyverse")
install.packages("knitr")

#Carregar os pacotes instalados
library("tidyverse")

#Importando o arquivo em excel
base <- read.csv("BRA.csv",
                 sep = ",",
                 dec = ".")

#analisando os dados
glimpse(base)

#Iniciando o tratamento dos dados
base_novo <- base %>% 
    rename(Pais = 1,
          liga = 2,
          Temporada = 3,
          Data = 4,
          Hora = 5,
          Casa = 6,
          Visitante = 7,
          Gol_Casa = 8,
          Gol_Visitante = 9,
          Resultado = 10) %>% 
  mutate(base_novo,
         Resultado = recode(Resultado,
                            'D' = "Empate",
                            'H' = "Vitoria Casa",
                            'A' = "Vitoria Visitante")) %>% 
  select(-PH, -PD, -PA, -MaxH, -MaxD, -MaxA, -AvgH, -AvgD, -AvgA)
  
view(base_novo)
