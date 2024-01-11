FROM python:3
# Allows docker to cache installed dependencies between builds
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY . code
# Mounts the application code to the image
WORKDIR /code
EXPOSE 8000

# runs the production server
ENTRYPOINT ["python", "./manage.py"]
CMD ["runserver", "0.0.0.0:8000"]