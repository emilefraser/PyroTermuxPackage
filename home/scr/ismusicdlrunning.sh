#!/bin/bash

isrunning=$(sudo ps -Af | grep 'com.dt3264.deezloader\|com.kapp.youtube.final' | grep -c -v 'grep')

if [ "$isrunning" -ne 0 ]
then
echo true > .termux_output
else
echo false > .termux_output
fi
