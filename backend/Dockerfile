# syntax=docker/dockerfile:1.4
FROM --platform=$BUILDPLATFORM golang:1.20-alpine AS builder

WORKDIR /code

# ENV CGO_ENABLED 0
# ENV GOPATH /go
# ENV GOCACHE /go-build

COPY go.mod go.sum ./
# RUN --mount=type=cache,target=/go/pkg/mod/cache \
#     go mod download

RUN go mod download
RUN go install github.com/kyleconroy/sqlc/cmd/sqlc@latest
RUN go install github.com/pressly/goose/v3/cmd/goose@latest

COPY . ./



# RUN --mount=type=cache,target=/go/pkg/mod/cache \
#     --mount=type=cache,target=/go-build \
#     go build -o bin/backend main.go

RUN CGO_ENABLED=0 GOOS=linux go build -o /rssagg

EXPOSE 8000

#goose migrations on schema folder
#sqlc generate where is the sqlc.yaml

CMD ["/rssagg"]

