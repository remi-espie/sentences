# k8s secure verb-noun app

At core, this is a simple app composed of:
- a "verb" service that generates random verbs
- a "noun" service that generates random nouns
- an "aggregator" service that combines and returns the two to the user

The app is designed to be deployed on a Kubernetes cluster. It was developed on a **k3d cluster**, but should work on any Kubernetes cluster.

It will be assumed that the user has k3d and kubectl installed.

To create the cluster, deploy the app and its security, run the following commands:

```bash
make run
```

If you already have a cluster up and running, you can deploy the app and its security by running the following commands:

```bash
make deploy
```

You can also run the following commands to clean up the cluster:

```bash
make destroy
```