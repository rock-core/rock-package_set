The CI in use has a time limit for building. Hence, we require a particular branch naming schema for PRs, so that a single package build can be tested.

Use the following schema to trigger the build: `update__<name-of-your-package>`
For instance to add an oroGen package `drivers/orogen/new_driver`, create the following branch to create your PR: `update__drivers/orogen/new_driver`
