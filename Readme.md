
# # Project: Deploy a high-availability web app using CloudFormation

---

## Project Overview
This project deploy web servers for a highly available web app using CloudFormation. All this source code is designed and started from Windows OS (Command Prompt). You can check `evidences/diagram.PNG` to understand the architecture of this project.

## Architecture
The infrastructure is defined across several CloudFormation scripts:
- **Network Stack**: Sets up the VPC, subnets, NAT gateways, and route tables.
- **Server Stack**: Launches EC2 instances within Auto Scaling groups and configures load balancing with Elastic Load Balancer.

## Directory Structure

- `src/`: Contains all sources: YAML, JSON, BATCH Script (Script automation deploy CloudFormation Template)
- `evidences/`: All captures documenting the setup process.

## Prerequisites
To run this project, you will need:
- AWS CLI installed and configured with an IAM user that has the necessary permissions.
- Key pairs for SSH access to EC2 instances.

## How to run?
Go to `src/` directory and follow all the step below
### 1. Create the Network Infrastructure
Run this script to setup network infrastructure:
```batch
.\manage-stack.bat deploy <custom-network-infrastructure-name> network.yml network-parameters.json
```

### 2. Generate Key Pairs using for Server Infrastructure
Run this script to generate key pairs:
```batch
.\create-key-pair.bat <custom-key pairs-name>
```

### 3. Deploy the Servers
Run this script to setup web-app server:
```batch
.\manage-stack.bat deploy <custom-web-app-server-name> .\udagram.yml .\udagram-parameters.json
```

### 4. Verify Your Application
Check the AWS CloudFormation console to ensure that stacks are created without errors. You should see outputs such as URLs or instance IDs in the console.

## Delete resources
To delete all resources of this project:
```batch
.\manage-stack.bat delete <server-name-you-need-to-delete>
```