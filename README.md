# Bark Test Assessment

This project is a simple web application built with Ruby on Rails. It uses PostgreSQL as its database.

In this app I am adding all necessary validations for user Password field. I have added these validations on both the Front-end and the Back-end. For backed the validations are added in the User Model. On Front-end I have used stimulus controller to validate the password filed on form submission.

## Features

- User: Represents a user with 2 fields email and password.
- View User: After the successful creation of user the app takes to the show page.
- Add User: Any one can add a New Valid User.
- Password Validations:
  1. Password length validation
  2. Password must have at least one lowercase letter
  3. Password must have at least one uppercase letter
  4. Password must have at least one special letter
  5. Password must have at least one digit

`(Ideally, a demo video should be put here.)`

<img width="1409" alt="Screenshot 2023-11-09 at 7 17 12 PM" src="https://github.com/beinghaziq/awesome-readme/assets/72576839/c884958c-f0dd-4ae1-bdcc-39a888cddcb8">


# Build With

- Framework: Ruby on Rails 7.0, Hotwire Stimulus
- Database: PostgreSQL

# Getting Started

## Prerequisites

- ruby

  ```bash
  rvm install 3.2.2
  ```

## Installation

1. **Clone the Repository**:
   ```bash
   git clone [<repository-url>](https://github.com/Owner/repo.git)
   cd repo
   ```

2. **Initialize the Database**:
   - Before starting the application for the first time, ensure that the database is set up correctly.
   ```bash
   rails db:create db:migrate
   ```
3. **Bundeling Application**:
   ```bash
   bundle install
   ```

3. **Compiling assets**:
   ```bash
   rake assets:precompile
   ```

4. **Starting Server**:
   - Now run the application with
   ```bash
   rails server
   ```

## Run Tests

```bash
    rpsec
```