FROM python:alpine AS build
COPY . /usr/local/gitem
WORKDIR /usr/local/gitem
RUN pip install -r ./requirements.txt 
RUN export PYTHONPATH="lib/"
ENTRYPOINT [ "python", "gitem"]