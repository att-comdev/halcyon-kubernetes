# Halcyon-Kubernetes Quickstart

Please see [release notes](https://github.com/att-comdev/halcyon-kubernetes/releases) for current and planned features.

Ansible playbooks for a kubadm-based Kubernetes deployment, on supporting any cloud and any kubeadm-enabled OS. This project is intended to provide a quick and lightweight solution for development of [Kolla-Kubernetes](http://docs.openstack.org/developer/kolla-kubernetes/quickstart.html), or any other type of development environment which requires the use of Helm and PVC's (i.e. Ceph) for Kubernetes resources.

**Currently Supported:**

  * OS: Ubuntu 16.04 and CentOS 7 *(CoreOS coming soon)*
  * Network Deployment Options  *(Calico, Canal, Flannel, Romana, Weave)*
  * Providers: Virtualbox / Libvirt / Openstack *(AWS coming soon)*
  * [Kubernetes Version Options](https://github.com/kubernetes/kubernetes/releases) (any version  1.4 or newer)

**Requirements:**

  * Ansible (version 2.1.1 and up)
  * BYOC (bring your own cloud environments) or Bare Metal Deployment Options

Please see /docs/README.md for more information about SDN providers, plugins, and other useful information. Pull requests are welcome!


## Instructions

This project was originally implemented as a Vagrant deployment. If you are looking for the Vagrant-based deployment for this, please go to the [vagrant-halcyon-kubernetes](https://github.com/att-comdev/halcyon-vagrant-kubernetes) repository. Vagrant deployment and use instructions are provided in that repository (including deployments directly to AWS, Openstack, and Virtualbox).

1. Use your own inventory file, with the following groups (see included `sample-inventory` file):
    - kube-masters (single node: for now)
    - kube-workers (as many as you'd like, excluding the master)
    - kube-control (same as your master)
2. Make any needed/custom modifications to the included `kube-deploy/group_vars/all.yml` configuration file.
3. Ensure pre-requisites are installed:
    - `$ pip install virtualenv`
4. From the root of the project:
    - `$ make`
    - `$ venv/bin/activate`
5. From the `kube-deploy` folder:
    - Use Ansible to deploy your cluster: `$ ansible-playbook -i ../inventory.ini kube-deploy.yml`

## Development Friendly

If you want to run these playbooks alone, and you want to destroy your cluster (in order to start over) you can issue the following ansible command against your inventory to "reset" `kubeadm`:

```
$ ansible -i ./inventory.ini all -b -m shell -a 'kubeadm reset'
```

This will destroy your cluster, and allow you to re-run these ansible playbooks again to rebuild a cluster.


## Add-Ons

This project will also support add-ons; both Kubernetes native add-ons as well as projects such as [Helm](https://github.com/kubernetes/helm) (for developing Kubernetes Helm [Charts](https://github.com/kubernetes/charts)). A Current list of add-ons include:

  - [Kubernetes Dashboard](https://github.com/kubernetes/dashboard)
  - Helm

You will find these options in the `group_vars/all.yml` file.

# TODO

* Terraform-based Deployment Options will be provided in another repository soon!
