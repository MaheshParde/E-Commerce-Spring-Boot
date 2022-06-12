FROM alpine
EXPOSE 8000
WORKDIR /tmp
COPY . /tmp
RUN apk add openjdk8
RUN javac E-Commerce-Spring-Boot.java
ENTRYPOINT java E-Commerce-Spring-Boot
