### Docker - Store app

Build eap image

	$ docker build -t jboss-store .


Start mysql docker container

	$ docker run -itd --name mysqldb -v /home/virtuser/osev3/project_repos/data/mysqldb -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=demodb -e MYSQL_USER=demouser -e MYSQL_PASSWORD=password  mysql

Start eap docker container

	$ docker run -itd -p 8080:8080 --name jboss-store -e MYSQL_DATABASE=demodb -e MYSQL_USER=demouser -e MYSQL_PASSWORD=password --link mysqldb:mysqldb jboss-store 

Access application

	http://localhost:8080/store/
