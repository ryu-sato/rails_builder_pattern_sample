# How to run

## Only execute when run at first

1. Clone Git repository
    ```
    git clone https://github.com/ryu-sato/rails_builder_pattern_sample.git
    ```
1. Install GEMs
    ```
    cd rails_builder_pattern_sample
    bundle install
    ```
1. Initialize DB
    ```
    rails db:create db:migrate db:seed
    ```

## Execute every time

1. Change current directory to top of local repository
1. (Only execute when Gemfile is updated) Initialize or update DB schema and seeds
    ```
    rails db:migrate
    ```
1. Execute Rails
    ```
    rails s
    ```

# User Account

|User name|Password|
| --- | --- |
|admin|"passwordYYMM" (if you login at 2019/06/01, password is "password1906')|
