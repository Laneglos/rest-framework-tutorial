FROM python:3.8.1

RUN apt-get -q update && apt-get -qy install netcat make

COPY ./docker/wait-for /usr/local/bin/
COPY ./docker/entrypoint.sh /usr/local/bin/entrypoint.sh

ADD . /src
WORKDIR /src
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

EXPOSE 8000
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
