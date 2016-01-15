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
    "build/airpal-0.1.0-SNAPSHOT-all.jar", \
    "com.airbnb.airpal.AirpalApplication", \
    "server", "reference.yml"]

