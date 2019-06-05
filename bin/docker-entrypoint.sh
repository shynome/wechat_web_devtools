#!/bin/sh
set -e

if [ -z "$1" ]; then
  exec /startup.sh
  exit 0
fi

# 开启服务端口运行 /wxdt/bin/cli
/wxdt/bin/fix_cli.sh

# 将 /startup.sh 转到后台运行
sed s%'exec /bin/tini -- /usr/bin/supervisord -n -c'%'/usr/bin/supervisord -c'% -i /startup.sh
/startup.sh
while [ true ]
do
  if [ -f "/wxdt/dist/nwjs_version" ] && [ -d '/root/.config/wechat_web_devtools/WeappVendor/' ]; then break; fi
  echo "sleep 2s 等待 /startup.sh 准备完毕. "
  sleep 2s
done

/wxdt/bin/wxdt install
exec $@
