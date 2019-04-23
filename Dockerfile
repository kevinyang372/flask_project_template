###
FROM python:3-alpine
COPY requirements.txt .

# Set the working directory to /web
WORKDIR /web

# Copy the current directory contents into the container at /web
ADD . /web
RUN pip install --trusted-host pypi.python.org -r requirements.txt

ENV FLASK_APP=web
ENV FLASK_RUN_PORT=5000
ENV SERVER_NAME=0.0.0.0
ENV SQLALCHEMY_DATABASE_URI='sqlite:///web.db'
ENV SECRET_KEY='e9cac0f3f4Yd47a3be91d7b8f5'

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Run app.py when the container launches
CMD ["python3", "-m", "flask", "run"]