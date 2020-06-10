Liferay blade

Docker image for use of the Liferay blade tool.

Usage:
```shell script
docker build -t liferay-blade
# docker run -v [dir]:/blade liferay-blade [blade commands]
docker run -v $(pwd):/blade liferay-blade help
```
