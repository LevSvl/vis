# constants
TITLE = "Место на диске"
#
#library(Rcpp)
# импортируем функцию на C++ 
#sourceCpp('D:/projects/Rprojects/vis/rapi.cpp')

library <- dyn.load("D:/projects/Rprojects/vis/sourceCpp_11.dll")

rapi_fun <- getNativeSymbolInfo("visargs", library)
df <- visargs()

visualize <- function(data){
  library(ggplot2)
  library(RColorBrewer)
  library(htmlwidgets)
  library(plotly)
  
  
  
  # Создайте данные
  #data <- data.frame(
  #  category = keys ,
  #  value = vals
  #)
  
  
  # Преобразуйте столбец value в числовой тип данных
  data$value <- as.numeric(data$value)
  
  # Создайте круговую диаграмму
  fig <- plot_ly(type='pie', labels=data$category, values=data$values, 
                 textinfo='label+percent',
                 insidetextorientation='radial')
  
  fig
  
  saveWidget(fig, file = "test.html")
}

visualize(df)