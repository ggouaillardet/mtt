#!/bin/sh
#
# Copyright (c) 2018      Research Organization for Information Science
#                         and Technology (RIST). All rights reserved.
# Copyright (c) 2018      Cisco Systems, Inc.  All rights reserved.
#
# $COPYRIGHT$
#
# Additional copyrights may follow
#

cd gh-pages

# latex doc contains some timestamps so it cannot be used to check if the doc has changed,
# so only check the html file.
# add the html directory to the index in order to include the newly created files/directories

git add html

if git diff --cached --exit-code html > /dev/null 2>&1; then
    echo NOTHING TO PUSH
else
    echo PUSHING CHANGES
    # some changes were detected, push everything including the html directory
    git add .
    git commit -m "Deploy updated open-mpi/mtt to gh-pages"
    git push https://$GH_TOKEN@github.com/ggouaillardet/mtt.git gh-pages
fi
