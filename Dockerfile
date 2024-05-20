FROM public.ecr.aws/lambda/python:3.11-arm64

COPY requirements.txt .

RUN python3.11 -m pip install -r requirements.txt

RUN python3.11 -m pip cache purge

COPY app.py .

EXPOSE 80

CMD [ "app.lambda_handler" ]