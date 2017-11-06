FROM python:3.5

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources.list /etc/apt/sources.list
RUN apt-get update -y

RUN mkdir -p /root/.pip/
ADD pip.conf /root/.pip/
ADD requirements.pip /mnt/requirements.pip
RUN pip install -r /mnt/requirements.pip

# 项目路径, 需要挂载
RUN mkdir -p /var/www/steambang
# 日志路径
RUN mkdir -p /var/www/log/
# 设置数据库env
ENV DB_NAME zqb
ENV DB_USER root
ENV DB_PASSWORD 1234
# ENV MYSQL_PORT_3306_TCP_ADDR 127.0.0.1
# ENV MYSQL_PORT_3306_TCP_PORT 3306
# 设置redis地址
# ENV REDIS_PORT_6379_TCP_ADDR 127.0.0.1
# ENV REDIS_PORT_6379_TCP_PORT 6379
# 设置站点域名
ENV SITE_HOST http://127.0.0.1
# 设置debug模式
ENV DJANGO_DEBUG 1
# 语言
ENV DJANGO_LANGUAGE zh-hans
# celery
ENV CELERYD_CONCURRENCY 1
# steam key
#ENV STEAM_API_KEY xxxxxxxx

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
