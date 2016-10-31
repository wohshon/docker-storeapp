FROM jboss/base-jdk:8

# Set the env variable
ENV JBOSS_HOME /opt/jboss/jboss-eap-7.0

ADD jboss-eap-7.0-p2-standalone.tar.gz /opt/jboss

#cp config files with datasource and drivers
COPY standalone.xml /opt/jboss/jboss-eap-7.0/standalone/configuration

#load mysql modules
COPY modules/ /opt/jboss/jboss-eap-7.0/modules/

#deploy war file
COPY store.war /opt/jboss/jboss-eap-7.0/standalone/deployments/

# Expose the ports we're interested in
EXPOSE 8080

# Set the default command to run on boot
# This will boot JBoss EAP in the standalone mode and bind to all interface
CMD ["/opt/jboss/jboss-eap-7.0/bin/standalone.sh", "-b", "0.0.0.0"]
