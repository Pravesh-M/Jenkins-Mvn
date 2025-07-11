FROM tomcat:10.1

RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/SimpleProject.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
