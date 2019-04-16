# WPEngine Boilerplate

This repo gives you a functioning dev environment that can be pushed to a WP Engine instance. This repo is built on the `wordpress:latest` docker container, and should remain up to date.

## Getting Up And Running

We recommend using [`degit`](https://github.com/Rich-Harris/degit) to scaffold your project. Setup is simple:

```sh
npm install -g degit
degit apsislabs/wpengine-boilerplate wp
cd wp
docker-compose up -d
docker-compose exec wordpress bin/bootstrap
```

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

## Custom Theme

If you're writing a from-scratch theme for the new project, consider [cabinet](https://github.com/apsislabs/cabinet) as a starting point.

```
degit apsislabs/cabinet wp-content/theme/<your-theme-folder>
```

## Custom Post Types

If you need to register custom post types or custom taxonomies for the new project, consider [carpenter](https://github.com/apsislabs/carpenter).

```
degit apsislabs/carpenter wp-content/plugins/carpenter
```

## Resetting your Dev Environment

If you want to completely reset your dev environment, the easiest way is to run:

```sh
$ docker-compose down -v && docker-compose up -d --build
```

This is aliased as `bin/reset`.

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

---

# Built by Apsis

[![apsis](https://s3-us-west-2.amazonaws.com/apsiscdn/apsis.png)](https://www.apsis.io)

`wpengine-boilerplate` was built by Apsis Labs. We love sharing what we build! Check out our [other libraries on Github](https://github.com/apsislabs), and if you like our work you can [hire us](https://www.apsis.io/work-with-us/) to build your vision.
