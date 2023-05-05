#!/bin/bash

COLOR_RESET_CODE="\033[0m"
COLOR_GREEN_CODE="\033[32m"
COLOR_RED_CODE="\033[31m"
COLOR_YELLOW_CODE="\033[33m"

color_word() {
    local color_code="$1"
    local reset_code="$COLOR_RESET_CODE"
    local word="$2"
    printf "%b" "${color_code}${word}${reset_code}"
}

color_words() {
    local color_code=$1
    shift

    local idx=0
    local words=$* # POSIX 兼容
    for word in $words; do
        if [ $idx != 0 ]; then
            printf " "
        fi
        color_word "${color_code}" "${word}"
        idx=$((idx + 1))
    done
}

green_words() { color_words "$COLOR_GREEN_CODE" "$@"; }
red_words() { color_words "$COLOR_RED_CODE" "$@"; }
yellow_words() { color_words "$COLOR_YELLOW_CODE" "$@"; }

OK() { green_words "$@" "\n"; }
ERROR() { red_words "$@" "\n"; }
WARN() { yellow_words "$@" "\n"; }
INFO() { color_words "$COLOR_RESET_CODE" "$@" "\n"; }