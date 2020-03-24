#!/bin/sh

#configure environment
apk add --no-cache --virtual .build-deps ca-certificates curl \
curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
mkdir /usr/bin/v2ray /etc/v2ray
touch /etc/v2ray/config.json
unzip /v2ray.zip -d /usr/bin/v2ray
#Remove some useless objects
rm -rf /v2ray.zip /usr/bin/v2ray/*.sig /usr/bin/v2ray/doc /usr/bin/v2ray/*.json /usr/bin/v2ray/*.dat /usr/bin/v2ray/sys*

chgrp -R 0 /etc/v2ray
chmod -R g+rwX /etc/v2ray

# Create Config
cat >/etc/v2ray/config.json <<EOF
{
  "log": {
    "access": "",
    "error": "",
    "loglevel": "debug"
  },
  "inbounds": [
    {
      "port": $V2RAY_PORT,
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "$UUID",
            "alterId": $ALTERID
          }
        ]
      },
      "tag": "in-0",
      "streamSettings": {
        "network": "ws",
        "security": "none",
        "wsSettings": {
          "path": "/$V2RAY_PATH"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    }
  ]
}
EOF
