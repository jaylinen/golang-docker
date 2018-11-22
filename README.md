# golang sample project with docker

## Usage

Development usage:

    docker-compose build
    docker compose up

Production usage:

    docker build ./  -t docker-go-test:0.1
    docker run -it  -p 8080:8080 docker-go-test:0.1
