FROM python:3.9-slim-bullseye

RUN apt update && apt install -y nmap

# Create default user folder
RUN mkdir -p /home/pi

# Install dvl service
COPY dvl-a50 /home/pi/dvl-a50
RUN cd /home/pi/dvl-a50 && pip3 install .

LABEL version="1.0"
LABEL permissions '\
{\
    "NetworkMode": "host"\
}'
LABEL reasonings = '{\
    "network_mode": "Default option"\
}'

LABEL requirements="core >= 1"

ENTRYPOINT /home/pi/dvl-a50/main.py
