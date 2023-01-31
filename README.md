# Setup

Create a directory inside the tor directory for your service.

The **tor** directory and torrc file must have a UID and GID of "1001"

`sudo chown 1001:1001 -R ./tor -R`

# torrc

```
HiddenServiceDir /var/lib/tor/your_service/
HiddenServicePort 80 192.168.1.10:80
```

# docker-compose.yml

```
version: "3"
services:
  tor:
    image: docker-tor:latest
    restart: unless-stopped
    volumes:
       - ./tor:/var/lib/tor/ 
       - ./torrc:/etc/tor/torrc
```
