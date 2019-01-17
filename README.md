# Environment of nodejs project 

```
    [+] AUTOR:        Gerardo Junior
    [+] SITE:         https://gerardo-junior.com
    [+] EMAIL:        me@gerardo-junior.com
    [+] GITHUB:       https://github.com/gerardo-junior/nodejs-docker.git
    [+] TELEGRAM:     @MrGerardoJunior
```

[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/gerardojunior/nodejs)

Docker image to run [node](https://nodejs.org/) projects

> The project must be in the **/src** container folder 
## Tags available

- [stable](https://github.com/gerardo-junior/nodejs-docker/blob/master/Dockerfile), [latest](https://github.com/gerardo-junior/nodejs-docker/blob/develop/Dockerfile), [1.0.0](https://github.com/gerardo-junior/nodejs-docker/blob/1.0.0/Dockerfile)   
    - [library/node](https://hub.docker.com/_/node) 8.15.0-alpine
        - [node](https://nodejs.org/) 8.15.0

## Come on, do your tests

```bash
docker pull gerardojunior/nodejs:stable
```
## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

> You can try building with different versions of software with docker args, for example: NODE_VERISON=10.0.0

```bash
docker build https://github.com/gerardo-junior/nodejs-docker.git --tag gerardojunior/nodejs
```

## How to use

##### Only with docker command:

```bash
# in your project folder
docker run -it --rm -v $(pwd):/src -p 3000:3000 gerardojunior/nodejs:stable [command]

# or docker-compose
docker-compose run node [command]
```
##### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

  node:
    image: gerardojunior/nodejs:stable
    restart: on-failure
    volumes:
      - type: bind
        source: ./
        target: /src
    #ports:
    #  - 3000:3000
    #command: dev

# (...)
```

## How to enter image shell
 
```bash
docker run -it --rm gerardojunior/nodejs sh
# or with docker-compose
docker-compose run node sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
