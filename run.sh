# apt安装所有库
export DEBIAN_FRONTEND=noninteractive
echo "tzdata tzdata/Areas select Asia" | debconf-set-selections
echo "tzdata tzdata/Zones/Asia select Shanghai" | debconf-set-selections
echo "keyboard-configuration keyboard-configuration/layout select Chinese (simplified) - Chinese (simplified, Pinyin)" | debconf-set-selections
apt update && apt install -y $(cat requirements.apt)
# 启动vncserver
mkdir /root/.vnc && echo "password" | vncpasswd -f > /root/.vnc/passwd && chmod 600 /root/.vnc/passwd
USER=root vncserver :5 -geometry 1280x800 -depth 24
# 启动noVNC映射到https网页
websockify --web=/usr/share/novnc/ --ssl-only --cert=ssl/cert.pem --key=ssl/key.pem 30000 localhost:5905
