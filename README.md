# halcyon-kubernetes
Please see [release notes](https://github.com/att-comdev/halcyon-kubernetes/releases) for current features.

Ansible playbooks for a kubadm-based kubernetes deployment, on supporting any cloud and any kubeadm-enabled OS.

**Currently Supported:**

  * OS: Ubuntu 16.04 *(Centos 7 coming soon)*
  * Providers: Virtualbox / Openstack *(AWS coming soon)*

**Requirements:**

  * Virtualbox 5.0 (5.2 will not work with Vagrant)
  * Virtualbox Extensions for 5.0
  * Ansible (version 2.1.1 and 2.1.2 tested)
  * Vagrant (1.8.4 or higher)
    - Following Vagrant Plugins (installed for you during first deploy):
      * vagrant-env
      * vagrant-git
      * vagrant-openstack-provider

Please see /docs/README.md for more information about SDN providers, plugins, and other useful information. Pull requests are welcome!

## Instructions
To use this project, simply use vagrant to bring up your environment:

```
v1k0d3n@machine:~ $ git clone https://github.com/att-comdev/halcyon-kubernetes.git
v1k0d3n@machine:~ $ cd halcyon-kubernetes
v1k0d3n@machine:~ $ vagrant up
```

When you want to use Openstack, edit the options in `./config.rb` to match your Openstack project, and deploy with the `--provider=openstack` flag:

```
v1k0d3n@machine:~ $ vagrant up --provider=openstack
```

NOTE: Please look over the options in `config.rb` for modifying number of nodes, subnet, and other information and if you want to make any modifications to the Ansible deployment, make changes to the `./kube-deploy/group_vars/all.yml` file.

# TODO

* Add CentOS Support
* Add conditionals for various deployments (using vagrant --provider flags; such as AWS provider).
