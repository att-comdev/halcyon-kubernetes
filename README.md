# halcyon-kubernetes
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

# TODO

* Add CentOS Support
* Add conditionals for various deployments (using vagrant --provider flags; such as AWS provider).
