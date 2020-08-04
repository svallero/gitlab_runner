#!/bin/sh
helm repo add gitlab https://charts.gitlab.io

helm install --namespace gitlab --name gitlab-runner-test -f values_test.yaml gitlab/gitlab-runner
#helm upgrade --namespace gitlab gitlab-runner-test -f values_test.yaml gitlab/gitlab-runner

