FROM golang:alpine3.14 AS builder

WORKDIR /go/src
COPY main.go .

RUN go build main.go

FROM scratch

WORKDIR /go/src
COPY --from=builder /go/src/main .

ENTRYPOINT [ "./main" ]