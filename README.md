# Tor server docker image.

Since we plan to extend our dns to tor we needed a good tor docker image. Here it is.

# Info

The hidden services must be mounted to `/var/lib/tor` directory and both the folder and its contents must be assigned a UID and GID of "1001".

`sudo chown 1001:1001 -R ./tor -R`
