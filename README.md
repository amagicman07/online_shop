# Online Shop – Hackathon Phase 1 
- This is a Online Shop Ecommerce an application.

![App diagram](https://github.com/amagicman07/online_shop/blob/a3d760c5e36d1ffa70688b69787efc9a103efb14/Ecommer%20pic%202.PNG)


 ### PRE-REQUISITES FOR THIS PROJECT:
- AWS Account
- AWS Ubuntu EC2 instance (t2.medium)
- Install Docker
#
### DEPLOYMENT:
| Deployments    | Paths |
| -------- | ------- |
| Deployment using Docker and Networking | <a href="#Docker">Click me </a>     |

#
### STEPS TO IMPLEMENT THE PROJECT
- **<p id="Docker">Deployment using Docker</p>**
  - Clone the repository
 ```bash
  git clone https://github.com/amagicman07/online_shop.git
  ```
  #
  - Install docker on ubuntu
  ```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker ubuntu
newgrp docker
sudo systemctl status docker
  ``` 
  #
  - Move to the cloned repository
  ```bash
  cd online-shop
  ```
  #
  - Build the Dockerfile
  ```bash
  docker build -t ecommerce-app .
  ```
  #
   - Create a docker network
  ```bash
  docker network create ecommerce-app
  ```
  #
  
  #
  - Run Application container
  ```bash
  docker run -itd --name ecommerce-app --network=ecommerce-app -p 80:80 ecommerce-app
  ```
  #
  - Verify deployment
  ```bash
  docker ps
  ```
  # 
  - Open port 80 of your AWS instance and access your application
  ```bash
  http://<public-ip>:80
  ```
  ### Congratulations, you have deployed the application using Docker 
