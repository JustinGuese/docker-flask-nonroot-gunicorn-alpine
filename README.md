# introduction

An image providing a Python alpine image which runs flask apps using Gunicorn as a non-root user for security reasons. 

## adding your app

Why all the headache?
We want the flask app to be run with gunicorn as a production server, and we do not want to use the root user of Docker images.

This image is a safe way to run your application.

To use it either mount your flaskapp.py file to /app/flaskapp.py or create a new image with

```
FROM guestros/flask-nonroot-gunicorn-alpine:latest
COPY myapp.py /
ENTRYPOINT [ "gunicorn","-b","0.0.0.0:5000","myapp:nameofyourflaskapp"]
```
