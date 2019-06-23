#!/bin/bash




SONGS_DIR="~/Dropbox/SongBook"




function _usage () {
    echo -e "Usages:"
    echo -e "\t${0} <options|info-file>"
}
# file contains info for multiple songs or options set fields for a sigle song



#   List Dirs
################
# Only lists the directories contained in the passed directory
function _list-dirs-only () {
    LC_ALL="C" ls -alhF --group-directories-first --color=always "${1}" | grep -Ev '^-.*'
}

function _get-available-dirs () {
     _list-dirs-only "${1}" | sed 's/  */ /g' | cut -d' ' -f9 | sed 's#/##g'
}



