#!/bin/bash

function install {
    QUERY=$(pip3 show ${1} | grep "Name:" | cut --delimiter=' ' -f 2)
    echo $QUERY

    shopt -s nocasematch # Make caseinsentive
    if [[ $QUERY == *"${1}"* ]]; then
        echo "Already installed: ${1}... $QUERY"
    else
        echo "Installing: ${1} ..."
        pip3 install --user ${1}
    fi
}

install django
