FROM python:3.8-alpine

# Use this file as a starting point to create
# a production-ready Dockerfile for our Flask API.
#
# Bonus point: take advantage of Docker's Multi-Stage Build
# to make this single Dockerfile ready for both development
# and production environments.

COPY . /usr/src/app
#Definindo o diretorio onde o CMD será executado e copiando o arquivo de requerimentos
WORKDIR /usr/src/app
COPY requirements.txt ./
# Instalando os requerimentos com o PIP
RUN pip install --no-cache-dir -r requirements.txt
# Expondo a porta da APP
EXPOSE 8000
# Executando o comando para subir a aplicacao
CMD python api/app.py
