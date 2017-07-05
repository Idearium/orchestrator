# Orchestrator

This repository contains Alpine Linux based Docker images that have been configured to automatically bootstrap a Consul cluster using Docker Compose and via Docker Cloud.

They've been designed around specifics involved in running on Docker Cloud, and Docker Compose.

These images are used throughout all Idearium projects that run on Docker Cloud. The images that are available through this project repository are:

- `idearium/consul`
- `idearium/consului`

## Testing

There are two targets for testing and running these images, locally for development and Docker Cloud.

The `docker-compose.yml` and `stack.yml` file demonstrate how to configure a complete application using these images. They include other containers such as Node.js to demonstrate how they should be used in a real project. These other non-core images can be found in `./testing`.

### Locally

To run locally, use `c up` which uses `docker-compose.yml` for orchestration.

You can access the following:

- http://orchestrator.idearium.local:8500/
- http://orchestrator.idearium.local:4000/

### Docker Cloud

To run on Docker Cloud, create a new node and run the `stack.yml` file.

## Base images

For more info about the base images used in these images please checkout [docker-alpine](https://github.com/smebberson/docker-alpine)

## Development

To develop these images, please see the [development](./DEVELOPMENT.md) guide.

## Production

These images are pushed to production by simply tagging and pushing to GitHub. Docker Cloud will pick up on these tags and automatically build the images remotely.

There are two tags used to initiate automated builds:

- `consul-vx.x.x` will build the `consul` image.
- `consului-vx.x.x` will build the `consului` image.

Whenever one of, or both of these tags are pushed, Docker Cloud will create an image with the same tag as the version, and a `latest`. For example, pushing a GitHub tag of `consul-v2.0.0` will produce `idearium/consul:2.0.0` and `idearium/consul:latest`.

`latest` is just a convenience which can be used in stack files, but should never be used in a Dockerfile (as these images are).

## Configuration

These images should just run out of the box, so there are few configuration options (other than what is already provided by the base images).

However, you can alter the user in which `go-dnsmasq` is run as. Simply set `GO_DNSMASQ_RUNAS` as an environment variable to determine the user in which `go-dnsmasq` will be run as. It defaults to `root` because of ongoing issues with `setcap` and Docker on certain platforms.
