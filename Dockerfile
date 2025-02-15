FROM ubuntu:16.04
RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN PYTHONPATH=/usr/bin/app pip install -r requirements.txt

# RUN PYTHONPATH=/usr/bin/python pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "tests.py" ]