#基础镜像：仓库是java，标签用8u66-jdk
##FROM java:8u66-jdk
#当前镜像的维护者和联系方式
##MAINTAINER duqi duqi@example.com
#将打包好的spring程序拷贝到容器中的指定位置
##ADD target/*.jar /app.jar
#容器对外暴露8080端口
##EXPOSE 8080
#容器启动后需要执行的命令
##CMD java -Djava.security.egd=file:/dev/./urandom -jar /app.jar


FROM maven:3.3.3

ADD pom.xml /tmp/build/
RUN cd /tmp/build && mvn -q dependency:resolve

ADD src /tmp/build/src
#构建应用
RUN cd /tmp/build && mvn -q -DskipTests=true package \
#拷贝编译结果到指定目录
&& mv target/*.jar /app.jar \
#清理编译痕迹
&& cd / && rm -rf /tmp/build

VOLUME /tmp
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

