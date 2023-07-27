# container_desktop

## docker使用方式
### 一键部署
```bash
git clone https://github.com/hky3535/container_desktop.git && cd container_desktop && docker build -t container_desktop:latest . && docker run -itd --name container_desktop -p 60010:30000 --restart always --privileged container_desktop:latest
```
* 可以使用docker logs container_desktop查看初始化进度，等待所有初始化库安装完成即可开始运行
### 分解部署
```bash
git clone https://github.com/hky3535/container_desktop.git
cd container_desktop
docker build -t container_desktop:latest .
docker run -itd --name container_desktop -p 60010:30000 --restart always --privileged container_desktop:latest
```
* 可以使用docker logs container_desktop查看初始化进度，等待所有初始化库安装完成即可开始运行
### 访问https://0.0.0.0:60010/vnc.html