# homelab

<!-- markdownlint-disable MD033 -->
<div style="text-align: center;">

!["A picture of my homelab in the dark with fancy, blinky lights."](./_media/hlc.jpg "Let's all be honest here. Who doesn't love colorful, blinky lights?")*The obligatory [Hollywood Lights](storytime#hollywood-lights)* <sup>:tm:</sup>.
</div>

I've been wanting to upgrade my homelab for a while. After getting my home wired with Ethernet during renovations, I had an opportunity to redo my entire home network from scratch, and wanted to build it out as professionally as I could. Most of my professional work has had to cut corners somewhere for practical business reasons, but I could do this without a timeline, other than replacing my current aging servers before they beep their last boop.

## the idea

I'm very much a fan of building things in a compact and efficient manner, especially since a full-length 42U server rack would be a logistical nightmare to fit in my basement. Instead, I wanted to go for something short-depth and possibly wall-mounted. After searching online for what was available and weighing the options, I settled on the following setup:

- [NavePoint 9U short-depth wall-mount rack](https://navepoint.com/navepoint-9u-600mm-depth-networking-cabinet-performance-series/)
- [15 amp, 8 slot power distribution unit](https://www.amazon.com/gp/product/B00KFZ98YO/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)
- [Ubiquiti Dream Machine SE](https://store.ui.com/us/en/collections/unifi-dream-machine)
- [Ubiquiti Pro 48 Layer 3 Switch](https://store.ui.com/us/en/collections/unifi-switching-pro-ethernet)
- [12-node Raspberry Pi Kubernetes Cluster](https://www.amazon.com/gp/product/B098924W9M/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1)
- [4-node Ryzen 7 based Kubernetes Cluster](https://pcpartpicker.com/user/EagleRock/saved/#view=Csv4pg)
- [APC Back-UPS Pro 1500VA Uninterruptable Power Supply](https://www.apc.com/us/en/product/BN1500M2/apc-backups-pro-1500va-tower-120v-10-nema-515r-outlets-lcd-1-usb-type-c-+-1-usb-type-a-ports/)

The specs have been tweaked throughout the process (especially the network hardware), and the hardware list needs to be refreshed for 2024, but the plan essentially remains the same: replace with new hardware, use [Kubernetes](https://kubernetes.io/) (k8s for short) to cluster it together.

>[!TIP]
>For the [ELI5](https://www.reddit.com/r/explainlikeimfive/) version of Kubernetes, check out [this YouTube video](https://www.youtube.com/watch?v=4ht22ReBjno). Yes, it's a children's book, but don't be fooled: in my opinion, it's the best 8-minute guide to Kubernetes there is.

## the migration

<div style="text-align: center;">

![A picture of my oldest running server on the floor.](./_media/delorean.jpg "You may not like it, but this is what the peak server hardware form looks like. :size=60%")<br>`yanosh` *(left), is on its last legs and offline.*<br>`delorean` (right) *refusing to quit after 15 years.*
</div>

Prior to the project, I had the following servers at home:

- `delorean` - my oldest server, still running my fileserver, reverse proxy, and some webservers
- `yanosh` - an old gaming computer turned KVM hypervisor, shut down due to system failures
- `stapler` - my Plex server formerly serving double-duty as a living-room set-top PC
- `pihole` - a Raspberry Pi 4 working as my internal DNS and DNS sinkhole adblocker

The gist of the migration is to migrate everything off of these old servers before they meet the great daemon in the sky. Before I buy some serious hardware, however, I want to be ready to go with a new rack, network, and a Raspberry Pi Kubernetes cluster to test everything out before I get started.

## the plan

<div style="text-align: center;">

![A picture of my homelab in New Jersey.](./_media/homelab2.jpg "I believe I have my stapler.")*The homelab today,* `stapler`, *and [my stapler](https://www.youtube.com/watch?v=pHHZBmF8mk4).*
</div>

As such, my migration plan became the following:

- install a proper rack for all my servers
- remove single points of failure where possible
- upgrade my home network hardware
- build out multiple virtual networks (VLANs)
- lock down all IoT (Internet-of-Things) devices
- revive my Happy Little Cloud k8s cluster
- deploy basic websites and services
- prove out my home tech stack
- deploy first node of Ecto-1 k8s cluster
- migrate remaining services to Ecto-1
- repurpose `stapler` as spare gaming PC
- decomission `delorean` and `yanosh`
- [???](https://www.youtube.com/watch?v=a5ih_TQWqCA)
- profit!

Delorean has served me well for many years and has had all of its RAM and hard disks replaced at least once at this point. I'm just hoping it'll hold out until I'm ready to buy the replacement hardware. :crossed_fingers:

Honorable mention to Yanosh still hanging in there as Delorean's official keyboard stand! :1st_place_medal:

## network

> [!NOTE]
> I'm still in the process of finishing the network configuration and will write this out when done. In the meantime, here's a video of [celebrities explaining DevOps](https://www.youtube.com/watch?v=QxvmO-QlxJQ).

I'll write up some more details on how I built out the network later. In the meantime, check out how I started building the [happy little cloud](hlc)!
