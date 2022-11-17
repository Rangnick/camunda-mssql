FROM alpine:latest

USER root

RUN apk add wget && apk add nano && apk add openjdk17-jre-headless

#ENV DB_DRIVER=com.microsoft.sqlserver.jdbc.SQLServerDriver
#ENV DB_URL=jdbc:sqlserver://serverName\instanceName:1433;
#ENV DB_USERNAME=user
#ENV DB_PASSWORD=sa

RUN mkdir camunda

RUN cd camunda

RUN wget https://downloads.camunda.cloud/release/camunda-bpm/run/7.18/camunda-bpm-run-7.18.0.tar.gz

RUN tar -xf camunda-bpm-run-7.18.0.tar.gz

RUN rm camunda-bpm-run-7.18.0.tar.gz

RUN wget https://github.com/microsoft/mssql-jdbc/releases/download/v11.2.0/mssql-jdbc-11.2.0.jre17.jar 

RUN cp mssql-jdbc-11.2.0.jre17.jar  /configuration/userlib/mssql-jdbc-11.2.0.jre17.jar

RUN rm mssql-jdbc-11.2.0.jre17.jar

ENTRYPOINT ["/camunda/start.sh"]