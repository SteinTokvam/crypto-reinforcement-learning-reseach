FROM ubuntu:latest
LABEL org.opencontainers.image.source="https://github.com/SteinTokvam/crypto-reinforcement-learning-reseach"

# Ikke i bruk
ENV percentage_buy 10 

USER root
WORKDIR /app

COPY ./lib /app/lib
COPY ./training_data /app/training_data
COPY ./run.py ./run.py
COPY ./train.py ./train.py
COPY ./req.txt /app/req.txt

RUN apt update && apt install -y python3 python3-pip
RUN pip3 install -r req.txt --break-system-packages

CMD [ "python3","train.py" ]