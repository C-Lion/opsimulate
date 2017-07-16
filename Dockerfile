FROM python:2.7

RUN mkdir -p /tmp/opsimulate-source

COPY opsimulate/ /tmp/opsimulate-source/opsimulate

COPY MANIFEST.in /tmp/opsimulate-source
COPY README.md /tmp/opsimulate-source
COPY requirements.txt /tmp/opsimulate-source
COPY setup.cfg /tmp/opsimulate-source
COPY setup.py /tmp/opsimulate-source
COPY test-requirements.txt /tmp/opsimulate-source
COPY tox.ini /tmp/opsimulate-source

ENV GOOGLE_APPLICATION_CREDENTIALS=/root/.opsimulate/service-account.json

RUN pip install /tmp/opsimulate-source

RUN opsimulate setup
