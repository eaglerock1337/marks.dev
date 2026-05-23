# on linux vs. windows

My take on the classic Linux vs. Windows debate.

# Pics to use in this article:
  - tux walking over the redmond campus
  - A pic of my desktop
  - A pic of windows flooded with AI
  - something from XKCD linux-related maybe

## why the hell do you use linux?

There's a bunch of reasons that I personally choose to use Linux as my daily-driver at home. First of all, I cannot stand Windows. I never could. Even back in the day when I was first playing with Windows 3.1 and Windows 95, the operating system wasn't particularly stable, but that wasn't even my biggest gripe. Rather, my gripe with Windows is how *random* everything was.

I first started learning the ins-and-outs of Windows by customizing the OS as much as I could through the built-in menus and whatnot. However, everything that I learned was essentially learned through two things: trial-and-error and rote memorization. There was no rhyme nor reason to why things were the way they were, that's just how they were. Why did Windows use backslashes to differentiate directories? Why was the C drive the main hard drive of the system? Why were application configs nestled away a rat's nets of configs known as the Windows Registry?

### so random

<div style="text-align: center;" class="article-image article-image-right-wide";>

!["The Confused Jackie Chan meme with the text 'How are you so random'."](../_media/so-random.jpg "Jackie says it all. :size=80%")
</div>

Eventually, I would learn why things were so random once I made it to college and started my Computer Science degree. In the CS lab, we had a bunch of Windows NT computers all networked together as well as a [Sun Enterprise 450](https://unixhq.com/systems/sun-e450/) server running Solaris 8, Sun Microsystems' version of UNIX. Once I got access to the lab and was handed a little pamphlet designed to help students acclimate to UNIX, my mind was blown.

<div style="text-align: center;" class="article-image article-image-left";>

!["The Tim and Eric mind blown animated gif."](../_media/mind-blown.gif "Something funny :size=80%")<br>*Actual picture of me from the year 2000.*
</div>

When I started reading about and playing with UNIX, everything all of a sudden started to make sense. First of all, the filesystem was organized very differently, without arbitrary letters denoting certain disks or disk drives. Instead, every file lived under the root directory (`/`). Root was the most important directory, everything lived under it. Other hard drives would be mounted in strategic places under root, filling in a clear hierarchical structure that felt intuitive.

Speaking of intuitive, the ugly backslash was gone, replaced with the elegant forward slash. Directories all of a sudden started appearing as cascading nested folders, such as `/usr/src/bin` or `/home/pmarks/.profile`. This didn't click when I saw the backslashes (such as `C:\Windows\System32`), because the backslash just felt like arbitrary syntax, whereas (at least to my mind), the forward slash evoked the concept of cascading folders right on the command-line.

Becuase of this, and because I was on a shared UNIX system that required connectivity through a terminal, I was essentially forced to use the command-line. Thankfully, because things were making sense in my mind, it was quick to pick up the intricacies of `bash` and its syntax. Everything felt purpose-built and for the first time in computing, I wasn't just learning the how, I was learning the *why* behind it.

### built for engineers, by engineers

Looking back with the knowledge I have now as to why this clicked with me so heavily, it's really no surprise. UNIX was developed in Bell Labs in the 70s by a bunch of brilliant engineers who were trying to maximize the lab's PDP-11 minicomputer by developing an OS that allowed all of the engineers to share the computer all at once. Thanks to the likes of the technical prowess of minds such as Ken Thompson, Dennis Ritchie, and Brian Kernighan, Bell Labs not only gave us UNIX, but they also gave us the C programming language, both of which still have a dominant influence on today's modern computing.

UNIX wasn't just built to be an operating system...it was built to be an operating system to permanently solve a problem...this wasn't about making sales targets or marketing to the right crowd, it was about enabling engineers to do engineery things at increasing speed. Since they wanted this great undertaking to be useful on other machines besides the PDP-11, that's where the C programming language came in, as it was a comparatively simple abstraction of assembly language (a language directly tied to a processor's architecture built by wires and transistors). This meant that once the C language was ported to a new architecture, UNIX could be compiled and ran on that new system, propagating the OS to more systems and eventually gaining the title of the OS of the Internet by the late 90's.

### built for consumers, by committee

On the other hand, if you look at how Windows was born, you can see that there was basically zero thought on its design and its very first iteration was focused on its ability to sell to customers. The command-line OS that Windows is based on, DOS (the Disk Operating System), was Microsoft's last-minute cobbling together of a product sold to IBM to run on their [IBM Personal Computers](https://en.wikipedia.org/wiki/IBM_Personal_Computer). Bill Gates and Paul Allen told IBM they had an OS that would give the IBM PC a solid OS that could compete head-to-head with the [Apple II PC](https://en.wikipedia.org/wiki/Apple_II), which had already taken off in comparison. IBM, surprisingly, bought this story hook, line, and sinker.

In reality, Microsoft didn't have an OS...all they had was was a right to market an OS being developed by [Seattle Computer Products](https://en.wikipedia.org/wiki/Seattle_Computer_Products). This OS, [QDOS](https://en.wikipedia.org/wiki/86-DOS) (the Quick and Dirty Operating System), eventually renamed to 86-DOS, would handle what Microsoft was selling, and could easily be tweaked by Microsoft to handle the IBM PC. By hiding the fact that IBM would be the client behind confidentiality agreements, they managed to buy 86-DOS outright for an additional $50,000, and so started Microsoft's empire.

In addition to this, Microsoft also kickstarted the sale of proprietary software. Bill Gates hated the early computing era and how enthusiasts would gladly share software with one another, enough to [make an open letter accosting people for doing so](https://en.wikipedia.org/wiki/An_Open_Letter_to_Hobbyists). When making the deal with IBM, they ensured Microsoft retained the rights to sell the OS to other clients, which enabled them to take advantage of the many IBM PC-compatible systems that would eventually be built later on, giving Microsoft even more boatloads of money for their 50 large.
68
As to why DOS was designed the way it was, it was designed to emulate the already popular [CP/M](https://en.wikipedia.org/wiki/CP/M) OS built and sold during the 8-bit the hobbyist era of computing, but it needed to ensure DOS was different enough to avoid copyright infringement. That's why backslashes were used instead of forward slashes for directories, for example...it was a corporate example of copying someone else's homework but changing it just enough to not get caught. As to why these quirks persist in Windows today, that's probably due to suits in boardrooms saying ["We've always done it this way."](https://en.wikipedia.org/wiki/Appeal_to_tradition)

These changes were arbitrary, because, from a technical perspective, they *were*. They weren't made for an increase in productivity or usability, they were used to mitigate the chance of litigation, all to protect the bottom line. DOS and Windows felt like it was designed by committee, because, well, it *was* designed by committee.
