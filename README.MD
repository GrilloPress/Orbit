> In physics, an orbit is the gravitationally curved path of an object about a point in space, for example the orbit of a planet about a star, or a natural satellite around a planet.

# Orbit

A simple "Intranet" rails app. Just for fun.

Using:

- Devise https://github.com/plataformatec/devise
- Rails
- ERB
- SASS
- SQL DB/ActiveRecord

Features:

- User blogs
- News feeds
- Comments
- Pages

## Models

user

- devise
- username/nickname
- job title
- bio

future

- comments/messages
- groups
- blogs (belongs_to department through users)
- manager (user belongs_to manager has_many users)
- department (user belongs_to department has_many users)