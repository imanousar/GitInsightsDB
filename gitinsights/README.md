# Setup

- Install dependencies on a new venv or your global python environment:
  ```
  pip install -r requirements.txt
  ```
- Start the database and create a `gitinsights` database
- Add the database details to the `gitinsights/settings.py` under the database variables section
- Run `python manage.py migrate` to prepare the database schema
- Run `python major_migration.py` to populate the database with our existing data
