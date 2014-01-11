#!/bin/sh

cp -v ceph-*.qcow2 /var/lib/libvirt/images/

virsh net-define isolated.xml

for d in alice daisy eric frank; do
  virsh define ceph-${d}.xml
done
