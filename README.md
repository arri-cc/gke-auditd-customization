# gke-auditd-customization

Boostrapping GKE nodes:

- https://cloud.google.com/solutions/automatically-bootstrapping-gke-nodes-with-daemonsets
- https://cloud.google.com/solutions/automatically-bootstrapping-gke-nodes-with-daemonsets#deploying_the_daemonset
- https://cloud.google.com/container-optimized-os/docs/concepts/disks-and-filesystem

DaemonSet Example: https://github.com/GoogleCloudPlatform/k8s-node-tools/blob/1b512278d64c4f2715205c782459649268c00ba4/os-audit/cos-auditd-logging.yaml
Script sources: https://chromium.googlesource.com/chromiumos/overlays/board-overlays/+/master/overlay-lakitu/chromeos-base/cloud-audit-config/files
git repo: `git clone https://chromium.googlesource.com/chromiumos/overlays/board-overlays`
