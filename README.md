# Logistify (Shopify 2022 Backend Intern Technical Challenge)

Note that if your paths are not set up correctly, you may have to run ```bin/rails [COMMAND]``` instead of the normal `rails` command.

## Ruby version

This project uses Ruby 2.7.3. If you don't have Ruby already installed, follow the instructions below 

### Option 1
* Install [rbenv](https://github.com/rbenv/rbenv) on your specific system and follow setup
* Install ruby with ```rbenv install 2.7.3```
* Set local ruby version with ```rbenv local 2.7.3```

### Option 2
* Install Ruby 2.7.3 [using other methods](https://www.ruby-lang.org/en/documentation/installation/)
## System dependencies

(Optional)
- GraphViz (for UML class creation)

(Required)
- PostgreSQL

Follow the instructions on the [Postgres website](https://www.postgresql.org/download/) to download Postgres >= 9

## Configuration

Make sure PostgreSQL is running on your computer.

## Database creation

```bash
rails db:create
```

## Database initialization

```bash
rails db:migrate
# Optional, if you want to seed with fake data 
rails db:seed 
```

## How to run the test suite

Test are located in the `test/` folder.
```bash
rails t
```

<!-- ## Services (job queues, cache servers, search engines, etc.) -->


## Deployment instructions

```bash
# Only needed on initialization of production database  
rails db:create -e production

rails db:migrate -e production 
rails s -e production 
```

The app includes 

* rate limiting via Rack::Attack middleware 
* healthcheck endpoint at TODO
* slugs for warehouses (though still easily viewable via model ID in the backend)
* Custom logging with timestamps 
* DB Timeouts 
* Audited models (to aid in debugging client issues)

All available URLS can be seen with 
```bash
bin/rails routes
```

You can view UML diagrams in the docs/ folder for a better understanding of the schema. To generate new diagrams, run
```bash  
rake diagram:all
```

Models (and their respective validations) can be seen in the `app/models/` folder
