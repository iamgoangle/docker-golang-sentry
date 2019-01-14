# build stage
FROM golang:alpine AS build-env
ADD . /src
RUN cd /src && go build -o goapp
# RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o goapp .

# run stage
FROM alpine
WORKDIR /app
COPY --from=build-env /src/goapp /app/
ENTRYPOINT ./goapp