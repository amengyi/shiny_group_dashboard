# server.R  
library(shiny)  
library(ggplot2)  # 用于生成图表  

# 定义服务器函数  
shinyServer(function(input, output, session) {  
  
  # 示例数据生成函数（在实际应用中，您应该从数据库或文件中获取数据）  
  generate_data <- function(year, country) {  
    sales <- rnorm(10, mean = 5000, sd = 1000)  # 随机销售额数据  
    products <- sample(1:10, 10, replace = TRUE)  # 随机产品销量数据  
    customers <- sample(1:100, 10, replace = TRUE)  # 随机客户分布数据  
    
    # 这里应该根据输入参数（年份和国家）过滤或修改数据  
    # 但由于我们没有实际数据，所以这里直接使用随机数据  
    
    list(  
      sales = sales,  
      products = products,  
      customers = customers  
    )  
  }  
  
  # 反应性表达式，用于根据输入生成数据  
  reactive_data <- reactive({  
    generate_data(input$year, input$country)  
  })  
  
  # 渲染销售额图表  
  output$sales_plot <- renderPlot({  
    ggplot(data.frame(x = 1:10, y = reactive_data()$sales), aes(x = x, y = y)) +  
      geom_bar(stat = "identity") +  
      labs(title = "年度销售额", x = "月份", y = "销售额")  
  })  
  
  # 渲染产品销量图表（这里只是一个示例，实际可能需要不同的图表类型）  
  output$product_plot <- renderPlot({  
    ggplot(data.frame(x = 1:10, y = reactive_data()$products), aes(x = x, y = y)) +  
      geom_line() +  
      labs(title = "产品销量", x = "月份", y = "销量")  
  })  
  
  # 渲染客户分布图表（同样是一个示例）  
  output$customer_plot <- renderPlot({  
    pie(reactive_data()$customers, labels = paste("客户", 1:10), main = "客户分布")  
  })  
  
  # 渲染最新订单表格（这里只是一个空表格的示例）  
  output$order_table <- renderTable({  
    data.frame(OrderID = 1:5, Product = c("A", "B", "C", "D", "E"), Quantity = sample(1:10, 5))  
  })  
  
  # 更新关键指标（这里使用静态值作为示例）  
  output$total_sales <- renderText({  
    paste("总销售额：", format(sum(reactive_data()$sales), big.mark = ","))  
  })  
  
  output$profit <- renderText({  
    paste("总利润：", format(sum(reactive_data()$sales) * 0.2, big.mark = ","))  # 假设利润是销售额的20%  
  })  
  
  output$customers <- renderText({  
    paste("客户总数：", length(unique(reactive_data()$customers)))  
  })  
  
})