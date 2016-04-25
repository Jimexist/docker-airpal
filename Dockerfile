FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    gcc

ADD https://github.com/airbnb/airpal/archive/master.zip /tmp/airpal.zip
RUN unzip /tmp/airpal.zip -d /app && rm /tmp/airpal.zip

WORKDIR /app/airpal-master

RUN ./gradlew clean shadowJar
RUN cp reference.example.yml reference.yml
ADD ./entrypoint.sh entrypoint.sh
EXPOSE 8081
EXPOSE 8082

ENTRYPOINT ["./entrypoint.sh"]
CMD ["java"]

