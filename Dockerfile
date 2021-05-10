## We specify the base image we need for our
## go application
FROM golang:1.16.4-alpine3.13
MAINTAINER "Matt Townsend"
## We create an /app directory within our
## image that will hold our application source
## files
##Install git
RUN apt-get update \
     apt-get install -y git
RUN mkdir /app \
           cd /app \
           git clone https://github.com/mt1976/mwt-go-dev.git
## We copy everything in the root directory
## into our /app directory
## ADD . /app
## We specify that we now wish to execute
## any further commands inside our /app
## directory
WORKDIR /app/mwt-go-dev
## we run go build to compile the binary
## executable of our Go program
RUN go build -o main .
## Our start command which kicks off
## our newly created binary executable
CMD ["/app/mwt-go-dev/main"]
