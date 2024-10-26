FROM alpine:latest
WORKDIR /app

RUN apk add --no-cache git make musl-dev go

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH
ENV GOAPPS /app

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

COPY . .

EXPOSE 8000

#Run google translate API
CMD [ "go", "run", "./main.go" ]
