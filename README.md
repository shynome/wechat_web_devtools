
### 源

https://github.com/cytle/wechat_web_devtools

## 安装

### 克隆仓库
```sh
$ git clone https://github.com/shynome/wechat_web_devtools.git
```

### 构建镜像
```sh
$ docker build -t shynome/wxdt .
```

### 启动镜像
```sh
$ docker run -d --name wxdt -p 6080:80 -v $PWD:PROJECTS_FOLDER_PATH shynome/wxdt

# 例如
$ docker run -d --name wxdt -p 6080:80 -v $PWD:/projects shynome/wxdt

# 注意
1. $PWD 为当前执行命令的路径，建议选择为目标项目所在目录
```

### 启动 IDE
```sh
# 进入容器内
$ docker exec -it wxdt /bin/bash

# 启动 IDE
$ cli -o

# 返回宿主机
$ exit
```

## 使用微信开发者工具
### 登录
```sh
$ docker exec -it wxdt cli -l
```

### 预览项目
```sh
docker exec -it wxdt cli -p /projects/XXXX

# 注意
1. -p 后为小程序目录（包含 project.config.json 的目录），且该路径是相对容器的，不是宿主机。
```

### 上传
```sh
$ docker exec -it wxdt cli -u 版本号@项目路径 --upload-desc '注释'

# 注意
1. 项目路径是相对容器的，非宿主机。
2. 注释不能包含空格，否则空格后内容将被微信开发者工具过滤掉。可用下划线等符号代替空格。
3. 若使用 Jenkins 做持续集成，那么在 SHELL 中应当去掉 -t 参数。
```

## 关闭
```sh
$ docker exec -it wxdt cli --quit
```
