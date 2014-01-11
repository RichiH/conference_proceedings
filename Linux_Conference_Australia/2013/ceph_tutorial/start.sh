#!/bin/sh

for d in alice daisy eric frank; do
  virsh start ceph-${d}
done
