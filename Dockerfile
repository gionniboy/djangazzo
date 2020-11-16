FROM python:3.8.6-buster

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONIOENCODING utf-8
ENV DEBIAN_FRONTEND=noninteractive

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get -qq update \
    # && apt-get -qq upgrade -y \
    && apt-get -y install locales \
    && apt-get -y install postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    # Set timezone to UTC by default
    && ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime \
    # Use unicode
    && locale-gen C.UTF-8 || true

ENV LANG=C.UTF-8

COPY ./requirements /requirements
RUN pip install -r /requirements/requirements-dev.txt

COPY ./ /app
WORKDIR /app

EXPOSE 8000

# CMD ["gunicorn", "--bind", "0.0.0.0", "--chdir=/app/project", "wsgi:application"]
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
