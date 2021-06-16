#!/bin/bash

hub release create -a ./${RELEASE_FILE_FOLDER}/*-release.aab -m "${TAG_NAME}" -t "${TARGET_BRANCH}" "${TAG_NAME}" 
