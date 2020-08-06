#!/bin/sh
helm repo add gitlab https://charts.gitlab.io

tags="kube-yoga"
# We want to register a different runner for each project
project="hello-world"
# This is the project's token to add runners
# (get it from Settings->CI/CD->Runners)
token="FHqPAkZbkWse-fj7SBcC"

# Write the helm config file
cat <<EOF > values-${project}.yaml
gitlabUrl: https://git.ligo.org/
runnerRegistrationToken: ${token}
rbac:
  create: false
  serviceAccountName: runner
runners:
  privileged: true
  tags: ${tags}
EOF

helm install --namespace gitlab --name $project -f values-${project}.yaml gitlab/gitlab-runner
#helm upgrade --namespace gitlab $project -f values-${project}.yaml gitlab/gitlab-runner

