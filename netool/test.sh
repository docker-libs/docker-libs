
services:
  netool:
    image: sorc/netool:12-slim
    container_name: netool
    environment:
      TYPE: NONE # server | client | NONE
      # SLEEP_TIME: 3600 # seconds
      # SERVER_URL: ${SERVER_URL} # wss://0.0.0.0:7070
      # HTTP_PROXY: ${HTTP_PROXY} # optional
      # WSTUNNEL_RESTRICT_HTTP_UPGRADE_PATH_PREFIX: "-userwstid-5djMwrqIHR5cQu"
      # CLIENT_TYPE: L # L | R
      # CLIENT_MAPPING: "http://[::1]:1212" # socks5://[::1]:1212
      # WSTUNNEL_HTTP_UPGRADE_PATH_PREFIX: "userwstid-5djMwrqIHR5cQu"
      # HTTP_HEADERS: "Authorization:Bearer PcofEMoYx5qmM0CjhrMy5rczlgld"
    ports:
      - "127.0.0.1:7070:7070"
