# Toolkit for OpenStack LOCI's `bindep`

This is a simple image that is built for the different commits being used by
OpenStack LOCI.  It embeds the `bindep.txt` and `pydep.txt` and it has
several very simple `ONBUILD` to generate the list of dependencies which
can be further used.

It will generate the following two files:

- `/runtime-dist-packages`: List of packages needed to be installed (`apt`)
- `/runtime-pip-packages`: List of packages needed to be installed (`pip`)

It will also take into account the usage of `PROJECT` and `PROFILES` as the
build arguments in order to be able to generate those values.

The images are currently publishing to `quay.io` so you can use them using by
either referencing any of the following tags:

- `quay.io/vexxhost/bindep-loci:latest`
- `quay.io/vexxhost/bindep-loci:<LOCI_SHA1>`
