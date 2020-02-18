FROM python:3.7

LABEL maintainer="Dharwin Perez <dharwin@urbvan.com>" 

RUN pip install -U pip meinheld gunicorn

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY ./start.sh /start.sh
RUN chmod +x /start.sh

COPY ./gunicorn_conf.py /gunicorn_conf.py

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]