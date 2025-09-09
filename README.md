 # 📝Тестовое задание DevOps 
## Задание 1. ansible playbook
### 1) Создаем папку с файлами, которую будем копировать на хосты

``` bash
mkdir files
cd files
touch files{1,2,3}
```
### 2) Запускаем playbook
``` bash
ansible-playbook playbook.yaml
```
<img width="1227" height="361" alt="image" src="https://github.com/user-attachments/assets/a2657175-082e-4da5-a1be-b5954c11dc0b" />


### 3) Что использовал, и в чем разница with_items от loop, запустил и что-то не работает как узнать подробнее?
Работала с loops. Отличие loops от with_items в обработке словарей. With_items по умолчанию предварительно обрабатывает словарь, а loop – нет, это нужно делать явно, чтобы loop смог обработать значения. Чтобы подробнее узнать в чем проблема, можно 
включить подробный вывод 
```
ansible-playbook playbook.yml -v
ansible-playbook playbook.yml -vvv
```
проверить синтаксис 
```
ansible-playbook playbook.yml --syntax-check
```
перед циклом добавить таску и посмотреть, что именно передается на каждой итерации

## Задание 2. Bash скрипт
Сделать файл исполняемым 
```
chmod +x script.sh
```
запустить
```
./script.sh
```
вывести результат работы в другой файл
```
./script.sh > out_file.txt
```
<img width="642" height="130" alt="image" src="https://github.com/user-attachments/assets/7fb88b7d-3f09-44ab-a688-f37ad1de1f41" />



 ## Задание 3. Docker
 Запуск:
 ```
sudo docker-compose up -d
```
Чтобы nginx запускался после php, использую depends_on.

Для запуска контейнера postgres надо указать имя пользователя, пароль и название бд (в файле .env):
 ```
POSTGRES_PASSWORD=user1234
POSTGRES_USER=user
POSTGRES_DB=my-db
 ```
Чтобы контейнеры могли "видеть" друг друга, создаю сеть vita с типом bridge. Контейнеры видят друг друга, но изолированы от хостовой сети.


<img width="640" height="136" alt="image" src="https://github.com/user-attachments/assets/9ca36c1b-449a-4a17-af8c-c386ede77240" />
<img width="1009" height="489" alt="image" src="https://github.com/user-attachments/assets/4f57d330-0171-410f-ab16-4484ebac9156" />


#### Написать команду запуска, если файл default.conf в системе поменяется, изменится ли он  внутри контейнера тоже? Нужен рестарт при изменение файла default.conf ? 
 ```
sudo docker-compose up -d #запуск контейнера
 ```
Да, поменяется. Путь на хостовой машине "привязан" к пути внутри контейнера. Изменения в файле на хосте отразятся в контейнере и наоброт, поэотму рестарт при изменении default.conf не нужен.
 ```
./default_nginx.conf:/etc/nginx/nginx.conf
 ```
#### А если в docker-compose внесли изменения ? 
Рестарт нужен, потому изменения в docker-compose.yaml никак не влиют на параметры уже запущенного процесса.
#### Что нравится больше docker-compose или docker-swarm ? 
Для запуска контейнеров на разных нодах (для распределения нагрузки) удобно использовать docker swarm, если этого не требуется, то docker-compose достаточно.


