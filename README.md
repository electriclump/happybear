# README

## Installation

1. Make sure you have Ruby 2.4.0 installed, and a recent nodejs version
2. Install the gems:
  
  ```
    $ bundle
  ```

3. Set up the database, run migrations, and seed some guestbook entries:

  ```
    $ rake db:setup
  ```

4. Assuming all went well, run the specs and analyze with RuboCop:

  ```
    $ rake
  ```

5. If everything is green, fire up the server:

  ```
    $ rails s
  ```


## Notes
If the theme is giving you a migraine, comment out `@import "main";` in 
`app/assets/stylesheets/application.scss`
