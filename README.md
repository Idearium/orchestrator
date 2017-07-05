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

These images are pushed to production by simply tagging and pushing to GitHub. [Codefresh](https://g.codefresh.io/repositories/idearium/orchestrator/builds?filter=trigger:build) will pick up on these tags and automatically build the images remotely.

Simply tag the repository and push the tag to GitHub. Use standard semver semantics to tag the repository. Codefresh will build based on the following rules:

- If the tag includes `beta`, i.e. `v1.0.0-beta.1` it will use the `:beta` tag.
- If the tag does not include `beta`, i.e. `v1.0.0` it will use the `:latest` tag.
- All tags will result in an images of the same tag being built, i.e. a tag of `v1.0.0-beta.1` will produce an image tagged `:1.0.0-beta.1`.

`:latest` is just a convenience which can be used in stack files, but should never be used in a Dockerfile (as these images are).

## Configuration

These images should just run out of the box, so there are few configuration options (other than what is already provided by the base images).

However, you can alter the user in which `go-dnsmasq` is run as. Simply set `GO_DNSMASQ_RUNAS` as an environment variable to determine the user in which `go-dnsmasq` will be run as. It defaults to `root` because of ongoing issues with `setcap` and Docker on certain platforms.
