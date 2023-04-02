## what is this?
this is vulnerable docker instance/lab for [fermat attack](https://fermatattack.secvuln.info/) (CVE-2022-2632) which was part of my talk given at mi7-ghc community's meetup

## instructions to set up the lab

 0. install [docker engine](https://docs.docker.com/engine/install/)
 
 1. cd to the downloaded git directory == `cd mi7-ghc/2023/april`
 
 2. make an python3 virtual environment  == `sudo apt install python3 python3-venv` &&  `python3 -m venv py3env`

 3. activate the virtual environment == `source py3env/bin/activate`
 
 4. pip install requirements file == `pip3 install -r requirements.txt`
 
 5. run build.py , which will set up our vulnerable keys and you should see them in your current folder == `python3 build.py`
 
 6. build the docker image == `sudo docker build -t secure-site .`
 
 7. run the docker container == `sudo docker run -it secure-site`
 
**assumptions** ==  *you are running debian based distribution of linux hence the package manager is apt*

## further references 
[rsa basic maths part 1](https://www.youtube.com/watch?v=4zahvcJ9glg)

[rsa basic maths part 2](https://www.youtube.com/watch?v=oOcTVTpUsPQ)

[cryptohack : great website to learn cryptography](https://cryptohack.org/)

[asecurity-site explaining fermat attack](https://asecuritysite.com/rsa/rsa_01)

[bits-deep blog about rsa](https://bitsdeep.com/posts/attacking-rsa-for-fun-and-ctf-points-part-1/) 

[haveibeenpwned for public keys](https://badkeys.info/)

*note - the dockerfile and the lab was made with time constraints, there might be a better way to achieve the task in more efficient and elegant way, feel free to make PRs for the same :D*
