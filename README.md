# v2dock-kubesail

v2dock for Kubesail

> 在 Kubesail 上同时部署一个 v2ray(ws+vmess)

注：若想使用自己的配置文件，可使用[这个模板](https://kubesail.com/template/bclswl0827/v2ray)

一键部署地址：正在开发中。。。暂时可使用 
https://kubesail.com/template/kullex/v2dock-kubesail

### 环境变量说明：

1. **UUID：** 作为前置（ws+tls）的登陆 UUID
3. **V2RAY_PORT：** 这个其实不用改，kubesail 在映射的时候会使用随机的 tcp 端口
4. **V2RAY_PATH：** ws 路径，不用加 `/`


### Kubesail 端口映射

请将 9199 端口作为 tcp 端口映射，将 8118 端口作为 HTTPS 映射

### 客户端下载
>  windows：https://cdn.jsdelivr.net/gh/v2ray/dist@master/v2ray-windows-64.zip
>
> linux：https://cdn.jsdelivr.net/gh/v2ray/dist@master/v2ray-linux-64.zip

### 参考资料

> https://github.com/v2ray/v2ray

