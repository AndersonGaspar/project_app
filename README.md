# Anderson Gaspar de Medeiros

## Provisioning Jenkins.
* I created an user in AWS IAM with policy AdministratorAccess
* Installed the AWS CLI in Ubuntu 20.04.
* Configured in directory ~/.aws/credentials and ~/.aws/config the IAM user credentials.(not especifico)
* I provisioned the EC2 type t2-small.
* In the directory ~ /devops-engineer/IaC, the terraform init command was runned to initialize the working directory with the Terraform configuration files.
* The terraform apply command was runned to apply the desired settings.
* Only terraform commands
* Will be displayed a list of changes to be created, altered or destroyed 
* After confirming the changes, they will be printed on the screen. 

## Provisioning and deploy a data structure store (like Jenkins)
* In the previous step, an instance was provisioned for the installation of Jenkins by Ansible.
* Installed the Ansible on Ubuntu 20.04.
* Run the export command ANSIBLE_PRIVATE_KEY_FILE =~/IaC/key.pub to set the variable ANSIBLE_PRIVATE_KEY_FILE that will be used by Ansible to connect to the instance.
* Run the export command Ansible private key.
* Two options for installing Jenkins:
    * In the directory ~/IaC/Jenkins run the command ansible-playbook -b jenkins.yml --diff -vvvvvv to install and configure Jenkins.
    * there is also a Dockerfile for installing Jenkins in the same directory.(Better)
* The status and the end of the process will be printed on the screen.

## Deploy a test app image (Jenkins pipeline)
* With the installed docker, was created a Dockerfile with the image of Jenkins.
* Run the command docker build -a Jenkins to install Jenkins service.
* After making the build and running the command, the Jenkins service will be available at localhost:8080
* Then make the initial configurations of Jenkins and create the crendicals of the user Jenkins(Global)
* After that, create a new Pipeline item and insert the code from the pipeline.json file in the Jenkins directory.
* In this pipeline will be configured the environment variables, clone of the git repository, build the Docker image, deploy the image and remove the image when finished.


# Operations/Infrastructure Engineer (DevOps)

### Create Virtual Environment

Create a virtual environment to manage dependencies in isolation from your system:

```bash
$ python -m venv venv
```

### Activate Virtual Environment

After you create a virtual environment, it is time to activate it:

```bash
$ source venv/bin/activate
```

### Install Dependencies

Now you have an isolated environment, you are safe to install the dependencies:

```bash
$ pip install -r requirements.txt
```

### Starting the Server

This is how you run a Flask API in _development mode_. To run that in _production mode_, remove the `FLASH_ENV` environment variable:

```
$ # development mode
$ FLASK_ENV="development" python api/app.py
```

```
$ # production mode
$ python api/app.py
```

Once the application is running, you can access it using cURL:

```bash
$ curl -H "Authorization: Bearer ThisShouldBeSecret" http://localhost:8000/
{"message":"Your Flask API server is flying!"}
```

### Running Security Analyzer (Bandit)

For this application, we have Bandit to perform security checks. Among other things, it looks for hard-coded passwords, which in fact should live in environment variables.

```bash
$ bandit -r api -c bandit.yml
```

### Running Tests (Pytest)

Finally, we use Pytest to run the test suit:

```bash
$ pytest
```