# create a repository to store the docker image in docker hub

# launch amazon linux ec2 instance. open port 80 and port 22

# install and configure docker on the ec2 instance
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
# close the terminal and ssh again
docker info

# create a dockerfile and insert your script, and check out
sudo vi Dockerfile 

# build the docker image
docker build -t timmie .

# To see the image you just build
docker image ls 

# login to your docker hub account
docker login --username aosnotes77 

# use the docker tag command to give the image a new name (timisnup/cloudtim was created in github repository)
docker tag timmie timisnup/cloudtim

#Check the image you just tag 
docker image ls

#To stop the running container, copy the ID of the container
docker stop >ID<

# push the image to your docker hub repository
docker push timisnup/cloudtim

# start the container to test the image 
docker run -dp 80:80 timisnup/cloudtim

# Get information of the container you are running
docker ps


# references
# https://docs.aws.amazon.com/AmazonECS/latest/developerguide/create-container-image.html
