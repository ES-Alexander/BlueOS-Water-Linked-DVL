FROM python:3.9-slim-bullseye
ENV PIP_ROOT_USER_ACTION=ignore
RUN pip install --upgrade pip
RUN apt update && apt install -y nmap git

# Create default user folder
RUN mkdir -p /home/pi

# Install dvl service
COPY dvl /home/pi/cerulean-dvl
RUN cd /home/pi/cerulean-dvl && pip3 install .

ENTRYPOINT /home/pi/cerulean-dvl/main.py
