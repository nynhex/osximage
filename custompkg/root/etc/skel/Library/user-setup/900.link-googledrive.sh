#!/bin/bash
# setup google drive as synceddir in ~/.paths
if [[ ! -e ~/.paths/synceddir ]]; then
    ln -s ~/Google\ Drive\ File\ Stream/My\ Drive ~/.paths/synceddir
fi
