FROM microsoft/dotnet:2.2-sdk

RUN apt-get update \
	&& apt-get -y install nginx \
	&& rm -rf /var/lib/apt/lists/*

RUN service nginx stop

RUN rm -rf /etc/nginx/sites-enabled
RUN rm -rf /etc/nginx/sites-available

COPY nuget.config /etc/nugetproxy/
COPY nginx.config /etc/nugetproxy/
COPY nugetproxy /usr/bin/
COPY parseurl /usr/bin/

RUN chmod 700 /usr/bin/nugetproxy
RUN chmod 755 /usr/bin/parseurl
