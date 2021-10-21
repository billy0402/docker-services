# Sonar PDF Report Plugin

```shell
$ cd ~/Documents

$ git clone https://github.com/sleroy/sonar-pdf-report.git

$ mvn clean package -Dmaven.test.skip=true -Dlicense.skip=true

$ mkdir -p ~/Documents/docker-services/sonarqube/volumes/extensions/plugins

$ cp ~/Documents/sonar-pdf-report/target/sonar-pdf-report-1.5.1.jar ~/Documents/docker-services/sonarqube/volumes/extensions/plugins

$ docker-compose restart
```
