FROM python:alpine AS build
COPY . /usr/local/gitem
#RUN pip3 install -r ./requirements.txt && PYTHONPATH=lib/ python -m gitem -h

FROM python:alpine
WORKDIR /usr/local/gitem
COPY --from=build usr/local/gitem/requirements.txt .
COPY --from=build usr/local/gitem/setup.cfg .
COPY --from=build usr/local/gitem/setup.py .
COPY --from=build usr/local/gitem/lib/gitem .
COPY --from=build usr/local/gitem/.coveragerc . 
COPY --from=build usr/local/gitem/.flake8 . 
#WORKDIR /usr/local/gitem
RUN pip3 install -r ./requirements.txt 
RUN PYTHONPATH=/usr/local/gitem/lib/ python -m gitem -h
ENTRYPOINT [ "python3", "gitem" ]