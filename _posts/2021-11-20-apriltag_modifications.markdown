---
layout: post
title: April Tag Modifications
date: 2021-10-20 00:00:001 +0300
description: You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. # Add post description (optional)
thumbnail: apriltag_modifications.webp # Add image post (optional)
image: apriltag_modifications.webp # Add image post (optional)
tags: [whycode] # add tag
---

April Tag 48h12 (shown at the top left) is a default [April Tag](https://april.eecs.umich.edu/software/apriltag#:~:text=AprilTag%20is%20a%20visual%20fiducial,tags%20relative%20to%20the%20camera.) family since April Tag 3, and allows users to embed April Tag markers within each other.
One of the problems with April Tag 48h12 is that it has about 42000 possible tags, all of which are loaded into memory in a single hash table along with each of three 90-degree rotations for "quick" lookup.
On computers like a Raspberry Pi 3 B+, this causes issues because, if the entire hash table cannot be loaded into the limited memory, the detection rate only goes up to about 2 Hz (in our experiments).
This is why we ended up using only WhyCon/WhyCode in earlier drone experiments.

In an attempt to overcome this, we have used [April Tag Generation](https://github.com/AprilRobotics/apriltag-generation) to create a new, more minimalistic embeddable April Tag family - April Tag 24h10 - which is shown at the top right.
The definition of the marker is smaller overall.
It has a 7x7 layout, where 24 of the squares contribute to a black/white square interior border, the outer 24 bits contribute either a 0 or 1 to the marker's ID, and the center square is undefined so that we can embed more markers.
This is essentially just a smaller version of the April Tag 48h12 family which has a 10x10 layout, where 48 squares contribute to the black/white square border, 48 contribute to the ID, and the inner 4 squares are undefined.

April Tag 24h10 results in a runtime speedup on a Raspberry Pi 3 B+, probably as a result of the small number of possible markers in the family (and the correspondingly small hash table).
Our initial experiments show a runtime detection rate of about 15 Hz.
However, it does not actually result in a speedup on a Raspberry Pi 4, probably because it has enough RAM and processor power to handle the 48h12 system.
The figure below shows the speed comparisons of the April Tag systems (plus some other systems that I will address in another post/publication).

![Speed Plot]({{ site.url }}{{ site.baseurl }}/assets/images/violin_plot_speed_five_member.webp)
