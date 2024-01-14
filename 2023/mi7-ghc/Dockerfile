#get base nginx image
FROM nginx

#install needed software (nginx might not be needed to be installed here)
RUN apt-get update && apt-get install nginx openssh-server -y

#copy the secure directory containing our dummy test website to root folder of nginx
COPY secure/ /usr/share/nginx/html

#copy run.sh file which will act as our container initiator 
COPY run.sh /

#make directory needed for ssh server
RUN mkdir -p /root/.ssh

#copy vulnerable rsa keys to just created ssh directory
COPY id_rsa /root/.ssh/
COPY id_rsa.pub /root/.ssh/

#cat the public key into the authorized keys so it's valid for logggin in
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys

#start the needed services (nginx and/or ssh might not be needed to be started here)
RUN service ssh start
RUN service nginx start

#expose 22(ssh) and 80(http) port of docker container
EXPOSE 80
EXPOSE 22

#set the command which will be ran when container starts
CMD ["/bin/bash", "/run.sh"]

#feel free to mess around the dockerfile and improve it, good luck hacker

