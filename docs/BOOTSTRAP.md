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

- Refresh `ansible` repo and create `marks.dev` role to start configuration
- Reorganize `marks.dev` repo to support future tooling and documentation needs
- `marks.dev` role setup:
  - Create `bob` service user for cluster operations
- 
