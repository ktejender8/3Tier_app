# 3Tier_app && Query metadata

This is  3tier architecture for shopping app
It has three microservices 
One shoppingclient-  which acts as a front end
Two Shoppingapi - which acts as backend
three mongodb -  which will work as database

Once the Application is ready with the dot net coding

Create docker files for each of the microservice
Create a docker-compose for the entire solution created on visual studio code
set the connection string docker-compose-override.yml

Once we are done with this run the following commands

docker-compose -f docker-compose.yml -f docker-compose.override.yml up -d
docker-compose -f docker-compose.yml -f docker-compose.override.yml down

See running containers
docker ps
--
See application locally
TEST
http://localhost:8000/swagger/index.html
http://localhost:8001/

Stop Running Containers
docker-compose -f docker-compose.yml -f docker-compose.override.yml down

Create a azure container registry to push the images to the ACR

az login
--------------
Create a resource group
az group create --name myResourceGroup --location westeurope
---------------------
Create an Azure Container Registry
az acr create --resource-group myResourceGroup --name shoppingacr --sku Basic
----------------
Enable Admin Account for ACR Pull
az acr update -n shoppingacr --admin-enabled true
------------------
Log in to the container registry
az acr login --name shoppingacr
Login Succeeded
-------------------------
Tag a container image
docker tag shoppingapi:latest <acrnam>azurecr.io/shoppingapi:v1
docker tag shoppingclient:latest <acrnam>azurecr.io/shoppingclient:v1

docker push shoppingacr.azurecr.io/shoppingapi:v1
docker push shoppingacr.azurecr.io/shoppingclient:v1

List images in registry
az acr repository list --name shoppingacr --output table

az aks create --resource-group myResourceGroup --name myAKSCluster --node-count 1 --generate-ssh-keys --attach-acr <name of the acr>


Update all the manifests with image tags and add them to the AKS folder
Create shopping client service as a Loadbalancer to expose the application on the internet
Once done 
kubectl apply -f ./AKS

  
  _________________________________________________________________________________________________________________________________
  
  Querying metadata of an azure instance 
  
  I have written a powershell script to query the metada

