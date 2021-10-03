# User preference service 

> Design of a generic preference model and integration with mobility service called User preference service. User preference service provide many different user preferences based on the literature research and the applications that already exist. This service lets mobility users select user preferences. Mobility users can choose their mobility preferences in this application directly. 

## Motivation 

Since the rapid industrial development and urbanisation, the number of cars on the road has increased dramatically. Furthermore,  due to CO2 emissions, air pollution is also significantly worse than in the past. These problems have a negative impact on society. In order to solve these problems, people have begun to think about alternative mobility. In particular, demand and needs for mobility services tailored to individual mobility preferences have increased.
This social background motivates this project to provide a personalized mobility solution for mobility users.

## Goal

Designing a generic preference model,Integration with the user preferenced service

## Prototype 

https://user-images.githubusercontent.com/45092135/135749464-9b45afe4-7ef6-43d3-a548-a9075ffc0f97.mov


## Technical detail 

This project works based on flutter from Dart (clientside application), Spring boot from Java (serverside application) and H2 Database.

## How to use this project

1.Download flutter file in the local machine [download](https://flutter.dev/docs/get-started/install)

2.Add the flutter tool to your path in bashrc or zshrc file (mac) 

```bash 
$ export PATH="$PATH:`pwd`/flutter/bin"
```

3.Run database (H2 Database) 

```bash 
$ cd api 
$ cd h2
$ cd bin 
$ ./h2.sh
```

Then h2 database will going to work on. For the access of database you need to set username and password (optional) based on the Spring boot setup 

### Download / Clone

Clone the repo using Git:

```bash
git clone https://github.com/google/material-design-lite.git
```

