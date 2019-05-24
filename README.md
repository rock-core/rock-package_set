# Rock Package Set

This is the package set extending the rock.core package_set.
Libraries are declared in [libs.autobuild](./libs.autobuild),
oroGen components in [orogen.autobuild](./orogen.autobuild).
The actual mapping from the package name to the its actual source (git
repository, archive, etc.) is done in the [source.yml](source.yml).

Operating System dependencies are defined in [rock.osdeps](./rock.osdeps).

Further information on package_sets can be found on
[rock-robotics.org](https://www.rock-robotics.org/documentation/autoproj/advanced/creating_pkg_set.html).



## Merge Requests
The CI in use has a time limit for building. Hence, we require a particular
branch naming schema for PRs, so that a single package build can be tested.

Use the following schema to trigger the build:
```
    update__<name-of-your-package>
```

For instance to add an oroGen package drivers/orogen/new_driver, create the
following branch to create your PR:
```
    update__drivers/orogen/new_driver
```
