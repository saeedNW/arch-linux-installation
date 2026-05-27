# Missing and Refactor

## Chats

[mechsim](https://chat.deepseek.com/a/chat/s/4b74b69c-26f1-4ae3-92f4-25570715d7ca)

[Extract Terminal Configuration Guide](https://chat.deepseek.com/a/chat/s/73e5280d-9467-4298-a0f6-5a552967e1b6)

[Arch Linux guide review request](https://chat.deepseek.com/a/chat/s/57ccfbc2-a7cb-4790-b57a-73d15839ade4)

[Arch Linux KVM Virt Manager Setup Guide](https://chat.deepseek.com/a/chat/s/0709a91a-a7fc-4e35-b8f4-5bda001b7a5c)

## Github

[Zinit](https://github.com/zdharma-continuum/zinit)

## Applications

```bash
docker run -d
--name dockhand \
--restart unless-stopped \
-p 9443:3000 \
-v /var/run/docker.sock:/var/run/docker.sock \
-v dockhand_data:/app/data \
docker.arvancloud.ir/fnsys/dockhand:latest

docker run -d --name=netdata \
-p 19999:19999 \
-v netdataconfig:/etc/netdata \
-v netdatalib:/var/lib/netdata \
-v netdatacache:/var/cache/netdata \
-v /etc/passwd:/etc/passwd:ro \
-v /etc/group:/etc/group:ro \
-v /proc:/proc:ro \
-v /sys:/sys:ro \
-v /etc/os-release:/etc/os-release:ro \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
--cap-add SYS_PTRACE \
--security-opt apparmor=unconfined \
docker.chabokan.net/netdata/netdata:latest
```

super-productivity

v2rayn

git-flow-avh
gitflow-avh

qalculate-qt

vlc-plugins-all

scrcpy

ngrok

topgrade

insomnia

datagrip

mongodb compass

redisinsight

windscribe,

thunder beard

nodejs
npm
typescript
nestjs

## Terminal

bpytop

zoxide
