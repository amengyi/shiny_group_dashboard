# 使用包含 Shiny 服务器的官方 R 镜像
FROM rocker/shiny:latest

# 设置工作目录
WORKDIR /srv/shiny-server

# 安装必要的依赖
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

# 将你的应用程序文件复制到容器中
COPY . .

# 安装 R 包
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'ggplot2', 'dplyr', 'DT', 'plotly'), repos='http://cran.rstudio.com/')"

# 暴露端口
EXPOSE 3838

# 运行应用程序
CMD ["R", "-e", "shiny::runApp(appDir = '.', host = '0.0.0.0', port = 3838)"]