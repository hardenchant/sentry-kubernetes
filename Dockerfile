FROM python:3-slim

RUN apt-get update && \
    apt-get install --no-install-recommends -y libyaml-0-2 && \
    rm -rf /var/lib/apt/lists/* /var/cache/debconf/*-old && \
    useradd --system --user-group app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY sentry-kubernetes.py ./

USER app

CMD [ "python", "./sentry-kubernetes.py" ]
