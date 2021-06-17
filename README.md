# Digital Jungle

### [WIP] Pipeline Status

### Ruby Version: 2.6.6

To install it with rbenv please run

```
$ rbenv install 2.6.6
```

### Rails version: 6.1.3

### Databaste: PostGreSQL

### Run the app localy

```
git clone git@github.com:jromainkrupa/digital-jungle.git
cd digital-jungle
bundle install
yarn install
rails db:drop
rails db:create
rails db:migrate
rails db:seed
rails s
```

---

### Prototype

- [FlowCharts](https://www.figma.com/file/wChJBPNYRIUfGvWXxbKM25/Digital-Jungle-Design?node-id=166%3A143) on _June 2021_

---

### Environments

#### Add Git Remote for staging and production

```
git remote add staging https://git.heroku.com/digitaljungle-staging.git
```

```
git remote add production https://git.heroku.com/digitaljungle.git
```

#### [WIP] Links

| Environment   | Link                                         |
| ------------- | -------------------------------------------- |
| `development` | http://localhost:3000/                       |
| `staging`     | https://digitaljungle-staging.herokuapp.com/ |
| `production`  | https://www.digitaljungle.camp/              |

---

### Environment Variables Setup

Using Autoenv, Dotenv (or similiar)

```sh
cp example.env .env
```

Fill in with values in Bitwarden and explanation below.

---

### Email

#### Development environment

We use Letter opener for email in `development`.
Email sent will be open in a new tab of your default browser.

---

#### [WIP] Staging environment

#### [WIP] Production environment

---

### Background jobs

We use Sidekiq as our queueing backend for background jobs. In development,
you need to launch `sidekiq` in a tab of your terminal so that background jobs
are executed. To remove all the enqueued jobs in development,
run `redis-cli FLUSHALL`

---

### Payments via Stripe

---

### Active Storage

---
