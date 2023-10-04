sentry-kubernetes
=================

## Description
This is a fork of abandoned repo with some additionals to work properly.

You can check all new vars at [values.yaml](charts/sentry-kubernetes/values.yaml)

Tested on Kubernetes v1.24.6 + Sentry 22.6.0 (e68da5c)

All python requirements not freezes at my implementation and can be broken.


## Installation
```yaml
docker build --platform=linux/amd64 -f Dockerfile -t registry.local:5000/sentry-kubernetes:$(cat VERSION) -t registry.local:5000/sentry-kubernetes:latest .
docker push registry.local:5000/sentry-kubernetes:$(cat VERSION)
docker push registry.local:5000/sentry-kubernetes:latest

# create ns which you want and
# drop values.yaml with corrected values, than
helm install -n sentry-kubernetes -f values.yaml appname ./charts/sentry-kubernetes/

# than upgrade this if you need change some vars
helm upgrade -n sentry-kubernetes -f values.yaml appname ./charts/sentry-kubernetes/
```
