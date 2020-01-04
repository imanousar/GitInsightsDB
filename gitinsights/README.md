## Software Used

[MariaDB, version 5.5.57](https://downloads.mariadb.org/mariadb/5.5.57/)

[MySQL Workbench, version 6.3.6](https://downloads.mysql.com/archives/workbench/)

## Setup

- Install dependencies on a new virtual environment or your global Python3 environment:
  ```
  pip install -r requirements.txt
  ```
- Start the database [MySQL Workbench] .
- Start your local connection and then load and run the [GitInsightsDB.sql](https://github.com/imanousar/GitInsightsDB/blob/master/GitInsightsDB.sql) script to create the `gitinsights` database.
- Add the database credentials to the `gitinsights/gitinsights/settings.py` under the database variables section.

 ### Example
 ```python
  DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': os.environ['DB_NAME'],
        'USER': os.environ['DB_USER'],
        'PASSWORD': os.environ['DB_PASSWORD'],
        'HOST': os.environ['DB_HOST'],
        'PORT': os.environ['DB_PORT']
    }
}
```

- Run `python manage.py migrate` to prepare the database schema.
- Run `python major_migration.py` to populate the database with our existing data.
- Run `python manage.py createsuperuser` to create a superuser (optional).
- Run `python manage.py runserver`.
- Login to the user api: http://localhost:8000/api/ .
- Login to the default django admin site: http://localhost:8000/admin/ .
