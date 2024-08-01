FROM python:3.10

WORKDIR /app/

COPY . /app/

RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade -r requirements.txt

EXPOSE 80

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]