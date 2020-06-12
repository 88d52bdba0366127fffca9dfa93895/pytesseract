# To build:
#  docker build -t tesseract .
# To run:
#  docker run --rm -it tesseract bash

FROM python:3.6
RUN apt-get update \
  && apt-get install -y cmake tesseract-ocr \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
COPY . /pytesseract
WORKDIR /pytesseract
RUN pip install -U pip \
  && python3.6 -m pip install pytesseract \
  && python3.6 -c "import pytesseract; from PIL import Image; print(pytesseract.image_to_string(Image.open('./tests/data/test.png')))"
