About this repository
=

This is a repository containing links to various conferences and their talk recordings, slides, etc. In academia, these are called proceedings and that's as good a name as any.


Using this repository
=

To use this repository, you will need to install [git-annex](http://git-annex.branchable.com/).

Once you have installed `git-annex`, simply run

    git clone git://github.com/RichiH/conference_proceedings.git
    cd conference_proceedings
    cd $interesting_conference
    git annex get $interesting_talk

And git-annex will start downloading said talk all by itself.
To download everything in a given directory and all of its subdirectories, simply run

    git annex get .

, but please be aware that this can use a *lot* of disk space and cause a lot of traffic.
