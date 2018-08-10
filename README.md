# dokku-copy-files

Copy files from ```/home/dokku/<app>/DOCKER_FILES``` to anywhere in the docker container, preserving paths.

For example, creating the following structure & file:

```
/home/dokku/<app>/usr/local/share/ca-certificates/your.crt
```

Would be copied to ```/usr/local/share/ca-certificates/your.crt``` in the docker container.
