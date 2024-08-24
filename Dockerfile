FROM golang:latest
WORKDIR /go/src/app
ENV GO111MODULE=on
RUN groupadd -g 10001 app && useradd -u 10001 -g app app
COPY go.mod .
COPY go.sum .
RUN go mod download
COPY . .
ADD https://github.com/golang/go/raw/master/lib/time/zoneinfo.zip .
RUN ls -la .
RUN chmod 755 ./zoneinfo.zip
RUN make build