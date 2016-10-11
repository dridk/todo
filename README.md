# todo App
simple todo application designed for the [pyconfr2016](https://2016.pycon.fr/) using PyQt5 and QML.

<p align="center">
  <img src="animation.gif" />
</p>


# Installation 
## Server
Todo Server is a flask application using mongodb . You need both of them to make it work. 
From ubuntu : 
	
	sudo apt-get install mongodb 

Then install flask like this : 

	pip3 install -r server/requirements.txt

## Client 
Todo Client is a pyQt5.7 client made with pure QML. Other module are note used. 
To install dependencies : 

	pip3 install -r client/requirements.txt



