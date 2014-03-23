How to help
=

Two quick suggestions for how you too can make this git annex repository better:

Check for missing files
=

Both of these will increase the quality of the repo for everyone.  `cd` into your local copy of the repository and run:

   git-annex fsck --fast --from web >> ~/repo_fsck.txt

this will search through the repository and will check each and every file and video checked into `git-annex` to make sure that every file with a url exists where it should and can assumably be downloaded.

   git-annex find --not --in web | grep failed

this will search through all the files checked into `git-annex` and make sure that they have a url that they point to and will only print out the files that don't have any url target.

Add new videos
=

A short list of sites that host videos from conferences from past years that can also be added to the repository:
[Debian](http://meetings-archive.debian.net/pub/debian-meetings/)
[Australian Linux Conference](http://mirror.linux.org.au/linux.conf.au/)
[FOSDEM](http://video.fosdem.org/)
[LibrePlanet](http://libreplanet.org/wiki/LibrePlanet:Conference)