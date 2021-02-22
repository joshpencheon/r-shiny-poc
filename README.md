# r-shiny-poc
A proof-of-concept repo for building containerised R Shiny apps

## Building new images

To build images of all the shiny apps, run the following:

```
$ make build
```

They can then be pushed to the GitHub Container Registry (assuming your docker client is authenticated) using:

```
$ make push
```
