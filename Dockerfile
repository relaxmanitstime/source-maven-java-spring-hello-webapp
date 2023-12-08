# 실습 2-6: 파이프라인 + Maven + Tomcat 작업 구성
#FROM maven:3-openjdk-11 AS mbuilder
#RUN mkdir /hello
#COPY . /hello
#WORKDIR /hello
#RUN mvn package

#FROM tomcat:9-jre11
#COPY --from=mbuilder /hello/target/hello-world.war /usr/local/tomcat/webapps/

# 실습 3-9: 파이프라인 + Git + Docker + Maven + Tomcat
FROM tomcat:9-jre11
COPY target/hello-world.war /usr/local/tomcat/webapps/
