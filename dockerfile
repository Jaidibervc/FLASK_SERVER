FROM alpine

RUN rm -rf /app

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

WORKDIR /app
COPY . /app
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN pip3 install virtualenv
RUN virtualenv env
RUN . env/bin/activate
RUN pip3 install -r requirements.txt
ENV FLASK_APP=main.py

EXPOSE 4444
ENTRYPOINT python3 main.py run
