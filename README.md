# Nuget Proxy for Gitlab Docker Runner

[![Docker Build Status](https://img.shields.io/docker/build/owja/nugetproxy.svg)](https://hub.docker.com/r/owja/nugetproxy/)
[![Docker Image Size](https://images.microbadger.com/badges/image/owja/nugetproxy.svg)](https://hub.docker.com/r/owja/nugetproxy/)
[![Docker Pulls](https://img.shields.io/docker/pulls/owja/nugetproxy.svg)](https://hub.docker.com/r/owja/nugetproxy/)

This docker pipes nuget requests through a local nginx reverse proxy. The proxy will do the authentication instead of dotnet itself.

This is a workaround for the authentication problems we had while calling dotnet restore on a linux system (docker) wich throws errors like `GSSAPI operation failed with error - An invalid status code was supplied (SPNEGO cannot find mechanisms to negotiate)`.

### Configuring the proxy

```bash
$ nugetproxy https://username:password@server.de/your/nuget/repo
```

The script will create /etc/nuget.config too.

### Using for DotNet Core Project

```bash
$ cd /your/project/directory
$ dotnet restore --configfile /etc/nuget.config
$ dotnet test -c release
$ dotnet publis -r linux-x64 -c release
```
