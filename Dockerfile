# Use official Tomcat base image
FROM tomcat:9.0

# Remove default ROOT app (optional, if you want your app at "/")
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy your WAR file into Tomcat's webapps directory
COPY webapp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 (Tomcat default)
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
