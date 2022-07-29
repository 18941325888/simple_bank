simple_bank


 GOOS=windows

 go env -w GOOS=linux
go env -w GOOS=windows

 DB_SOURCE= "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable"

 #Build
FROM golang:1.18.4-alpine3.16 AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

#Run
FROM alpine:3.16
WORKDIR /app
COPY --from=builder /app/main .
COPY app.env .

EXPOSE 8080
CMD [ "/app/main" ]

docker build -t simplebank:latset .