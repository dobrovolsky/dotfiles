#!/usr/bin/env bash

# set computer's name
scutil --set ComputerName 'Mac'
scutil --set HostName 'Mac'
scutil --set LocalHostName 'mac'

# disable  hibernation
pmset -a hibernatemode 0