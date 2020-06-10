args=''

if [ ! -z "$HTTP_PROXY" ]
then
  http_proxy_host=${HTTP_PROXY%:*}
  http_proxy_port=${HTTP_PROXY##*:}
  args="-Dhttp.proxyHost=${http_proxy_host} -Dhttp.proxyPort=${http_proxy_port}"
fi

if [ ! -z "$HTTPS_PROXY" ]
then
  https_proxy_host=${HTTPS_PROXY%:*}
  https_proxy_port=${HTTPS_PROXY##*:}
  args="${args} -Dhttps.proxyHost=${https_proxy_host} -Dhttps.proxyPort=${https_proxy_port}"
fi

if [ ! -z "args" ]
then
  echo "exec: jpm command --jvmargs \"${args}\" jpm"
  jpm command --jvmargs "${args}" jpm
fi

