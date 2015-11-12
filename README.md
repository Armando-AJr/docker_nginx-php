## Container com:

```
cat /etc/*release
```
_=> Debian GNU/Linux 8 (jessie)_
```
nginx -v
```
_=> nginx version: nginx/1.9.6_

```
php -v
```
_=> PHP 5.6.14-0+deb8u1 (cli) (built: Oct  4 2015 16:13:10)_

### Modo de utilizar:
```
git clone https://github.com/Armando-AJr/docker_nginx-php.git

cd docker_nginx-php

docker build -t nginx-php .

docker run -it -p 8080:80 -v /pasta-com-exemplos:/usr/share/nginx/html nginx-php
```

Após isso, todas as paginas html e php que estiverem dentro da pasta `/pasta-com-exemplos` estarão acessíveis em:

http://localhost:8080/


> Criado apenas para ajudar a auxiliar na explicação do básico de PHP.
