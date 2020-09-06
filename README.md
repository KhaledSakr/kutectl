# kutectl
A couple of bash aliases and functions that I personally use to make my life easier when dealing with kubectl.

## Installation
```
git clone https://github.com/KhaledSakr/kutectl
cd kutectl
make
```
> This will show you a preview of all the aliases and functions that are going to be referenced in your bashrc. It's better to review them, for security reasons.

## Autocompletion
kubectl completion script is automatically installed to enable support for autocompletion in these commands.

## Commands
These are all the currently supported aliases/functions.

### pods
Lists dem pods.

### nodes
Lists dem nodes.

### deploys
Lists dem deployments.

### svc
Lists dem services.

### pod
Describes a pod.
> Supports autocompletion.

### deploy
Describes a deployment.
> Supports autocompletion.

### logs
Gets logs.
> Supports autocompletion.

### dlogs
Gets all the logs for a specific deployment (including all replicas).
* $1 Deployment to get the logs of.
> Supports autocompletion.

### scale
Scales a deployment.
* $1 Deployment to scale.
* $2 Replica count.
> Supports autocompletion.

### kexec
Gets a shell to a running container.
* $1 Pod to start the shell session on.
> Supports autocompletion.

### kedit
Edits a resource (using nano).
> Supports autocompletion.

### kapply
Applies a yaml file.

## Contribution
Feel free to submit a PR with additions/improvements.

## Docs
This README is generated using the custom [generate_md](./generate_md.js) javascript file from annotations right in the [.kutectl.bash](./.kutectl.bash) file.
Run `node generate_md.js` to autogenerate them.