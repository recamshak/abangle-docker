FROM python:2.7-alpine3.6

WORKDIR /app
ENV PATH /app:$PATH
ENV PYTHONPATH /app/abangle

RUN apk add --no-cache --virtual .build-deps \
    curl gzip gcc python-dev py-pip build-base openblas-dev \
    && curl http://www.stats.ox.ac.uk/~dunbar/abangle/downloads/ABangle.tar.gz | tar xz \
    && curl https://zhanglab.ccmb.med.umich.edu/TM-align/TMalign.gz | gunzip > TMalign \
    && pip install numpy \
    && apk add --no-cache openblas \
    && apk del .build-deps

CMD ABangle
