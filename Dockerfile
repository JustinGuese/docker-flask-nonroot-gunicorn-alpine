FROM python:alpine
MAINTAINER Justin Guese <info@datafortress.cloud>
ARG UNAME=flasky
ARG UID=1008
ARG GID=1008
RUN addgroup -g $GID $UNAME
RUN adduser -S $UNAME -u $UID -G $UNAME -H -D -s /bin/sh
RUN mkdir /app
WORKDIR /app
RUN pip install flask gunicorn flask-cors
COPY . /app
RUN chown -R $UID:$GID /app
USER $UNAME
ENTRYPOINT [ "gunicorn","-b","0.0.0.0:5000","flaskapp:app" ]