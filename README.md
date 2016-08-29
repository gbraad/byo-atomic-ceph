Build Your Own Atomic - Ceph
============================


## Artifacts

  * [Remote](https://gbraad.gitlab.io/byo-atomic-ceph/)
  * [Builds](https://gitlab.com/gbraad/byo-atomic-ceph/builds)


## Usage

```
$ sudo su -
$ setenforce 0
$ ostree remote add --set=gpg-verify=false byo-atomic-ceph https://gbraad.gitlab.io/byo-atomic-ceph/
$ rpm-ostree rebase byo-atomic-ceph:centos-atomic-host/7/x86_64/ceph-jewel
$ systemctl reboot
```


## Deployment using `ceph-ansible`

```
$ git clone https://github.com/ceph/ceph-ansible.git
$ cd ceph-ansible
$ cp site.yml.sample site.yml
$ cp group_vars/all.sample group_vars/all
$ cp group_vars/mons.sample group_vars/mons
$ cp group_vars/osds.sample group_vars/osds
```

`hosts`
```
[mons]
atomic-01 ansible_ssh_host=10.3.0.15
atomic-02 ansible_ssh_host=10.3.0.18
atomic-03 ansible_ssh_host=10.3.0.14

[osds]
atomic-04 ansible_ssh_host=10.3.0.16
atomic-05 ansible_ssh_host=10.3.0.17
atomic-06 ansible_ssh_host=10.3.0.19
```


`group_vars/mons`
```
cluster_network: 10.3.0.0/24
generate_fsid: 'true'
skip_tags: 'with_pkg'
ceph_origin: distro
monitor_interface: eth0
public_network: 10.3.0.0/24
journal_size: 5120
cephx: false
```

`group_vars/osds`
```
journal_collocation: true
cephx: false
devices:
   - /dev/vdb
```

```
$ ansible -i hosts all -u centos -s -m shell -a "setenforce 0"
$ ansible -i hosts all -u centos -s -m shell -a "ostree remote add --set=gpg-verify=false byo-atomic-ceph https://gbraad.gitlab.io/byo-atomic-ceph/"
$ ansible -i hosts all -u centos -s -m shell -a "rpm-ostree rebase byo-atomic-ceph:centos-atomic-host/7/x86_64/ceph-hammer"
$ ansible -i hosts all -u centos -s -m shell -a "systemctl reboot"  # will throw errors as connection is dropped
$ ansible -i hosts all -u centos -s -m ping
$ ansible-playbook -i hosts site.yml --skip-tags with_pkg,package-install
```


## Links

  * [base](http://gitlab.com/gbraad/byo-atomic)
  * [ostree](https://github.com/gbraad/scratchpad/blob/master/technology/ostree.md)
  * [scratchpad](https://github.com/gbraad/scratchpad/blob/master/technology/ceph.md)
