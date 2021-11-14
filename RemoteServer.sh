#!/bin/bash

#install relevant applications on the local computer
function inst(){
echo "Welcome to be anonymous!!!"
git clone https://github.com/htrgouvea/nipe
sudo cpan install Try::Tiny Config::Simple JSON
cd nipe/
pwd
# install perl need to be in root
sudo perl nipe.pl install
}

#Check if the connection is from your origin country
function anon(){
echo "the Origin Country ip is"
# to check is in original IP country
curl ifconfig.io
echo "Country is"
curl ipinfo.io/country
sudo perl nipe.pl status

sudo perl nipe.pl start
sudo perl nipe.pl status
# after nipe is start should be getting anonymous IP 
echo "the Anonymous ip is"
curl ifconfig.io
echo "Country is"
curl ipinfo.io/country
}

#Communicate via SSH and execute nmap scans and whois queries
function vps(){
	
#to input username, password, ip address or domain to access VPS.
echo 'please key in credential to connect your vps'

read  -p 'Username:' uservar
read  -p 'Password:' passvar
read  -p 'IPaddr:' ipvar

echo 'connecting to vps.....'

echo 'please key in IP or Domain address u wish to nmap'

read  -p 'ipaddr or domain:' ipvar2

# use sshpass to access vps and execute the nmap & whois
sshpass -p $passvar ssh $uservar@$ipvar "nmap $ipvar2 | tee -a >>nmapresult.txt"
sshpass -p $passvar ssh $uservar@$ipvar "whois $ipvar2 | tee -a >>whoisresult.txt"


echo 'Note the result will be in text file'
}

### Get input from the user: whois or nmap

inst #run installation 
anon #check anonymous
vps  #connect and execute
