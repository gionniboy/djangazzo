FROM python:3.11

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONIOENCODING utf-8
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8

RUN apt-get -qq update \
    # && apt-get -qq upgrade -y \
    && apt-get -y install locales postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

COPY ./ /app
WORKDIR /app

RUN pip install -r requirements.dev.txt

EXPOSE 8000

# CMD ["gunicorn", "--bind", "0.0.0.0", "--chdir=/app/project", "wsgi:application"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
