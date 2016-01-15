FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y \
    build-essential \
    make \
    gcc

ADD https://github.com/airbnb/airpal/archive/master.zip /app/airpal.zip
RUN unzip /app/airpal.zip -d /app && rm /app/airpal.zip

WORKDIR /app/airpal-master
RUN ./gradlew clean shadowJar

ADD reference.yml /app/airpal-master/reference.yml

CMD ["java", "-server", "-Duser.timezone=UTC", "-cp", \
    "build/libs/airpal-*-all.jar", "com.airbnb.airpal.AirpalApplication", \
    "server", "reference.yml"]

