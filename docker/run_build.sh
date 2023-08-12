#!/bin/bash

if [ -z "${BUILD_UID}" ]; then
    echo "build user UID is not specified"
    exit
fi
if [ -z "${BUILD_GID}" ]; then
    echo "build user GID is not specified"
    exit
fi

groupadd -g ${BUILD_GID} build_user
useradd build_user -u ${BUILD_UID} -g ${BUILD_GID}

echo "executing: ${BUILD_CMD}"

su -c "cd zmk && west init -l app/" - build_user
su -c "cd zmk && west update" - build_user
su -c "cd zmk && west zephyr-export" - build_user
su -c "cd zmk/app && ${BUILD_CMD}" - build_user
