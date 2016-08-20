# BoJack + Kemal + Heroku
> a BoJack server running on Heroku

### Intro
This is an example of a project with BoJack, Kemal and Heroku.

BoJack stores a counter, while Kemal provides a web-interface and Heroku servers.

Unfortunately doing heroku buildpack problems, for now BoJack is running in the same process as kemal,
but we plan to change that as soon by creating a bojack buildpack.

### Deploy

1) Clone the project

```shell
git clone https://github.com/marceloboeira/bojack-kemal-heroku.git
```

2) Create a heroku crystal app

```shell
heroku create my_bojack_app --buildpack https://github.com/crystal-lang/heroku-buildpack-crystal.git
```

3) Push to heroku

```shell
git push heroku master
```
