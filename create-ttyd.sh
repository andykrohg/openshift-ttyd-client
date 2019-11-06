#!/bin/bash
for i in {1..50}
do
oc login https://master.hud-fd39.open.redhat.com:443 -u user$i -p $PASSWORD
# oc new-project occli-$i
oc project occli-$i
oc delete svc/openshift-ttyd-client
oc delete route/openshift-ttyd-client
oc delete dc/openshift-ttyd-client
oc new-app quay.io/akrohg/openshift-ttyd-client -e KUBECONFIG=/tmp/.kube/config
oc expose svc/openshift-ttyd-client --port 8080
oc logout
done
