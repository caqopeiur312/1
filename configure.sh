#!/bin/sh

# New Config
cat > /etc/v2ray/config.json << EOF
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

# Run V2Ray

/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
