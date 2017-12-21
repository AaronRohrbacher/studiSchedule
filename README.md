# StudiSchedule
_A full-featured roster and scheduling program designed specifically for nonprofit schools of music._

## Installation
* This application was built on Ruby 2.4.1 on Rails 5.1.4, using PostgreSQL as a database server. If you have these or equivalent versions installed, you're ready to install this repository:
  * If you need to install Ruby and/or Rails, I recommend a version manager. Apple users, don't use the pre-installed version of Ruby. Check out https://github.com/postmodern/chruby, great start-up documentation, and a great ruby version manager and installer. Use the instructions to install with Homebrew (https://brew.sh/).

  * These setup instructions assume the use of PostgreSQL as a SQL server (https://www.postgresql.org/). You can use any SQL server, such as mySQL, but these instructions only support Postgres, and I have not tested on other SQL servers.

* Clone this repository `$ git clone https://github.com/aaronrohrbacher/epicodus_bookstore`
* Navigate to the root directory of this project: `$ cd studiSchedule`
* Install gems and dependencies: `$ bundle install`
* Start your Postgres server: `$ postgres`
* Create and migrate the databases (pre-seeded and ready to go!): `$ rails db:setup`
* Open a new terminal tab, and serve the project in development mode: `$ rails s`
* Open your favorite web browser, point to http://localhost:3000/ (most common configuration), and have fun! This is a fully-featured shopping cart system, with user authentication and payment-ready (don't forget, you'll need to get an API key and include it in the code.)

## Use

* I've seeded the database with an admin, a teacher, and a student.
  * Admin: admin@admin.com password: 111111
  * Teacher: teacher@teacher.com password: 111111
  * Student: student@student.com password: 111111

* Admins can register new users, which can be a student or a teacher. Admins cannot be created within the application, so I've seeded one (you could easily create one from the Rails console).

* Play around! Create students and teachers, create classes, add students to the class, schedule the classes, and check out the "studiBoard" for each class, where students and teachers can upload files to posts!

## Technologies used

* Built in Ruby 2.4.1 on Rails 5.1.4
* Uses Postgres as SQL server
* Authentication with the Devise gem, customized.
* Test e-mails sent with the Letter Opener gem.
* Image upload capability uses the Paperclip gem.
