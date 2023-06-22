## Building Instructions

### Prerequisites
Before proceeding with the build process, please ensure that you have the following prerequisites installed:
- Docker
- Docker Compose

Additionally, make sure to pull the source code repository.

### Build Docker image
1. Pull the source code repository using Git.
2. Navigate to the root directory of the project.
3. Run command
    - docker build . -t allaccess-node:latest

### Step-by-Step Guide
1. Pull the source code repository using Git.
2. Navigate to the root directory of the project.
3. Run the Docker Compose file.
    - docker-compose -f ./docker-compose.yml up --build -d
4. Please wait a few seconds and verify that the each node has been successfully initialized. 
    - docker ps
    - docker logs [id-container]
5. Deploy smart contract whitelist
    - cd solidity/
    - npm install
    - truffle migrate

### Confirming Source Code Execution
To confirm that the source code is running correctly, follow these steps:

1. Use the `curl` command to ping the API endpoint.
    - curl --location 'http://localhost:8003/jrpc' \
    --header 'Content-Type: application/json' \
    --data '{
        "id":1, "jsonrpc":"2.0",
        "method":"Ping",
        "params":{
            "message":"Hello"
        }
    }'

### Required Ports for VPS

When setting up your VPS (Virtual Private Server) environment, make sure to open the following ports to ensure proper functionality:

- Port 8000->8004: HTTP Port for each node

Please ensure that these ports are open in your VPS firewall configuration to allow incoming and outgoing network traffic. The specific steps to open these ports may vary depending on your VPS provider or server configuration.