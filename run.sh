apt update
ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& apt install -y tzdata \
&& dpkg-reconfigure --frontend noninteractive tzdata

# apt安装所需包
apt install -y $(cat requirements.apt)
# 启动vnc-server
vncserver :5 -geometry 1280x800 -depth 24 -SecurityTypes None
# 启动noVNC将桌面映射到网页浏览器
websockify --web=/usr/share/novnc/ --ssl-only --cert=ssl/cert.pem --key=ssl/key.pem 30000 localhost:5905