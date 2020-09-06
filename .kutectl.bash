#!/bin/bash

# @title kutectl
# @brief A couple of bash aliases and functions that I personally use to make my life easier when dealing with kubectl.

# @subtitle Installation
# @description ```
# @description git clone https://github.com/KhaledSakr/kutectl
# @description cd kutectl
# @description make
# @description ```
# @note This will show you a preview of all the aliases and functions that are going to be referenced in your bashrc. It's better to review them, for security reasons.

# @subtitle Autocompletion
# @description kubectl completion script is automatically installed to enable support for autocompletion in these commands.
source <(kubectl completion bash)

# @subtitle Commands
# @description These are all the currently supported aliases/functions.

# @name pods
# @description Lists dem pods.
alias pods='kubectl get pods'

# @name nodes
# @description Lists dem nodes.
alias nodes='kubectl get nodes'

# @name deploys
# @description Lists dem deployments.
alias deploys='kubectl get deploy'

# @name svc
# @description Lists dem services.
alias svc='kubectl get svc'

# @name pod
# @description Describes a pod.
# @note Supports autocompletion.
alias pod='kubectl describe pod'
complete -F __kubectl_get_resource_pod pod

# @name deploy
# @description Describes a deployment.
# @note Supports autocompletion.
alias deploy='kubectl describe deploy'
complete -F __kubectl_parse_get "deploy" deploy

# @name logs
# @description Gets logs.
# @note Supports autocompletion.
alias logs='kubectl logs'
complete -F __kubectl_require_pod_and_container logs

# @name dlogs
# @description Gets all the logs for a specific deployment (including all replicas).
# @arg $1 Deployment to get the logs of.
# @note Supports autocompletion.
dlogs()
{
  kubectl logs deploy/"$1" "${@:2}"
}
complete -F __kubectl_parse_get "deploy" dlogs

# @name scale
# @description Scales a deployment.
# @arg $1 Deployment to scale.
# @arg $2 Replica count.
# @note Supports autocompletion.
scale()
{
  kubectl scale deploy "$1" --replicas="$2" "${@:3}"
}
complete -F __kubectl_parse_get "deploy" scale

# @name kexec
# @description Gets a shell to a running container.
# @arg $1 Pod to start the shell session on.
# @note Supports autocompletion.
kexec()
{
  kubectl exec "$1" -ti sh "${@:2}"
}
complete -F __kubectl_parse_get "deploy" scale

# @name kedit
# @description Edits a resource (using nano).
# @note Supports autocompletion.
kedit()
{
  KUBE_EDITOR="nano" kubectl edit "$@"
}
complete -F __kubectl_get_resource kedit

# @name kapply
# @description Applies a yaml file.
kapply()
{
  kubectl apply -f "$@"
}

# @subtitle Contribution
# @description Feel free to submit a PR with additions/improvements.

# @subtitle Docs
# @description This README is generated using the custom [generate_md](./generate_md.js) javascript file from annotations right in the [.kutectl.bash](./.kutectl.bash) file.
# @description Run `node generate_md.js` to autogenerate them.
