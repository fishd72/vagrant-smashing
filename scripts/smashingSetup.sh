#!/bin/bash

# Author:   Dave Fisher - fishd72
# Name:     smashingSetup.sh
#
# Purpose:  Sets up a Smashing dashboard for Jamf Pro reporting
# Usage:    Vagrant Shell provisioner
#
# Version 1.0.0, 2020-04-06
#   DF - Initial Creation

# Use at your own risk. fishd72 will accept no responsibility for loss or
# damage caused by this script.

##### Set variables


# Do not change the below variables
logFile="/vagrant/logs/vagrantBuild.log"
logProcess="smashingSetup"

##### Declare functions

writelog ()
{
    /usr/bin/logger -is -t "${logProcess}" "${1}"
}

echoVariables ()
{
    writelog "Log Process is ${logProcess}"
    writelog "Log file is stored at ${logFile}"
}

installRequired ()
{
    # Update Package Manager
    apt update

    # Install OpenJDK, Tomcat, Unzip and Avahi
    writelog "Installing Ruby..."
    apt install -y ruby-full unzip avahi-daemon build-essential nodejs

    # Install Smashing dashboard
    writelog "Installing Smashing and Bundle..."
    gem install smashing bundle
}

##### Run script

if [[ ! -d "/vagrant/logs" ]];
then
    mkdir "/vagrant/logs"
fi
chmod 777 "/vagrant/logs"

echoVariables
installRequired

writelog "Script completed."
