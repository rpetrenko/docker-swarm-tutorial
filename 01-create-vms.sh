managers=2
workers=2

boot2docker_url='https://github.com/boot2docker/boot2docker/releases/download/v18.06.1-ce/boot2docker.iso'

# This creates the manager machines
echo "======> Creating $managers manager machines ...";
for node in $(seq 1 $managers);
do
	echo "======> Creating manager$node machine ...";
	docker-machine create -d virtualbox --virtualbox-boot2docker-url "${boot2docker_url}"  manager$node
done


# This create worker machines
echo "======> Creating $workers worker machines ...";
for node in $(seq 1 $workers);
do
	echo "======> Creating worker$node machine ...";
	docker-machine create -d virtualbox  --virtualbox-boot2docker-url "${boot2docker_url}"   worker$node
done

# This lists all machines created
docker-machine ls


