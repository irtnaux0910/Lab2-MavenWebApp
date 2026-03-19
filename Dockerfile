# Step 1: Use Tomcat 9 as the base image
FROM tomcat:9.0-jdk11-openjdk-slim

# Step 2: Clean out the default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Step 3: Copy your WAR file into Tomcat's ROOT directory
# This ensures your app opens at http://localhost:8080/
COPY target/comp367-webapp-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Step 4: Expose the port and start Tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]