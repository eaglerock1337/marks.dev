# Bootstrapping hlc.marks.dev

The following is a record of the deployment of Happy Little Cloud, my Raspberry-Pi-based Kubernetes cluster designed to host [marks.dev](https://marks.dev) and other personal projects.

## Approach and Goals

- I am using [this guide by Alexander Sniffin](https://alexsniffin.medium.com/a-guide-to-building-a-kubernetes-cluster-with-raspberry-pis-23fa4938d420) as a starting template
- Build in additional production-grade security (e.g. no unauthenticated logins, port restrictions)
- Leverage ArgoCD as the primary orchestration system for all services
- Create Helm charts for all internal services to be managed by ArgoCD
- Services for the cluster to manage:
  - `HTTP/80` - Internal websites and local network traffic
  - `HTTPS/443` - External site traffic using letsencerypt.org as the CA
  - `PiHole/53` - [DNS-based ad blocking](https://pi-hole.net/) for running on Raspberry Pi
  - `DNS/53` - BIND internal DNS server managing internal domains with PiHole as its root
  - `Prometheus/9090` - Metrics gathering and system monitoring
  - `Grafana/8080` - System analytics and data visualization site
  - `Ansible/22` - Cluster-hosted baremetal server orchestration and configuration
  - `Tekton` - Kubernetes-based cloud-native CI/CD pipeline framework
  - `Upptime/443` - Uptime Monitoring and status page ([status.marks.dev](https://status.marks.dev))
  - `Nextcloud` - [On-prem cloud solution](https://nextcloud.com/) for sharing files, calendars, contacts, and tasks across all devices
  - `Plex/32400` - [On-prem media streaming service](https://plex.tv/) for TV, Movies, and Audio
  - `Home Assistant` - [Home automation](https://www.home-assistant.io/) and IoT device management solution

## Stage 1 - Initial Deployment

### Stage 1.1 - Baremetal server configuration

- Pull latest [tested-images](https://raspi.debian.net/tested-images/) from [raspi.debian.net](https://raspi.debian.net)
- Image all 12 Raspberry Pi SDs
- Manual SD configuration:
  - `config.txt` - set hostname and authorized key
  - `cmdline.txt` - append `cgroup_enable=memory cgroup_memory=1`
- Install all SDs and boot Raspberry Pis
- Configure DHCP address reservations on Unifi router
- Configure DNS entries in PiHole
- Test: `for i in 401 402 403 404 301 302 303 304 305 306 307 308; do fping hlc-$i.marks.dev; done`

### Stage 1.2 - Cluster setup thru Ansible

- Refresh `ansible` repo and create `marks_dev` role to start configuration
- Reorganize `marks_dev` repo to support future tooling and documentation needs
- `marks_dev` role setup:
  - Create `bob` service user for cluster operations
- Initial run:
  - Need to set `remote_user: root` to plays in `marks.dev.yml`
  - Install python3 & pip3: `for i in 401 402 403 404 301 302 303 304 305 306 307 308; do ssh root@hlc-$i.marks.dev "apt update && apt install -y python3 python3-pip"; done`
  - Get `common` role installed
  - Debug `marks_dev` role for installing `bob` user
  - Add installing Docker to setup
  - Add installing Python3 as well
  - Until I get handlers setup: `for i in 401 402 403 404 301 302 303 304 305 306 307 308; do ssh root@hlc-$i.marks.dev reboot; done`
  - Got Kubernetes installed with `containerd` as the CRI

### Stage 1.3 - Attempted boostrapping with standard Kubernetes

- First bootstrapping
  - log in as `bob` on `hlc-401.marks.dev`
  - copy over `kubeadm-config.yaml` file
  - `sudo kubeadm init --config kubeadm-config.yaml`
  - move `/etc/kubernetes/admin.conf` to `/home/bob/.kube/config`
  - `kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml`
  - `for i in 402 403 404 301 302 303 304 305 306 307 308; do ssh root@hlc-$i.marks.dev kubeadm join 10.23.50.41:6443 --token builda.happylittlecloud --discovery-token-ca-cert-hash sha256:87ce29360abc518d6a0e74fee99bb53e66858ee6da89e8c6015905eeb8616248; done`
- Troubleshooting
  - deployed k8s `1.29.0` and `1.26.12` with constant `CrashLoopBackOff`s
  - issue seems to be due to resource constraints
  - attempt to install k3s with the ansible playbook 
  - distributed setup did not work
  - attempting now with k3s manually after configuring shared storage

### Stage 1.4 - Different approach with k3s

- Configuring NFS
  - install `nfs-kernel-server` and `xfsprogs` on hlc-401
  - add `ntp` and server updating to ansible playbooks
  - create xfs partition on `/dev/sda1`
  - create `/data` directory and mount partition to it
  - xfs caused i/o errors, defaulted to ext4
  - nfs server ready to share
  - looking at `nfs-subdir-external-provisioner` as an on-cluster storage solution
- Starting up k3s
  - `ssh-copy-id bob@hlc-###.marks.dev`
  - already present due to attempted ansible playbook
  - needed to try once and fail, run `k3s-uninstall.sh`, then try command again:
  - `curl -sfL https://get.k3s.io | K3S_TOKEN=<redacted> sh -s - server --cluster-init`
  - `cat /var/lib/rancher/k3s/server/node-token` to get full token
  - Now, create 3 more control plane nodes from the rpi4s:
  - `curl -sfL https://get.k3s.io | K3S_TOKEN=<redacted> sh -s - server --server https://hlc-401.marks.dev:6443`
  - To remove etcd, I had to uninstall k3s on hlc-401 and run:
  - `curl -sfL https://get.k3s.io | K3S_TOKEN=<redacted> sh -s - server --disable-etcd --write-kubeconfig-mode=644 --server https://hlc-402.marks.dev:6443`
  - The rest of the servers (301-308):
  - `curl -sfL https://get.k3s.io | K3S_TOKEN=<redacted> sh -s - agent --server https://hlc-401.marks.dev:6443`
  - Labeling:
    - `kubectl label node hlc-401.marks.dev node-role.kubernetes.io/nfs=true`
    - `for i in 301 302 303 304 305 306 307 308; do kubectl label node hlc-$i.marks.dev node-role.kubernetes.io/agent=true; done`
    - `for i in 301 302 303 304 305 306 307 308; do kubectl label node hlc-$i.marks.dev node-role.kubernetes.io/agent-; done`
    - `for i in 301 302 303 304 305 306 307 308; do kubectl label node hlc-$i.marks.dev node-role.kubernetes.io/worker=true; done`

### Stage 1.5 - Filling out core functionality

- What's left:
  - Still need to install `nfs-subdir-external-provisioner`
  - Need to determine where etcd is storing its crap and use a USB key to supplement storage
  - `/var/lib/rancher` seems to be the culprit...worth exploring a solution
    - Use 4 USB3.0 drives for this (all 4 control planes)
  - Need to determine a load-balancing solution
    - MetalLB is an option - [metallb.universe.tf](https://metallb.universe.tf/)
  - ArgoCD
  - All the rest thru Argo
