# 申请证书

Let’s Encrypt 的通配符证书，只能通过 ACME v2 协议获取。只要客户端支持 ACME v2，就可以申请通配符证书。

这里使用的是官方推荐客户端 Certbot，当然也可以使用其他 ACME 客户端。

此外，必须使用 DNS-01 验证方式来验证通配符域名。因为只有修改 DNS TXT 记录，才能证明对域名的控制权，这样才可以获取通配符证书。

## 执行 generate.sh 脚本

- 上面的命令使用 docker run 启动容器，启动后显示下面的交互界面。输入域名，如：\*.example.com，多个用空格隔开

```
Saving debug log to /var/log/letsencrypt/letsencrypt.log
Plugins selected: Authenticator manual, Installer None
Please enter in your domain name(s) (comma and/or space separated)  (Enter 'c'
to cancel):
```

- 输入 Y

```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
NOTE: The IP of this machine will be publicly logged as having requested this
certificate. If you're running certbot in manual mode on a machine that is not
your server, please ensure you're okay with that.

Are you OK with your IP being logged?
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
(Y)es/(N)o:
```

- 在这里，需要给\_acme-challenge.example.com 配置一条 TXT 记录，记录值配置成上面显示的 \_k7-p0Y1oZ_FwONLMLtodYlY2qT-VzBAd5p4K8gu3pY

```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Please deploy a DNS TXT record under the name
_acme-challenge.example.com with the following value:

_k7-p0Y1oZ_FwONLMLtodYlY2qT-VzBAd5p4K8gu3pY

Before continuing, verify the record is deployed.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
Press Enter to Continue
```

- 完成

```
Waiting for verification...
Cleaning up challenges

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/example.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/example.com/privkey.pem
   Your cert will expire on 2020-11-09. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

# 自动续期证书

## 使用 docker-compose 给证书续期

- 执行 docker-compose up -d
