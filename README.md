# User preference service 

> Design of a generic preference model and integration with mobility service called User preference service. User preference service provide many different user preferences based on the literature research and the applications that already exist. This service lets mobility users select user preferences. Mobility users can choose their mobility preferences in this application directly. 

## Motivation 

Since the rapid industrial development and urbanisation, the number of cars on the road has increased dramatically. Furthermore,  due to CO2 emissions, air pollution is also significantly worse than in the past. These problems have a negative impact on society. In order to solve these problems, people have begun to think about alternative mobility. In particular, demand and needs for mobility services tailored to individual mobility preferences have increased.
This social background motivates this project to provide a personalized mobility solution for mobility users.

## Goal

* Designing a generic preference model
* Integration with the user preferenced service

## Prototype 

https://user-images.githubusercontent.com/45092135/135749464-9b45afe4-7ef6-43d3-a548-a9075ffc0f97.mov


## Technical detail 

* folder name "client": client-side application -> Flutter from Dart 
* folder name "api": server-side application -> Spring boot from Java
* folder name "h2 in api" : database of user preference service -> h2 Database version 1.4.199 [download](http://www.h2database.com/html/download.html)



## How to use this project

1.Download flutter file in the local machine [download](https://flutter.dev/docs/get-started/install)

2.Add the flutter tool to your path in bashrc or zshrc file (mac) 

```bash 
$ export PATH="$PATH:`pwd`/flutter/bin"
```
3. Set application.yml file in api folder 

![application.yml](https://user-images.githubusercontent.com/45092135/135749936-87e3b048-36aa-4a65-9a11-13b3db14c5ff.png)

In this file you can create a username and password for the h2 database authentication. 

5.Run database (H2 Database) 

```bash 
$ cd api 
$ cd h2
$ cd bin 
$ ./h2.sh
```

4. Run flutter file in client folder

```bash 
$ source ~/.bashrc 
$ cd (your root folder name)
$ cd client
$ flutter run 
```

if you want to check your flutter environment then, 

```bash
$ flutter doctor
```



