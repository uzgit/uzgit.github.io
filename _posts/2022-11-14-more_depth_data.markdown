---
layout: post
title: More Depth Data
#date: 2021-11-15 00:00:01 +0300
date: 2022-11-15 00:00:001 +0300
description: You’ll find this post in your `_posts` directory. Go ahead and edit it and re-build the site to see your changes. # Add post description (optional)
thumbnail: flight_8.1_3d_thumbnail.webp # Add image post (optional)
image: flight_8.1_3d_thumbnail.webp # Add image post (optional)
tags: [whycode] # add tag
---

## 2D View:

Here is a comparison of the depth data before and after some pre-processing. 
The top video is the (mostly) unprocessed depth image stream on the left,
and unprocessed RGB image stream on the right.
They both stream at 15 Hz.
The main issue with this data is that it is not inherently usable for terrain analysis,
because it does not take into account the orientation of the sensor that collected it.
It essentially shows a rotated version of the terrain.
While it is possible to analyze the depth image to determine roughness of the terrain,
and to do some semantic segmentation or feature extraction on the RGB image,
the conclusions from these analyses will be unoriented with respect to the gravity vector,
meaning that safe-looking landing sites could still be prohibitively slanted.

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/771666064?h=163a6d6b07&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;" title="Flight 8.1: 2D View (Depth and RGB)"></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

&nbsp; 

This is the same video as above, but with some pre-processing.
It uses primarily the depth information, which gives the overall structure/contours.
It also projects the RGB textures onto the depth image,
which makes it more human-readable.
Finally, the whole surface is rotated such that it aligns with the perceived gravity vector.
This is useful for gaining an intuition into what the sensor actually perceives from the ground.
Towards the end, the field of view becomes smaller and smaller as the drone descends and lands.
At the very end, the image becomes noisy as the gimbal automatically points forwards instead of down,
as a result of the flight controller disarming.

## 3D View:

<div style="padding:56.25% 0 0 0;position:relative;"><iframe src="https://player.vimeo.com/video/771662758?h=5bff3a0852&amp;badge=0&amp;autopause=0&amp;player_id=0&amp;app_id=58479" frameborder="0" allow="autoplay; fullscreen; picture-in-picture" allowfullscreen style="position:absolute;top:0;left:0;width:100%;height:100%;" title="Flight 8.1: 3D View"></iframe></div><script src="https://player.vimeo.com/api/player.js"></script>

