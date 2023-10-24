
# Instala y carga las bibliotecas necesarias
# install.packages("httr")
# install.packages("rjson")
# install.packages("readxl")
# install.packages("RSocrata")
library(dplyr)
library(httr)
library(rjson)
library(tidyverse)
library(readxl)
library(RSocrata)
library(dplyr)

# PUNTO A
# Lee cada una de las bases de datos dadas, para los datos que vienen de datos abiertos, debe usarse el API respectivo
data_hurto_personas <- read.socrata('https://www.datos.gov.co/resource/4rxi-8m8d.json?$limit=300000')
data_hurto_comercio <- read.socrata('https://www.datos.gov.co/resource/7i2x-h5vp.json?$limit=300000')
data_hurto_entidades_financieras <-read.socrata('https://www.datos.gov.co/resource/i7h7-wmjc.json?$limit=300000')

# Cargar datos de PIB desde archivo local
url_pib_departamentos <- "C:/Users/Acer/Desktop/VISA/CAMILA/PIBDep-TotalDepartamento.xlsx"
data_pib_departamentos <- readxl::read_xlsx(url_pib_departamentos, sheet = 'Cuadro 3', skip = 8)


# Cargar datos de proyección poblacional desde archivo local
url_proyeccion_poblacional <- "C:/Users/Acer/Desktop/VISA/CAMILA/area-proypoblacion1950-2019.xlsx"
data_proyeccion_poblacional <- readxl::read_xlsx(url_proyeccion_poblacional, skip = 11)


# PUNTO B
# Utiliza la información de cada una de las bases de datos para construir una base de datos que contenga, 
# por municipio la cantidad de hurtos, el producto interno bruto y la proyección poblacional por años.


# Unir datos de hurto a personas, PIB y proyección poblacional por municipio y año
data_municipios <- data_hurto_personas %>%
  left_join(data_pib_departamentos, by = c("municipio", "año")) %>%
  left_join(data_proyeccion_poblacional, by = c("municipio", "año"))


