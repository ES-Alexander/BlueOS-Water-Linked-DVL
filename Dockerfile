FROM python:3.9-slim-bullseye
ENV PIP_ROOT_USER_ACTION=ignore
RUN pip install --upgrade pip
RUN apt update && apt install -y nmap git

# Create default user folder
RUN mkdir -p /home/pi

# Install dvl service
COPY dvl /home/pi/cerulean-dvl
RUN cd /home/pi/cerulean-dvl && pip3 install .

#Versioned Data
LABEL version="1.0.0"
LABEL permissions '{\
    "ExposedPorts": {\
    "9002/tcp": {}\
    },\
    "HostConfig": {\
    "PortBindings": {\
    "9002/tcp": [\
    {\
    "HostPort": ""\
    }\
    ]\
    }\
    }\
    }'
LABEL authors='[\
    {\
    "name": "Nick Nothom",\
    "email": "nick.nothom@ceruleansonar.com"\
    }\
    ]'
LABEL docs='https://ceruleansonar.com/pages/cerulean-support'
LABEL support 'https://forum.ceruleansonar.com/categories'
LABEL company='{\
    "about": "",\
    "name": "Cerulean Sonar",\
    "email": "dennys.bisogno@ceruleansonar.com"\
    }'

ENTRYPOINT /home/pi/cerulean-dvl/main.py
