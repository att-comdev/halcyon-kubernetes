# Romana Documentation and Information:
Romana is installed by default for this vagrant deployment to work around some of the NAT issues present with kubeadm/vagrant deployments. Since version 1.0.2, Romana is installed automatically for users per global_vars definitions. If you choose to install and learn on your own, feel free to continue to use the instructions below.

# About Romana
Romana has an interesting and simplistic approach towards providing policy to their SDN solution. It works in both Openstack and Kubernetes-based environments. More information [can be found at the following URL](http://romana.io/).

# Romana Installation Instructions:

1. First, install jq onto each of the hosts:
`ansible --ssh-extra-args='-o StrictHostKeyChecking=no' -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory all -s -m apt -a pkg=jq`

2. Log into the Kubernetes master:
`vagrant ssh kube1`

3. Become `root`:
`sudo -i`

4. Download each of the manifests:
```
files=(
    https://raw.githubusercontent.com/romana/romana/master/containerize/specs/romana-services-manifest.yml
    https://raw.githubusercontent.com/romana/romana/master/containerize/specs/romana-agent-daemonset.yml
)
wget "${files[@]}"
```

5. Edit the Romana Services manifest:
`vi romana-services-manifest.yml`
--> Change this
```
    args:
    # - --cidr=10.0.0.0/8
    env:
```
--> To this
```
    args:
    - --cidr=10.0.0.0/8
    - --interface=enp0s8
    env:
```

6. Install the manifest (using Kubernetes Add-Ons method):
`cp romana-services-manifest.yml /etc/kubernetes/manifests`

7. Edit the Romana Agent Manifest:
`vi romana-agent-daemonset.yml`
<br>
--> Change this:
```
        args:
        # - --romana-root=http://romana-root:9600
        securityContext:
```
<br>
--> To this
```
        args:
        - --romana-root=http://172.16.35.11:9600
        - --interface=enp0s8
        securityContext:
```

8. Lastly, install the Daemonset:
`kubectl apply -f romana-agent-daemonset.yml`

Done!

# Further Documentation and Feedback:
Romana is interested in getting your feedback! You can reach out to them on the [Romana Slack Channel](romana.slack.com).
