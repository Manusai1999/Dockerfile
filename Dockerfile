# Use the official Ubuntu 18.04 image as the base image 
FROM ubuntu:18.04 
 
# Update the package list and install the Apache2 web server 
RUN apt-get update && apt-get -y install apache2 
 
# Expose port 80 to allow HTTP traffic (the default port for web servers) 
EXPOSE 80 
 
# Set the ENTRYPOINT to the apachectl command, which is used to control the 
Apache web server 
ENTRYPOINT ["usr/sbin/apachectl"] 
 
# Set the default CMD to pass the "-D FOREGROUND" argument, which ensures 
Apache runs in the foreground (important for Docker containers) 
CMD ["-D", "FOREGROUND"] 
 
# Copy the local 'index.html' file into the container's Apache web directory 
(/var/www/html) 
COPY index.html /var/www/html/index.html 
 
# Create a Docker volume for persistent storage, specifically for the Apache 
web directory (/var/www/html) 
VOLUME /var/www/html
