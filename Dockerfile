# Pull official base image
FROM python:3.11.4-slim-buster AS builder

# Install dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip

ARG MODE
COPY ["requirements/", "docker/build.sh", "/tmp/"]
RUN /tmp/build.sh /tmp/${MODE}.txt

FROM builder as simple_workout_planner

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app
ADD . /app

EXPOSE 8000
STOPSIGNAL SIGINT
