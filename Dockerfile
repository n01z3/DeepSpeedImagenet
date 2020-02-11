FROM deepspeed/deepspeed:latest

RUN pip install Pillow==6.1
RUN pip install matplotlib

COPY . /code
WORKDIR /code