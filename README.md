jhbuild-epiphany
================

Scripts to help with building [Web](https://wiki.gnome.org/Apps/Web)
(Epiphany) into a minimal
[JHBuild](https://developer.gnome.org/jhbuild/) environment.

Instructions
------------

Clone this repository into:

    $ git clone https://github.com/tanty/jhbuild-epiphany /opt/epiphany


Run, in order:

    $ /opt/epiphany/bootstrap.sh
    $ /opt/epiphany/re-compile.sh

You may have to enter some password and install some dependencies if
the jhbuild compilation fails at some point but you should be able to
provide all of them with a not too old GNU/Linux distribution.

You may have to wait for some hours and in the end the whole thing
will be taking up to ~5.5GB, but it should work.

Finally, run:

    $ /opt/epiphany/set-as-default.sh

And give it a try. Close any previously existing instance of epiphany
and run the new default browser which can be identified as "JHBuild
Web Browser".

If you want to re-compile at some point, you can run again:

    $ /opt/epiphany/re-compile.sh
