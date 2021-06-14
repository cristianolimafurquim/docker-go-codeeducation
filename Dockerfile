FROM golang:1.16.5-alpine AS builder

WORKDIR /go/src

COPY ./src /go/src

RUN go build code-education.go

FROM scratch
COPY --from=builder /go/src /go/src

ENTRYPOINT [ "/go/src/code-education"]