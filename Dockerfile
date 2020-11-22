FROM tomcat:9.0.39-jdk11

# Installing basic tools
RUN apt update && apt install -y nano && apt install vim

# Enable manager app, host manager app and docs apss
RUN mv /usr/loca/tomcat/webapps.dist/* /usr/local/tomcat/webapps

# Copying my tomcat-users.xml to the container
# TO-BE-DONE user password as a docker build arg
COPY mytomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

# Context Modifying from all default apps
COPY mycontext.xml /usr/local/tomcat/webapps/host-manager/META-INF/context.xml
COPY mycontext.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml