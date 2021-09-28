FROM python:3.9.0

WORKDIR /home/

RUN echo 'aswddd003'

RUN git clone https://github.com/success899/test.git

WORKDIR /home/test/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

EXPOSE 8000

CMD ["bash", "-c", "python manage.py collectstatic --noinput --settings=test2_210630.settings.deploy && python manage.py migrate --settings=test2_210630.settings.deploy && gunicorn --env DJANGO_SETTINGS_MODULE=test2_210630.settings.deploy test2_210630.wsgi --bind 0.0.0.0:8000"]