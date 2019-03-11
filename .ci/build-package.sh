#!/bin/bash
export AUTOPROJ_BOOTSTRAP_IGNORE_NONEMPTY_DIR=1
export AUTOPROJ_NONINTERACTIVE=1

ruby /home/docker/autoproj_bootstrap git https://github.com/rock-core/buildconf.git branch=master --seed-config=seed-config.yml

if [ "$PKG_PULL_REQUEST" = "false" ]; then
    echo "Using branch: ${PKG_BRANCH}"
fi
## Check if this a pull request and change to pull request
## accordingly
if [ "$PKG_PULL_REQUEST" != "false" ]; then
    echo "Using pull request: ${PKG_PULL_REQUEST}"
    cd "${PKG_NAME}"
    git fetch autobuild pull/${PKG_PULL_REQUEST}/head:docker_test_pr
    git checkout docker_test_pr
    cd -
    /bin/bash -c "source env.sh; autoproj osdeps;"
    export PKG_BRANCH=${PKG_PULL_REQUEST_BRANCH}
fi

if [[ $PKG_BRANCH =~ ^update__* ]]; then \
    PKG_NAME=`echo ${PKG_BRANCH} | sed s#update__##`
    export PKG_NAME
else
    echo "No 'update__' prefix on branch name found -- skipping validation"
    exit 0
fi

if [ "$PKG_NAME" != "" ]; then
    echo "Build updated package: $PKG_BRANCH"
    sed -i "s#github: rock-core/rock-package_set#rock:\n     type: git\n     url: https://github.com/rock-core/rock-package_set\n     branch: $PKG_BRANCH#g" autoproj/manifest
    cat autoproj/manifest
    sed -i "s#rock\.core#${PKG_NAME}#g" autoproj/manifest
    cat autoproj/manifest

    ## Update
    source env.sh
    autoproj update
    autoproj osdeps
    amake
else
    echo "No package name identified"
    exit 0
fi
