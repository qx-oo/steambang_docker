### 运行
django:
`docker run -d -p 8080:8080 --link some-redis:redis --link mysql:mysql -v {project_ducument}:/var/www/steambang -t --name steambang steambang bash -c "cd /var/www/steambang; gunicorn -b 0.0.0.0:8080 -c /var/www/steambang/deployconf/gunicorn.conf.py zqb_website.wsgi"`
celery
`docker run -d --link some-redis:redis --link mysql:mysql -v {project_ducument}:/var/www/steambang -t --name steambang_celery steambang bash -c "cd /var/www/steambang; celery worker -A zqb_website --loglevel=INFO"`

`docker run -d --link some-redis:redis --link mysql:mysql -v {project_ducument}:/var/www/steambang -t --name steambang_celery_h steambang bash -c "cd /var/www/steambang; celery worker -A zqb_website --loglevel=INFO -Q highest_task"`

`docker run -d --link some-redis:redis --link mysql:mysql -v {project_ducument}:/var/www/steambang -t --name steambang_celery_beat steambang bash -c "cd /var/www/steambang; celery beat -A zqb_website --loglevel=INFO"`



### 查看日志
`docker logs -f steambang`

### 构建
`docker build -t steambang .`
