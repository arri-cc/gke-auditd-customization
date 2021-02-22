# gke-auditd-customization

|                        | Ubuntu             | COS                |
| ---------------------- | ------------------ | ------------------ |
| kauditd (kernel space) | :white_check_mark: | :white_check_mark: |
| auditd (user space)    | :white_check_mark: | :x:                |
| auditctl               | :white_check_mark: | :white_check_mark: |
| ausearch               |                    |                    |





Boostrapping GKE nodes:

- https://cloud.google.com/solutions/automatically-bootstrapping-gke-nodes-with-daemonsets
- https://cloud.google.com/solutions/automatically-bootstrapping-gke-nodes-with-daemonsets#deploying_the_daemonset
- https://cloud.google.com/container-optimized-os/docs/concepts/disks-and-filesystem

DaemonSet Example: https://github.com/GoogleCloudPlatform/k8s-node-tools/blob/1b512278d64c4f2715205c782459649268c00ba4/os-audit/cos-auditd-logging.yaml
Script sources: https://chromium.googlesource.com/chromiumos/overlays/board-overlays/+/master/overlay-lakitu/chromeos-base/cloud-audit-config/files
git repo: `git clone https://chromium.googlesource.com/chromiumos/overlays/board-overlays`

uses journald via systemd for logging, kauditd logs via syslog

https://blog.woohoosvcs.com/2020/10/demystifying-linux-auditd/