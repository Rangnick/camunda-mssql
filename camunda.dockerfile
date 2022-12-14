FROM camunda/camunda-bpm-platform:latest

USER root

RUN apk add wget && apk add nano && apk add openjdk17-jre-headless

RUN wget https://github.com/microsoft/mssql-jdbc/releases/download/v11.2.0/mssql-jdbc-11.2.0.jre17.jar 

RUN cp mssql-jdbc-11.2.0.jre17.jar  /camunda/lib/mssql-jdbc-11.2.0.jre17.jar

RUN rm mssql-jdbc-11.2.0.jre17.jar