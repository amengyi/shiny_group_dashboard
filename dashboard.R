# install.packages(c("shiny", "shinydashboard", "ggplot2", "dplyr", "DT"))

library(shiny)

# 加载 UI 和 Server 文件
#source("C:/Users/hp440/Desktop/Tools/shiny_group_dashboard/ui.R")
#source("C:/Users/hp440/Desktop/Tools/shiny_group_dashboard/server.R")

source("ui.R")
source("server.R")

# 创建并启动 Shiny 应用
shinyApp(ui = ui, server = server)
