# Константы
TITLE = "Место на диске"
DATA_PATH = "./data.csv"
OUTPUT_PATH = "./tests.html"

openHTML <- function(x) browseURL(paste0('file://', file.path(getwd(), x)))

visualize <- function(data){
  library(ggplot2)
  library(RColorBrewer)
  library(htmlwidgets)
  library(plotly)
  
  # Создайте круговую диаграмму
  fig <- plot_ly(type='pie', labels=data$category, values=data$values, 
                 textinfo='label+percent',
                 insidetextorientation='radial')
  
  fig
  saveWidget(fig, file = OUTPUT_PATH)
  openHTML(OUTPUT_PATH)
}

data <- read.csv(DATA_PATH, header = FALSE, sep = ";")
data$category = data$V1
data$values = as.numeric(data$V2)
visualize(data)