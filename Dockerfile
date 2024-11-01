# ʹ�ð��� Shiny �������Ĺٷ� R ����
FROM rocker/shiny:latest

# ���ù���Ŀ¼
WORKDIR /srv/shiny-server

# ��װ��Ҫ������
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev

# �����Ӧ�ó����ļ����Ƶ�������
COPY . .

# ��װ R ��
RUN R -e "install.packages(c('shiny', 'shinydashboard', 'ggplot2', 'dplyr', 'DT', 'plotly'), repos='http://cran.rstudio.com/')"

# ��¶�˿�
EXPOSE 3838

# ����Ӧ�ó���
CMD ["R", "-e", "shiny::runApp(appDir = '.', host = '0.0.0.0', port = 3838)"]