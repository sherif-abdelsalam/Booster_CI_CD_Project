FROM python:3.6-slim

WORKDIR /app

# Copy only the requirements file first to leverage Docker cache
COPY requirements.txt .

# Install any needed packages specified in requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . .

RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate

CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
