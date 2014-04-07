jhbuild-epiphany
================

Scripts to help with building [Web](https://wiki.gnome.org/Apps/Web)
(Epiphany) into a minimal
[JHBuild](https://developer.gnome.org/jhbuild/) environment.

Instructions
------------

Clone this repository into a location with, at least, up to ~5.5GB of
free space:

    $ git clone https://github.com/tanty/jhbuild-epiphany && cd jhbuild-epiphany


Run, in order:

    $ ./bootstrap.sh
    $ ./re-compile.sh

You may have to enter some password and install some dependencies if
the jhbuild compilation fails at some point but you should be able to
provide all of them with a not too old GNU/Linux distribution.

You may have to wait for some hours but it should work.

Finally, run:

    $ ./set-as-default.sh

And give it a try. Close any previously existing instance of epiphany
and run the new default browser which can be identified as "JHBuild
Web Browser".

If you want to re-compile at some point, you can run again:

    $ ./re-compile.sh
