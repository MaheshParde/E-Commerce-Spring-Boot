FROM alpine
EXPOSE 8000
WORKDIR /tmp
COPY . /tmp
RUN apk add openjdk8
//RUN javac TriplehaoApplication.java
ENTRYPOINT java TriplehaoApplication.java
