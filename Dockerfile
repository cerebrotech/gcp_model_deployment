FROM python:3.10-slim
ENV PATH=$PATH:/home/app/.local/bin:/home/app/bin
ENV PYTHONUNBUFFERED=true
ENV PYTHONUSERBASE=/home/app
ENV FLASK_ENV=production
ENV LOG_LEVEL=WARNING
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ENV FLASK_APP=model_api.py
RUN pip install --upgrade pip
ADD . /app
COPY requirements_model.txt /app/requirements_model.txt
WORKDIR /app
RUN pip install -r requirements_model.txt
RUN apt-get update && apt-get upgrade -y
USER 1000
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 model_api:app