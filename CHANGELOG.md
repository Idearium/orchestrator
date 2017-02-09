# Orchestrator Changelog

## Unreleased

- You can now set the ENV variable `GO_DNSMASQ_USER` in `consul` and `consului` to change which user `go-dnsmasq` is run as. Defaults to `go-dnsmasq` so that nothing changes between version upgrades unless you set the `GO_DNSMASQ_USER` ENV variable.

## 1.0.0

This is the first cut of the code, after transferring from the FDM repository.

### Features

- Automatic boostrapping of a Consul cluster.

### Platforms

Test on Docker Compose and Docker Cloud. Should work in other environments that support Docker's embedded DNS server (or works similarly by exposing service names as resolvable DNS entries).
