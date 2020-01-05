## Software Used

[MariaDB, version 5.5.57](https://downloads.mariadb.org/mariadb/5.5.57/)

## Setup

### Python deps
- Install dependencies on a new virtual environment or your global Python3 environment:
  ```
  pip install -r requirements.txt
  ```

### Database setup
- Start the database server
- Execute `dump.sql` on your database server to create and populate the `gitinsightsdb` database 
- Add the database credentials to the `gitinsights/settings.py` file under the database variables section.

    ### Example
    ```python
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'gitinsightsdb',
            'USER': 'root',
            'PASSWORD': 'root',
            'HOST': 'localhost',
            'PORT': '3306'
        }
    }
    ```

## Start server
- Run `python manage.py runserver` 
- Point your browser to the `gitinsightsdb` index page: http://localhost:8000/api/

Optionally, you can create an admin user by executing `python manage.py createsuperuser` and point your browser to `http://localhost:8000/admin/` to gain absolute control of the database data (some functionality has been omitted from the public api for security reasons).
