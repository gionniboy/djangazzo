# Djangazzo
Djangazzo is a ready-to-go django environment built with docker compose for fast developing without ops overhead.

## Dev Env with docker-compose
Customise .env file if needed.
Remember: never commit/push a secret env file on repositories.

## docker-compose
First time we need to build the stack

```console
docker-compose build
```

Then

```console
docker-compose up [-d to detach]
```

Execute management command inside docker-compose

```console
docker-compose run --rm django python manage.py makemigrations
docker-compose run --rm django python manage.py migrate
docker-compose run --rm django python manage.py createsuperuser
docker-compose run --rm django python manage.py startapp myamazingapp
docker-compose run --rm django python manage.py collectstatic
```

These files are created by django inside docker so they are owned by root.
Change permission to solve the issue

```console
sudo chown -R $USER:$USER .
```

now we can open the browser to http://localhost:8000 and profit.


## POSTGRESQL
Postgres11 on its docker, it exposes the 5432 port \
You can connect using a psql client installed locally

```console
psql -U postgres -h 0.0.0.0 -p 5432
```

## REDIS

## MAILHOG

In development, it is often nice to be able to see emails that are being sent from your application. For that reason local SMTP server MailHpg with a web interface is available as docker container.

Container mailhog will start automatically when you will run all docker containers.

With [MailHog](https://github.com/mailhog/MailHog) running, to view messages that are sent by your application, open your browser and go to http://127.0.0.1:8025


# So Long, and Thanks for All the Fish

issue&&PR || GTFO

enjoy.

## **Authors**

* **G Pullara**

See also the list of [contributors](https://github.com/gionniboy/djangazzo/contributors) who participated in this project.


### **License**
This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details
