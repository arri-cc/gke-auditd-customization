# Configuring custom auditd logs for GKE



## Overview

This project is a quick example of how to properly bootstrap GKE worker nodes to configure auditd with custom rules and streaming the events to Google Cloud Logging via fluentd.



### Auditd on Ubuntu vs ChromiumOS

To highlight the unique characteristics of using `auditd` using ChromiumOS, the distro used for COS-optimized images for GKE, the below table compares the standard capabilities included with Ubuntu vs ChromiumOS.

|                        |                                              | Ubuntu             | COS                |
| ---------------------- | -------------------------------------------- | ------------------ | ------------------ |
| kauditd (kernel space) | kernel space auditd daemon, writes to syslog | :white_check_mark: | :white_check_mark: |
| auditd (user space)    | user space auditd daemon, writes logs        | :white_check_mark: | :x:                |
| auditctl               | configures auditd (kauditd)                  | :white_check_mark: | :white_check_mark: |
| aureport               | creates audit reports                        | :white_check_mark: | :x:                |
| ausearch               | searches auditd logs                         | :white_check_mark: | :x:                |

## Solution

Given the exclusion of the auditd daemon from the COS image, the standard configuration files located at `/etc/audit` are not used, and logs are not written to the standard `/var/logs/audit.log` location.  Instead, `auditctl` configures the rules for the`kauditd` daemon, that then emits events via `syslog` managed by `journalctl`.

This sample project performs the following:

1. Defines a set of custom auditd rules exposed as a ConfigMap
2. Defines a custom configuration for the Stack Driver fluentd logging agent exposed as a ConfigMap
3. Defines a DaemonSet that bootstraps [1] any worker nodes running a COS image that configures auditd and the fluentd logging agent.





### Supporting Documentation:



- Boostrapping GKE nodes: https://cloud.google.com/solutions/automatically-bootstrapping-gke-nodes-with-daemonsets
- COS Filesystem: https://cloud.google.com/container-optimized-os/docs/concepts/disks-and-filesystem
- COS auditd DaemonSet Example: https://github.com/GoogleCloudPlatform/k8s-node-tools/blob/1b512278d64c4f2715205c782459649268c00ba4/os-audit/cos-auditd-logging.yaml
- COS auditd configuration source code: https://chromium.googlesource.com/chromiumos/overlays/board-overlays/+/master/overlay-lakitu/chromeos-base/cloud-audit-config/files
- COS auditd configuration source code git repo: `git clone https://chromium.googlesource.com/chromiumos/overlays/board-overlays`
- auditd documentation: https://github.com/linux-audit/audit-documentation/wiki
