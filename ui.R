# ui.R  

library(shiny)  
library(shinydashboard)  

# 创建 UI 对象  
dashboardPage(  
  # 仪表板头部  
  dashboardHeader(title = "驾驶舱看板"),  
  
  # 侧边栏  
  dashboardSidebar(  
    sliderInput("year", "选择年份：", min = 2010, max = 2020, value = 2015),  
    selectInput("country", "选择国家：", choices = c("China", "USA", "Japan", "Germany"), selected = "China")  
  ),  
  
  # 主体内容  
  dashboardBody(  
    # 第一行：销售额和产品销量图表  
    fluidRow(  
      box(  
        title = "年度销售额",  
        plotOutput("sales_plot"),  
        status = "primary",  
        solidHeader = TRUE  
      ),  
      box(  
        title = "产品销量",  
        plotOutput("product_plot"),  
        status = "success",  
        solidHeader = TRUE  
      )  
    ),  
    
    # 第二行：客户分布和最新订单表  
    fluidRow(  
      box(  
        title = "客户分布",  
        plotOutput("customer_plot"),  
        status = "info",  
        solidHeader = TRUE  
      ),  
      box(  
        title = "最新订单",  
        tableOutput("order_table"),  
        status = "warning",  
        solidHeader = TRUE  
      )  
    ),  
    
    # 分隔线  
    tags$hr(),  
    
    # 关键指标部分  
    h3("关键指标"),  
    fluidRow(  
      # 销售额  
      column(4, tags$div(style="text-align:center;", tags$h1(tags$b(tags$span(id="total_sales"))))),  
      # 利润  
      column(4, tags$div(style="text-align:center;", tags$h1(tags$i(tags$span(id="profit"))))),  
      # 客户数量  
      column(4, tags$div(style="text-align:center;", tags$h1(tags$em(tags$span(id="customers")))))  # 确保这里的闭合括号正确  
    )  # 确保fluidRow的闭合括号  
  )  # 确保dashboardBody的闭合括号  
)  # 确保dashboardPage的闭合括号