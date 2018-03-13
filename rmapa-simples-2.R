### ---------------------------------------------------------------------------
### Título: Mapa simples em R com Shapefile (Parte 02)
### Autor: Ricardo Avancini
### e-mail: avancini.rf@gmail.com
### Repositório: https://github.com/avancinirf/rmapa-simples
### ---------------------------------------------------------------------------

# Selecionando o diretorio raiz para o script
setwd("C:/Users/Ricardo/Documents/SITE_POSTS/R/Mapa_simples/rmapa-simples")

install.packages("rgdal") # Instalação do pacote rgdal
library(rgdal) # Carregando o pacote rgdal

estados<-readOGR("data/estados_br", "UFEBRASIL", encoding = "utf8")

# Exibe os atributos presentes na tabela
estados@data

# exibe o mapa sem formatação
plot(estados)

# exibe o mapa colorindo os estados usando a paleta de cores padrão
plot(estados, col=estados@data$NM_ESTADO)

# exibe o mapa colorindo as regiões usando a paleta de cores padrão
plot(estados, col=estados@data$NM_REGIAO)

# Alterando a pelata padrão de cores
palette(c("tomato", "orange", "green4", "seagreen4", "khaki1"))

# Reexibindo os dados com as novas cores
plot(estados, col=estados@data$NM_REGIAO)

# Usando a biblioteca RColorBrewer, que possui paletas pré-definidas para elaboração de gráficos e mapas
library(RColorBrewer)

# Para exibir todas as paletas de cores existentes
brewer.pal.info

# Criando uma paleta de cores para um degrade com 5 opções
palette(brewer.pal(5,"Greens"))

plot(estados, col=estados@data$NM_REGIAO)


# Adicionando mais de uma camada de dados, pontos sobre o mapa existente
upa<-read.csv("data/upa.csv",sep = ";", header = T, stringsAsFactors = F)

# Criando o SpatialPointsDataFrame a partir da tabela. As colunas 14 e 15 são as coordenadas x e y respectivamente
pontos_upa<-SpatialPointsDataFrame(upa[,14:15],upa)

plot(pontos_upa, add=T)


