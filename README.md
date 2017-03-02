# WPEngine Boilerplate

This repo gives you a functioning dev environment that can be pushed to a WP Engine instance. This repo is built on the `wordpress:latest` docker container, and should remain up to date.

## Getting Up And Running

Getting up and running should be a very straightforward process. You'll need both `git` and `docker` installed on your machine.

1. Run `git clone --depth=1 git@github.com:apsislabs/wpengine-boilerplate.git <your project>`
2. Run `docker-compose up -d`
3. Run `docker exec <container name> bin/bootstrap`
4. Visit `http://localhost:8000/wp-admin`
5. Rejoice

## Recommended Customizations

There are two files that you ought to customize before beginning development in earnest. The first is your `docker-compose.yml` file, where you'll want to change your `container_name` to avoid conflicts.

Second, check ot the `.env.dev` file for environment variables used by the `bootstrap` script. Here you can change the `username`, `password`, or `email` for the user created by the `bootstrap` script.

## Logging In

After running bootstrap, there should be a user created with the following:

```
username: admin
password: password
```

You can log in by visiting `localhost:8000/wp-admin`.

## Resetting your Dev Environment

If you want to completely reset your dev environment, the easiest way is to run:

```sh
$ docker-compose down -v && docker-compose up -d --build
```

This will remove the mounted volume where all local data is stored, then rebuild the container. If you do this, be sure to re-run:

```sh
$ docker exec <container name> bin/bootstrap
```

# Deployment

## Staging

1. Add the WP Engine as a remote endpoint: `git remote add staging <wpengine git url>`
2. Push to the remote: `git push staging <your branch here>`

## Production

You can add the Production server as an endpoint the same way that we add Staging, but the preferred method of deployment to Production is to deploy with `git` to Staging, and then to use WP Engine's dashboard to copy the Staging Site to Live.
