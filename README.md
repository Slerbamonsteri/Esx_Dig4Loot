# Esx_Dig4Loot

Hi! 

Here's a Dig&Wash script for ESX based servers. 

Basically what this script does is that you dig in a preset area. 

Digging gives you item (mud / gravel or whatever), and there is also possibility of getting random items whilst doing it.

After digging you take the specified "Defaultitem" (which you also need to set in server.lua and create it on database) to any watersource.

Whilst having that "Defaultitem" on you, and when standing in water, you use Bowl (or whatever you want it to call, again, create item in your database) to start panning.

Panning the "Defaultitem" you got from digging gives you randomized items, or you might fail, and get nothing.


I was using Esx_digitem (https://github.com/minobear/esx_digitem) for a while, but there were too many exploits that caused some major problems for me and my staff.

Thus I remade it and created this panning -feature to extend it as a minijob/hobby
########################################################################################
USAGE:(also added some instructions in server.lua)

Create items in database

Defaultitem = mud (or whatever you want to call it)

Extraitem = Whatever you want

Spade

Bowl

You need to change those item entries in server.lua, shouldn't be that hard... 
#########################################################################################
I'm fairly sure i have covered all possible exploits so it should be fairly safe to use, i recommend making logs though, just incase.
Also I'm aware that the files are messy af, but it works nonetheless, and im satisfied with it taking in consideration my .lua skills at the time.
I'd appreciate if you wanted to clean it up and optimize it even further. 

Currently runs 0.01ms on idle and 0.02ms in action.

Showcase: https://www.youtube.com/watch?v=J5SkW3bgE38


---Credits---
Esx_Dig4Loot was made and modified from:

https://github.com/r3ps4J/r3_prospecting

https://github.com/minobear/esx_digitem

https://forum.cfx.re/t/release-esx-fishing-at-del-perro-pier-recreational-with-license/92894
