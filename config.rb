# Kubernetes Details: Instances
$kube_version      = "ubuntu/xenial64"
$kube_memory       = 1024
$kube_vcpus        = 1
$kube_count        = 3
$git_commit        = "6a7308d"
$subnet            = "192.168.236"
$forwarded_ports   = {}

# Ansible Declarations:
#$number_etcd       = "kube[1:2]"
#$number_master     = "kube[1:2]"
#$number_worker     = "kube[1:3]"
$kube_masters      = "kube1"
$kube_workers      = "kube[2:3]"
$kube_control      = "kube1"

# Virtualbox leave / Openstack change to OS default username:
$ssh_user          = "ubuntu"
$ssh_keypath       = "~/.ssh/id_rsa"
$ssh_port          = 22

# Ansible Details:
$ansible_limit     = "all"
$ansible_playbook  = "kube-deploy/kube-deploy.yml"
$ansible_inventory = ".vagrant/provisioners/ansible/inventory_override"

# Openstack Authentication Information:
$os_auth_url       = "http://your.openstack.url:5000/v2.0"
$os_username       = "user"
$os_password       = "password"
$os_tenant         = "tenant"

# Openstack Instance Information:
$os_flavor         = "m1.small"
$os_image          = "ubuntu-trusty-16.04"
$os_floatnet       = "public"
$os_fixednet       = ['vagrant-net']
$os_keypair        = "your_ssh_keypair"
$os_secgroups      = ["default"]
