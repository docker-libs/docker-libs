#!/bin/bash
# public
TYPE=${TYPE:-"NONE"}
SERVER_URL=${SERVER_URL:-"wss://0.0.0.0:7070"}
# server
WSTUNNEL_RESTRICT_HTTP_UPGRADE_PATH_PREFIX=${WSTUNNEL_RESTRICT_HTTP_UPGRADE_PATH_PREFIX:"-userwstid-5djMwrqIHR5cQu"}

# client
CLIENT_TYPE=${CLIENT_TYPE:-"L"}
CLIENT_MAPPING=${CLIENT_MAPPING:-"socks5://0.0.0.0:1212"}
WSTUNNEL_HTTP_UPGRADE_PATH_PREFIX=${WSTUNNEL_HTTP_UPGRADE_PATH_PREFIX:-"userwstid-5djMwrqIHR5cQu"}
HTTP_HEADERS=${HTTP_HEADERS:-"Authorization:Bearer PcofEMoYx5qmM0CjhrMy5rczlgld"}

echo "type=$TYPE"
echo "http_proxy=$HTTP_PROXY"
echo "server_url=$SERVER_URL"

if [ "$TYPE" == "server" ];then
  echo "start server ... "
  echo "-r $WSTUNNEL_RESTRICT_HTTP_UPGRADE_PATH_PREFIX"
  wst server $SERVER_URL
elif [ "$TYPE" == "client" ];then
  echo "start client ... "
  echo "-$CLIENT_TYPE $CLIENT_MAPPING"
  echo "-P $WSTUNNEL_HTTP_UPGRADE_PATH_PREFIX"
  echo "-H $HTTP_HEADERS"
  wst client -$CLIENT_TYPE "$CLIENT_MAPPING" -H "$HTTP_HEADERS" $SERVER_URL
else
  echo "sleep $SLEEP_TIME sec "
  /bin/bash -c sleep $SLEEP_TIME
fi

