FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    gcc

ADD https://github.com/airbnb/airpal/archive/master.zip /tmp/airpal.zip
RUN unzip /tmp/airpal.zip -d /app && rm /tmp/airpal.zip

WORKDIR /app/airpal-master

RUN ./gradlew clean shadowJar

ADD reference.yml reference.yml

CMD ["java", "-server", "-Duser.timezone=UTC", "-cp", \
    "/app/airpal-master/build/libs/airpal-*-all.jar", \
    "com.airbnb.airpal.AirpalApplication", \
    "server", "reference.yml"]

