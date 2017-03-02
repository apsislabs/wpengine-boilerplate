# WPEngine Boilerplate

This repo gives you a functioning dev environment that can be pushed to a WP Engine instance. This repo is built on the `wordpress:latest` docker container, and should remain up to date.

# Getting Up And Running

Getting up and running should be a very straightforward process.

1. Run `vagrant up`
2. Run `docker exec <docker instance> bin/bootstrap`
3. Visit `http://localhost:8000/wp-admin`
4. Rejoice

# Deployment

## Staging

1. Add the WP Engine as a remote endpoint: `git remote add staging <wpengine git url>`
2. Push to the remote: `git push staging <your branch here>`

## Production

You can add the Production server as an endpoint the same way that we add Staging, but the preferred method of deployment to Production is to deploy with `git` to Staging, and then to use WP Engine's dashboard to copy the Staging Site to Live.
