# halcyon-kubernetes
Please see [release notes](https://github.com/att-comdev/halcyon-kubernetes/releases) for current and planned features.

Ansible playbooks for a kubadm-based Kubernetes deployment, on supporting any cloud and any kubeadm-enabled OS.

**Currently Supported:**

  * OS: Ubuntu 16.04 *(Centos 7 coming soon)*
  * Network Deployment Options  *(Calico, Canal, Romana, Weave)*
  * Providers: Virtualbox / Openstack *(AWS coming soon)*

**Requirements:**

  * Ansible (version 2.1.1 and 2.1.2 tested)
  * BYOC (bring your own cloud environments)

Please see /docs/README.md for more information about SDN providers, plugins, and other useful information. Pull requests are welcome!

## Instructions
This project was originally implemented as a Vagrant deployment. If you are looking for the Vagrant-based deployment for this, please go to the [vagrant-halcyon-kubernetes](https://github.com/att-comdev/halcyon-vagrant-kubernetes) repository. Vagrant deployment and use instructions are provided in that repository (including deployments directly to AWS, Openstack, and Virtualbox).

1. Use your own inventory file, with the following groups:
    - kube-masters (single node: for now)
    - kube-workers (as many as you'd like, excluding the master)
    - kube-control (same as your master)
2. Deploy via Ansible


# TODO

* Add CentOS Support
* Terraform-based Deployment Options will be provided in another repository soon!
