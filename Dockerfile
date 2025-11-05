# syntax=docker/dockerfile:1.6
FROM python:3.12-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    build-essential \
    iproute2 \
    iputils-ping\
    traceroute       \
    dnsutils         \
    netcat-openbsd   \
    curl wget        \
    net-tools \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /app

# install deps
COPY requirements.txt .
RUN python -m pip install --no-cache-dir -r requirements.txt

# copy app
COPY app.py .

EXPOSE 5000
CMD ["python","app.py"]