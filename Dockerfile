FROM golang:alpine as build

RUN apk add --no-cache git

RUN mkdir /build 
ADD ./app /build
WORKDIR /build 

RUN go get -d -v
# RUN go build -o main . 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -ldflags '-extldflags "-static"' -o main .

FROM scratch
COPY --from=build /build/main /app/
WORKDIR /app
CMD ["./main"]