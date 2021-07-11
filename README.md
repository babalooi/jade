# How to run on local machine

```
  git clone git@github.com:babalooi/jade.git
  cd jade
  docker-compose build
```

If build fails or hangs over fiew minutes on `# Installing sassc 2.4.0 with native extensions` increase docker memory under resources.

```
docker-compose up -d
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:migrate
docker-compose run --rm web rails db:seed
```

If you have any questions feel free to contact me.
