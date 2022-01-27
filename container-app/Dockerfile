FROM python:3.8

ENV FLASK_APP app.py

RUN useradd -ms /bin/bash flask
USER flask
ENV PATH "$PATH:/home/flask/.local/bin"
WORKDIR /home/flask
COPY app.py gunicorn-cfg.py requirements.txt ./

RUN pip install -r requirements.txt --user

EXPOSE 5000
CMD ["gunicorn", "--config", "gunicorn-cfg.py", "app:app"]
