#!/bin/bash 
ANDROID_HOME=~/android-studio/sdk
ANDROID_SDK="${ANDROID_HOME}"
AS_EXECUTABLE_HOME=~/android-studio/bin
AS_HOME=~/android-studio
AS_FILENAME='android-studio-bundle-135.1339820-linux.tgz'
AS_URL="https://dl.google.com/android/studio/install/0.8.6/${AS_FILENAME}"

# Check if there is running process
AS_PID=`pgrep -f AndroidStudio`

if [ $AS_PID ]; then
        echo "There seems to already be a running android studio instance ($AS_PID). Please stop it and try again"
        exit 1
fi

## Remove any previous installs:
rm -rf $AS_HOME

## Download android studio 
if [ ! -f $AS_FILENAME ]; then
	cd $HOME && curl -OL $AS_URL
fi

## Extract downloaded tgz package:
tar zxvf $AS_FILENAME

## Set environment variables for android home
export ANDROID_HOME="${ANDROID_HOME}"
export ANDROID_SDK="${ANDROID_SDK}"
export PATH="$ANDROID_HOME/tools:$PATH"

## Cleanup downloaded file
if [ -f $AS_FILENAME ]; then
	rm "${AS_FILENAME}"
fi

## Print success message
echo "Android Studio has been successfully installed, go to "${AS_EXECUTABLE_HOME}" to start studio.sh"
echo "Start android studio anywhere by executing "sudo ln -s "${AS_EXECUTABLE_HOME}/studio.sh" /usr/local/bin""