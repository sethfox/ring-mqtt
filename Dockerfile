FROM hassioaddons/base
ENV LANG C.UTF-8
COPY . /app/ring-mqtt
RUN apk add --no-cache nodejs npm git && \
    apk cache clean && \
    chmod +x /app/ring-mqtt/scripts/*.sh && \
    mkdir /data && \
    chmod 777 /data /app && \
    cd /app/ring-mqtt && \
    npm install && \
    rm -Rf /root/.npm && \
    chmod +x ring-mqtt.js
ENTRYPOINT [ "/app/ring-mqtt/scripts/entrypoint.sh" ]