#!/bin/bash




SONGS_DIR="~/Dropbox/SongBook"



function _print_many () {
    local nr="${1}"
    local str="${2}"
    printf "%0.s${str}" $(seq 1 ${nr})
}

function _convert_to () {
    local in_string="${1}"
    local out_string="${2}"
    local nr_of_chars="$(echo "${in_string}" | wc -m)"
    _print_many "$(( ${nr_of_chars} - 1 ))" "${out_string}"
}

function _usage () {
    local s="$(_convert_to "${0}" " " )"

    echo -e "Usages:"
    echo -e "\t${0} <info-file>             -->  Crete multiple songs from file info."
    echo -e "\t${0} <options>               -->  Create Single song from options."
    echo -e "\t${0} <info-file> <options>   -->  Crete multiple songs from file info."
    echo -e "\t${s}                              Fill file blanks with options values or"
    echo -e "\t${s}                              fill option blanks with file info."
    echo -e ""
    echo -e "Options:"
    echo -e "\t\e[00;1m-f | --file\e[00m"
    echo -e "\t[ -f \"path/to/file\"  |  --file=\"path/to/file\" ]"
    echo -e "\t\tIndicates the file that will be used to define the fields of the song."
    echo -e "\t\e[00;1m-n | --name | --title\e[00m"
    echo -e "\t[ -n \"Song Title\"  |  --[name|title]=\"Song Title\""
# subtitle
# author
# artist
# key
# tags
# prevalence (file, options)
}
# file contains info for multiple songs or options set fields for a sigle song

_usage

# Only lists the directories contained in the passed path
function _list-dirs-only () { LC_ALL="C" ls -alhF "${1}" --color=always | grep -Ev '^-.*'; }

# returns a list of the directories available in the passed path
function _get-available-dirs () { _list-dirs-only "${1}" | sed 's/  */ /g' | cut -d' ' -f9 | sed 's#/##g' | sed '/^$/d'; }





