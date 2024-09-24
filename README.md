# How to run on local machine

```
  git clone git@github.com:darko-komericki/jade.git
  cd jade
  docker-compose build
```

If build fails or hangs over few minutes on `# Installing sassc 2.4.0 with native extensions` increase docker memory under resources.

```
docker-compose up -d
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:migrate
docker-compose run --rm web rails db:seed
```

Seed data will create 300 sample job ads and one user that can do CRUD on ads and review job applications.

User can login under `http://localhost:3000/users/sign_in`
```
Email: jd@jade.jobs
Password: jade:2021
```

Email for job application can be previewed on `http://localhost:3000/rails/mailers/job_application_mailer/send_confirmation` but at least one job application must be submitted.

If you have any questions feel free to contact me.
