# Blockbuster API
=================

To see
---

There's deployed [blockbuster-movies on Heroku](https://blockbuster-movies.herokuapp.com).

This project uses `ruby 2.5.5`

Run
---

```
$ bundle install
$ sequel -m config/migrations
$ rackup

Puma starting in single mode...
* Version 4.2.0 (ruby 2.5.5-p157), codename: Distant Airhorns
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://127.0.0.1:9292
* Listening on tcp://[::1]:9292
* Listening on tcp://127.94.0.1:9292
Use Ctrl-C to stop
```

List Routes
-----------

```
$ rake routes
     GET        /api/movies
     POST       /api/movies
     GET        /api/reservations
     POST       /api/reservations
     GET        /api/swagger_doc
     GET        /api/swagger_doc/:name
```

### Movies List

Navigate to https://blockbuster-movies.herokuapp.com/api/movies with a browser or use `curl`.

```
$ curl https://blockbuster-movies.herokuapp.com/api/movies

[
  {
    "id":1,
    "name":"Awesome movie 1",
    "description":"Awesome description 1",
    "image_url":"https://via.placeholder.com/150"
  },{
    "id":2,
    "name":"Awesome movie 2",
    "description":"Awesome description 2",
    "image_url":"https://via.placeholder.com/150"
  },{
    "id":3,
    "name":"Awesome movie 3",
    "description":"Awesome description 3",
    "image_url":"https://via.placeholder.com/150"
  },{
    "id":4,
    "name":"Awesome movie 4",
    "description":"Awesome description 4",
    "image_url":"https://via.placeholder.com/150"
  },{
    "id":5,
    "name":"Awesome movie 5",
    "description":"Awesome description 5",
    "image_url":"https://via.placeholder.com/150"
  },{
    "id":6,
    "name":"Awesome movie 6",
    "description":"Awesome description 6",
    "image_url":"https://via.placeholder.com/150"
  }
]
```

### Movies List filtering by a week day

```
$ curl https://blockbuster-movies.herokuapp.com/api/movies\?day\=monday

[
  {
    "id":2,
    "name":"Awesome movie 2",
    "description":"Awesome description 2",
    "image_url":"https://via.placeholder.com/150"
  },{
    "id":4,
    "name":"Awesome movie 4",
    "description":"Awesome description 4",
    "image_url":"https://via.placeholder.com/150"
  }
]
```

### Create a new movie

```
$ curl -d '{"name": "Awesome movie","description": "this is an awesome movie","image_url": "http://unrealitymag.com/wp-content/uploads/2013/07/1766597-the_strangers2.jpg.jpg","days": ["monday", "tuesday", "friday"]}' -H "Content-Type: application/json" -X POST https://blockbuster-movies.herokuapp.com/api/movies

{
  "id": 7,
  "name": "Awesome movie",
  "description": "this is an awesome movie",
  "image_url": "http://unrealitymag.com/wp-content/uploads/2013/07/1766597-the_strangers2.jpg.jpg"
}
```

### Reservations list

```
$ curl https://blockbuster-movies.herokuapp.com/api/reservations
$ [
    {
      "id": 15,
      "customer": "customer 1",
      "movie_name": "Awesome movie 2",
      "seat": "number 3",
      "date": "2019-09-26",
      "week_day": "tuesday"
    },
    {
      "id": 16,
      "customer": "customer 1",
      "movie_name": "Awesome movie 2",
      "seat": "number 3",
      "date": "2019-09-27",
      "week_day": "tuesday"
    },
    {
      "id": 17,
      "customer": "customer 1",
      "movie_name": "Awesome movie 2",
      "seat": "number 2",
      "date": "2019-09-27",
      "week_day": "tuesday"
    },
    {
      "id": 18,
      "customer": "customer 1",
      "movie_name": "Awesome movie 2",
      "seat": "number 2",
      "date": "2019-09-27",
      "week_day": "tuesday"
    },
    {
      "id": 19,
      "customer": "customer 1",
      "movie_name": "Awesome movie 2",
      "seat": "number 1",
      "date": "2019-09-28",
      "week_day": "tuesday"
    }
  ]
```

### Reservations list between dates

```
$ curl https://blockbuster-movies.herokuapp.com/api/reservations?sdate=2019-09-27&edate=2019-09-28

$ [
    {
      "id": 18,
      "customer": "customer 1",
      "movie_name": "Awesome movie 2",
      "seat": "number 2",
      "date": "2019-09-27",
      "week_day": "tuesday"
    },
    {
      "id": 19,
      "customer": "customer 1",
      "movie_name": "Awesome movie 2",
      "seat": "number 1",
      "date": "2019-09-28",
      "week_day": "tuesday"
    }
  ]
```




### Create a new reservation

```
$ curl -d '{"date": "2019-09-29","customer_id": 1,"movie_day_id": 5,"seat_id": 2}' -H "Content-Type: application/json" -X POST https://blockbuster-movies.herokuapp.com/api/movies

  {
    "id": 20,
    "date": "2019-09-29",
    "customer_id": 1,
    "movie_id": 2,
    "movie_day_id": 5,
    "seat_id": 2
  }
```
Explore the API
---------------

Explore the API using [Swagger UI](http://petstore.swagger.io). Run the application and point the explorer to `http://localhost:9292/api/swagger_doc` or `https://blockbuster-movies.herokuapp.com/api/swagger_doc`.
