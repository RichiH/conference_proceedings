How to help
=

Two quick suggestions for how you too can make this git annex repository better:

Check for missing files
=

Both of these will increase the quality of the repo for everyone.  `cd` into your local copy of the repository and run:

   git-annex fsck --fast --from web >> ~/repo_fsck.txt

This will search through the repository and will check each and every file
and video checked into `git-annex` to make sure that every file with a url
exists where it should and can assumably be downloaded.

When the size of a file in the web has changed, and it was added to the
repository without --relaxed, this will notice that the web no longer has
the original content, and mark it not present in the web even though the
new version in the web is ok. This is why we try to always addurl files
with --relaxed.

   git-annex find --not --in web

This will search through all the files checked into `git-annex` and make
sure that they have a url that they point to and will only print out the
files that don't have any url target.

Warning: Avoid running the first of these if you've configured your local
repository to reuse the web's UUID, as the README.md suggests doing when
adding files to the repository. git-annex will see you don't have the files
and mark them as not present in the web.

Add new videos
=

A short list of sites that host videos from conferences from past years that can also be added to the repository:
[Debian](http://meetings-archive.debian.net/pub/debian-meetings/)
[Australian Linux Conference](http://mirror.linux.org.au/linux.conf.au/)
[FOSDEM](http://video.fosdem.org/)
[LibrePlanet](http://libreplanet.org/wiki/LibrePlanet:Conference)
