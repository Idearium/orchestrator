# Orchestrator Changelog

## 1.1.0-beta-2

- Upgraded to newer versions of `smebberson/alpine-consul` and `smebberson/alpine-consul` which contain the fixes from `1.1.0-beta.2`.

## 1.1.0-beta-2

- Upgraded `consul-node-id` to use `uuidgen`.

## 1.1.0-beta-1

- Upgraded `consul` to `smebberson/alpine-consul:3.2.0-beta.1` (newer version of Consul).
- Upgraded `consul-ui` to `smebberson/alpine-consul-ui:2.2.0-beta.1` (newer version of Consul).
- Removed `GO_DNSMASQ_USER` in favour of `GO_DNSMASQ_RUNAS`, and set to root by default.
- Removed all custom `run` scripts.

## 1.0.1

- You can now set the ENV variable `GO_DNSMASQ_USER` in `consul` and `consului` to change which user `go-dnsmasq` is run as. Defaults to `go-dnsmasq` so that nothing changes between version upgrades unless you set the `GO_DNSMASQ_USER` ENV variable.

## 1.0.0

This is the first cut of the code, after transferring from the FDM repository.

### Features

- Automatic boostrapping of a Consul cluster.

### Platforms

Test on Docker Compose and Docker Cloud. Should work in other environments that support Docker's embedded DNS server (or works similarly by exposing service names as resolvable DNS entries).
