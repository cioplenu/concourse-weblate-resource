FROM python:3-alpine

COPY resource /opt/resource

RUN chmod +x /opt/resource/in /opt/resource/check /opt/resource/out && \
    pip install wlc

