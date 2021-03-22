# Base image Java SE 1.8 JDK
FROM openjdk:8-jdk

ENV SPARK_HOME=/opt/spark
ENV HADOOP_CONF_DIR=/etc/hadoop/conf

# Download spark + hadoop and move to /opt/spark
WORKDIR /tmp
RUN wget https://downloads.apache.org/spark/spark-3.1.1/spark-3.1.1-bin-hadoop3.2.tgz
RUN mkdir /opt/spark
RUN tar zxvf spark-3.1.1-bin-hadoop3.2.tgz 
RUN mv ./spark-3.1.1-bin-hadoop3.2 ./spark
RUN mv ./spark /opt

# Download livy AND MOVE TO /opt/livy
RUN wget https://downloads.apache.org/incubator/livy/0.7.1-incubating/apache-livy-0.7.1-incubating-bin.zip
RUN unzip apache-livy-0.7.1-incubating-bin.zip
RUN rm apache-livy-0.7.1-incubating-bin.zip
RUN mv ./apache-livy-0.7.1-incubating-bin ./livy
RUN mv ./livy /opt

