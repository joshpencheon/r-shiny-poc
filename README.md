# r-shiny-poc
A proof-of-concept repo for building containerised R Shiny apps. Also see the accompanying [infrastructure-as-code](https://github.com/joshpencheon/r-shiny-infrastructure-poc) repository.

## Building new images

To build images of all the shiny apps, run the following:

```
$ make build
```

They can then be pushed to the GitHub Container Registry (assuming your docker client is authenticated) using:

```
$ make push
```

## Orchestrated deployment

The built images can then be deployed in a configuration-driver manner.
See the accompanying [infrastructure repository](https://github.com/joshpencheon/r-shiny-infrastructure-poc) for details; specifically, the `deployments.tf` file.

