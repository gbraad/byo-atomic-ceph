Build Your Own Atomic - Ceph
============================


## Artifacts

  * [Remote](https://gbraad.gitlab.io/byo-atomic-ceph/)
  * [Builds](https://gitlab.com/gbraad/byo-atomic-ceph/builds)


## Usage

```
ostree remote add --set=gpg-verify=false byo-atomic-ceph https://gbraad.gitlab.io/byo-atomic-ceph/
rpm-ostree rebase byo-atomic-ceph:centos-atomic-host/7/x86_64/ceph-jewel
systemctl reboot
```


## Links

  * [base](http://gitlab.com/gbraad/byo-atomic)
  * [ostree](https://github.com/gbraad/scratchpad/blob/master/technology/ostree.md)
