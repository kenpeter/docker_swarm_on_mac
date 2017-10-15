https://www.youtube.com/watch?v=xKtNXR6mzSU

https://github.com/cloud-coder/docker-lab-2016/tree/feature/manual-yaml-steps/part-3


1 manager + 2 workers
----
docker-machine create -d virtualbox manager-1
docker-machine create -d virtualbox worker-1
docker-machine create -d virtualbox worker-2


list
----
docker-machine ls --filter=driver=virtualbox


Run
----
eval $(docker-machine env manager-1)

docker run -d -p 8080:8080 --name=swarm-viz \
 -e HOST=localhost \
 -e PORT=8080 \
 -e HOST=$(docker-machine ip manager-1) \
 -v /var/run/docker.sock:/var/run/docker.sock \
 dockersamples/visualizer

 open http://$(docker-machine ip manager-1):8080


join
-----
Switch to node 1

eval $(docker-machine env worker-1)

join (similar cmd):
docker swarm join --token SWMTKN-1-3i53nr4gbkjhbfum1b4kxpgu7nysde9uvttczzqinp03a948se-2ow7czsi6yzxj7obndkxdl072 192.168.99.103:2377


Switch to node 2
eval $(docker-machine env worker-2)

join (similar cmd):
docker swarm join --token SWMTKN-1-3i53nr4gbkjhbfum1b4kxpgu7nysde9uvttczzqinp03a948se-2ow7czsi6yzxj7obndkxdl072 192.168.99.103:2377





