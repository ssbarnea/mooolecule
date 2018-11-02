Mo(oo)lecule
============

[![Build Status](https://travis-ci.com/ssbarnea/mooolecule.svg?branch=master)](https://travis-ci.com/ssbarnea/mooolecule)

This is **not** a new project, just a temporary place to keep the experimental
enablement of molecule testing for tripleo-quickstart.

For the moment it assumes that you clone it side-by tripleo-quickstart
and that you run `make` which mainly just runs `molecule test`.

If this proves to work well, we can make a CR to add the code to the
tripleo-quickstart repo.

What is really happening when running molecule test?

`molecule/tests/playbook.yml` is run on each of the testing hosts defined
inside `molecule/defaults/tests/molecule.yml`.

The currently included hosts are 3 docker containers:
- centos-7
- fedora-28
- fedora-26

Molecule supports a wide range of providers but the default one is docker
which also happens to be the fastest one.