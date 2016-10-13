# Overview
The goal of this repo is to provide a quick development solution for using Kubernetes kubeadm (with [Vagrant multi-provider support](https://www.vagrantup.com/docs/providers/)).

To be clear, there are many great solutions available for building Kubernetes. This solution intends to adopt a native approach for building a Kubernetes cluster using `kubeadm`. `kubeadm` is very much in *active* development, and in it's current release (at this time, v1.4.1) is not intended for production workloads. However, as Kubernetes becomes easier to install using `kubeadm` and as development continues, solutions using `kubeadm` will become more commonplace.

This project is intended to provide a set of Ansible playbooks for for deploying `kubeadm` on various supported OS's (contingent on `kubeadm`), and within various supported environments (contingent on [Vagrant](https://www.vagrantup.com/docs/providers/)). The playbooks are plugable, so you can run them against existing environments. You can choose an SDN at the time of deployment, or you can choose to deploy add-ons manually. This is all possible because of Kubernetes flexible deployment model.

For more information about `kubeadm`, please go to: http://kubernetes.io/docs/getting-started-guides/kubeadm/

## Deploying an SDN
The future goal for these playbooks is to allow you to deploy a software-defined network (SDN) of your choice at the time of deployment by using definitions found in `./kube-deploy/group_vars/all.yml`. This option can be overriden. These options are:

  * Calico
  * Canal
  * Romana
  * Weave

## Deploying Tools and Dashboards
You may also choose to deploy various tools and dashboards to your cluster. Since these playbook support any number of Kubernetes add-ons, you can edit the `./kube-deploy/group_vars/all.yml` to define which add-ons you wish to install at the time of deployment.

For more information, please look at `group_vars`, and refer to the [Kubernetes Add-Ons](http://kubernetes.io/docs/admin/addons/) page.

## Cloud-Providers, Ingress/Controllers, etcd
As the `kubeadm` project expands, so will this project. We want to make this project useful for anyone, so if you have ideas, questions, or pull-requests, please feel free to contribute! Thanks for checking us out.
