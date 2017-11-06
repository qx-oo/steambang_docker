### 运行
`docker run -d -p 8080:8080 --link some-redis:redis --link mysql:mysql -v {project_ducument}:/var/www/steambang -t --name steambang steambang`

### 查看日志
`docker logs -f steambang`

### 构建
`docker build -t steambang .`
