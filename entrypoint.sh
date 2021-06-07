#!/bin/bash

hub release create -a ./${RELEASE_FILE_FOLDER}/*-release.aab -m "v${GITHUB_REF##*/}" ${GITHUB_REF##*/} 
