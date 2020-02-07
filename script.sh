#!/bin/bash
 apt-get  update
 apt-get  upgrade
 

 apt-get install -y wget
 apt-get install -y git
 apt-get install -y vim
 

if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no")
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
					wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz
				 tar -xvf go1.13.4.linux-amd64.tar.gz
				 mv go /usr/local
					export GOROOT=/usr/local/go
					export GOPATH=$HOME/go
					export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
					echo 'export GOROOT=/usr/local/go' >> ~/.bash_profile
					echo 'export GOPATH=$HOME/go'	>> ~/.bash_profile			
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.bash_profile	
					source ~/.bash_profile
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac	
done
fi


