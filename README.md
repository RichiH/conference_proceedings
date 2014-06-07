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


Submitting patches
=

Please use a fresh clone of this repository to import new talks; else you
will leak information about your history via `git-annex`'s location
tracking feature.

Please use `git annex addurl --fast`, so that git-annex only stores the url
and not its hash, so that if a talk video is changed, the new version
will be accepted.

For example:

    git clone git://github.com/RichiH/conference_proceedings.git scratch
    cd scratch

    # trick to avoid adding another uuid to the repository; reuse web uuid
    git config annex.version 5
    git config annex.uuid 00000000-0000-0000-0000-000000000001

    git annex addurl --fast ...
    git commit -m "new talk"

Contrary to my earlier workflow, I don't need pull requests/patch sets for the "git-annex" branch any more _as long I can pull from your repository_.
If I can't pull directly, I will steal the patchset for the "git-annex" branch.

