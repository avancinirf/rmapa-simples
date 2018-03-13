
### ---------------------------------------------------------------------------
### Título: Mapa simples em R com CSV (Parte 01)
### Autor: Ricardo Avancini
### e-mail: avancini.rf@gmail.com
### Repositório: https://github.com/avancinirf/rmapa-simples
### ---------------------------------------------------------------------------

# Selecionando o diretorio raiz para o script
setwd("C:/Users/Ricardo/Documents/SITE_POSTS/R/Mapa_simples/rmapa-simples")

install.packages("sp") # Instalação do pacote sp
library(sp) # Carregando o pacote sp

### ---------------------------------------------------------------------------
### Criando SpatialPoints (apenas pontos)
### ---------------------------------------------------------------------------

# Criando um data.frame chamado coordenadas para armazenar a longitude (x) e latitude (y) dos pontos
coordenadas<-data.frame(x=c(-43.292779, -43.293451, -43.265706, -43.232255), 
                        y=c(-22.947238, -22.969617, -22.976172, -22.971990))

# proj4string define o sistema de coordenadas dos pontos
pontos<-SpatialPoints(coordenadas,proj4string=CRS("+init=epsg:4326"))

# Plotando os pontos no mapa
plot(pontos)



### ---------------------------------------------------------------------------
### Criando SpatialPointsDataFrame (pontos com atributos)
### ---------------------------------------------------------------------------

# Criando um data.frame chamado coordenadas para armazenar a longitude (x), latitude (y) e atributos dos pontos
# Passar primeiro as coordenadas e depois os atributos
coordenadas2<-data.frame(x=c(-43.292779, -43.293451, -43.265706, -43.232255), 
                        y=c(-22.947238, -22.969617, -22.976172, -22.971990),
                        nome=c("Morro das Gaivotas", "Gruta das Almas", "Pico do Cunha", "Riacho Grande"),
                        altitude=c(125.45, 234.0, 879.0, 58.31), stringsAsFactors = FALSE)

# proj4string define o sistema de coordenadas dos pontos
pontos2<-SpatialPointsDataFrame(coordenadas2[,1:2], coordenadas2[,3:4], proj4string=CRS("+init=epsg:4326"))
plot(pontos2)

# Plotando os atributos no mapa
text(pontos2@coords,pontos2@data$nome)

# Acessando as coordenadas
pontos2@coords

# Acessando apenas alongitude das coordenadas
pontos2@coords[,2]

# Acessando os atributos
pontos2@data

# Acessando apenas um atributo específico
pontos2@data$nome
pontos2@data[,1]
pontos2@data$altitude
pontos2@data[,2]



### ---------------------------------------------------------------------------
### Criando SpatialPointsDataFrame (pontos com atributos) usando arquivo .CSV
### ---------------------------------------------------------------------------

# Carregar a tabela
upa<-read.csv("data/upa.csv",sep = ";", header = T, stringsAsFactors = F)

# Visualizar os dados como tabela
View(upa)

# Criando o SpatialPointsDataFrame a partir da tabela. As colunas 14 e 15 são as coordenadas x e y respectivamente
pontos_upa<-SpatialPointsDataFrame(upa[,14:15],upa)

# Plotando os dados
plot(pontos_upa)





