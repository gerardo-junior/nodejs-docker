# Environment of nodejs project 

```
    [+] AUTOR:        Gerardo Junior
    [+] SITE:         https://gerardo-junior.com
    [+] EMAIL:        me@gerardo-junior.com
    [+] GITHUB:       https://github.com/gerardo-junior/nodejs-docker.git
    [+] TELEGRAM:     @MrGerardoJunior
```

Docker image to run [node](https://nodejs.org/) projects

> The project must be in the **/src** container folder 
## Tags available

- [stable](https://github.com/gerardo-junior/nodejs-docker/blob/master/Dockerfile), [latest](https://github.com/gerardo-junior/nodejs-docker/blob/develop/Dockerfile), [1.0.0](https://github.com/gerardo-junior/nodejs-docker/blob/1.0.0/Dockerfile)   
    - [library/node](https://hub.docker.com/_/node) 8.15.0-alpine
        - [node](https://nodejs.org/) 8.15.0
        - [yarn](https://yarnpkg.com/) 1.12.3

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

##### With [docker](https://docs.docker.com/engine/reference/commandline/docker/) command:

```bash
docker run -it --rm gerardojunior/nodejs:stable [sh command or npm script]
```
##### With [docker-compose](https://docs.docker.com/compose/) command:

Create the [docker-compose.yml](https://docs.docker.com/compose/compose-file/) file  in your project folder with:

```yml
# (...)

  nodejs:
    image: gerardojunior/nodejs:stable
    restart: on-failure

# (...)
```

run this command with this syntax
```bash
docker-compose run node [sh command or npm script]
```

## How to enter image shell
 
```bash
docker run -it --rm gerardojunior/nodejs sh
# or with docker-compose
docker-compose run node sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](https://github.com/gerardo-junior/nodejs-docker/blob/master/LICENSE) file for details
