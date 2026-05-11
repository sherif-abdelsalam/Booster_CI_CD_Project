FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    python3.6 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip3 install --no-cache-dir -r requirements.txt
RUN python3  manage.py makemigrations
RUN python3  manage.py migrate
    
CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
