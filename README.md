# README

This is the very first sample of Ruby on Rails v5. 

## Steps to deploy to heroku
- Step 1: `heroku create`
- Step 2: Remove `gem 'sqlite3'` in `Gemfile`

```
group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
```
- Step3: Apply gem change to `Gemfile` and `Gemfile.lock`
`bundle install --without production`

- Step 4: Commit and push code to heroku master
- Step 5: Run `heroku run rails db:migrate`
- Step 6: `heroku open`

## User validation 
- Username must be present and unique, case_sensitive: false
- Email must be present and unique, case_sensitive: false
- Validate email format using Regex: `/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i`

