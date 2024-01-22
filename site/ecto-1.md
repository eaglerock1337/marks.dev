# ecto-1

<!-- markdownlint-disable MD033 -->
Peter: *"How's the grid holding up?"*<br>
Egon: *"Not good."*<br>
Winston: *"Tell him 'bout the Twinkie."*<br>
Peter: *"What about the Twinkie?"* <sub>~ *Ghostbusters (1984)*</sub>

Once I get the [Happy Little Cloud](hlc) in good working order, my plan is to finally replace my aging servers with some proper modern hardware. I didn't want to buy the hardware until I was sure I was ready, and finishing Happy Little Cloud is my litmus test.

## current servers

Here are the servers that I am planning to replace with the Ecto-1:

- `delorean`
  - my second-ever public server, the first one purpose-built
  - started life as a Dell Inspiron 530 in 2008
  - has a Q6600 Core 2 Quad CPU and 4GB of RAM
  - previously hosted all of my services
  - hosted my public Minecraft server for years
  - still acting as a webserver and fileserver
- `yanosh`
  - an old gaming machine repurposed as a server
  - hand-built with a 1st-gen Intel Core i7-860 processor and 8GB of RAM
  - acted as KVM hypervisor hosting multiple virtual machines
  - formerly hosted my internal DNS server, multiple game servers
  - system is no longer running as hardware is failing
- `stapler`
  - a mini-itx PC in a small-form-factor case
  - hand-built with a Ryzen 5 Q2400G APU and 16GB of RAM
  - formerly acted as my living room media server
  - currently acting as my Plex server
- `pihole`
  - my DNS sinkhole ad-blocking appliance
  - runs on a Raspberry Pi 4 4GB
  - acts as internal DNS for my network

I would like to repurpose `stapler` as a lightweight gaming machine and finally retire `delorean` and `yanosh` for good.

## the name

*"Soon, the city will be mine and Vigo's... mainly Vigo's."* <sub>~  Dr. Janosz Poha, *Ghostbusters 2*</sub>

<div style="text-align: center;">

!["A really creepy meme of Dr. Janosz Poha from Ghostbusters 2."](./_media/yanosh.jpg "Why am I drippings with goo? :size=75%")<br>*A prime example of a perfectly reasonable thing to name a server after.*
</div>

As you might have noticed, all of my servers are named after people or props from my favorite movies and shows. Here's my running list so far:

- `delorean` - time machine from *Back to the Future*
- `dodgson` - character from *Jurassic Park* and [YTMND star](https://dodgson.ytmnd.com/)
- `yanosh` - named after Janosz Poha from *Ghostbusters 2*
- `stapler` - red stapler from *Office Space*
- `gibson` - the mainframe computer from *Hackers*
- `septim` - the currency in the *Elder Scrolls* series of games
- `happy little cloud` - recurring character of *The Joy of Painting*

I wanted to keep the tradition going, but didn't really have a good idea for a name. The name for the Happy Little Cloud fit just a bit too well and picking a good, meaningful group of four was tough.

I eventually settled on `ecto-1`, as the iconic vehicle from Ghostbusters. The Ghostbusters themselves, `egon`, `peter`, `ray`, and `winston`, would be perfect names for the four nodes of the cluster.

## the plan

Currently my goal is to complete work on the [Happy Little Cloud](hlc), as I will be deploying the Ecto-1 in the same manner with the same tech stack. If I can get everything sorted there first, I can hit the ground running with the more serious silicon.

Once I'm ready, I plan to build `egon`, the first of the four Ryzen nodes. I originally spec'd out the servers in 2022 with the following build in mind:

- 1U short-depth server case with HDD hot-swap module
- Ryzen 7 5700G 3.8GHz 8-core CPU
- 64GB DDR4-3600 RAM
- 2x TB Samsung 970 Evo Plus m.2 SSD
- 4x Seagate 5TB 2.5" 5400RPM HDD

I saved a [PCPartPicker](https://pcpartpicker.com/user/EagleRock/saved/#view=Csv4pg) for the curious.

Since the 7000 series of Ryzen processors are out and prices and availability has changed since 2022, I will need to refresh the hardware list and do a bit more research before going forward.

## cluster services

 I plan to host the following services:

- New `eagleworld.net` homepage & reverse proxy
- Fileserver attached to HLC's NextCloud server
- [Plex server](https://www.plex.tv/) stack - video and audio sharing
- `old.eagleworld.net` - copy of my original [BlazeBlogger](http://blaze.blackened.cz/) website
- `minecraft.eagleworld.net` - old minecraft blog

I also hope to host several game servers as well:

- [Vintage Story](vintagestory.at) game server
- [Skyrim Together](https://skyrim-together.com/) game server
- [BeamMP](https://beammp.com/) game server
- [Satisfactory](https://www.satisfactorygame.com/) game server
- My old Minecraft game server
- My old Tekkit game server

As you can see, I have a lot in plan, stay tuned!
