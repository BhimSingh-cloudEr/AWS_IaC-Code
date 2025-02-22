## Creating AWS Image From Packer 
* To create AWS Image from Packer we need some info 
* AWS Account: 
* Create Secret Key and Access Key for Packer (IAM User) 
* Source Image AMI 
* Provisioning Script 
* Region

## JSON Formate

    * "Key" : "Pairs"
    * "Name" : "Value"

    
## Create a folder and json file and follow the steps

``` 
    {
        "builders":
            [
            {}
            ]
    }
```

## Lets create access key and secret key to access the services from aws platforms

* Fill all the given fields which are montioned below with required data
```
    {
        "builders": [
            {
            "type": "amazon-ebs",
            "ami_name": "tomcatfrompacker",
            "ami_description": "Tomcat from packer",
            "access_key": "user_credential_to_access_services",
            "secret_key": "user_credential_to_secret_services",
            "region": "us-west-2",
            "instance_type": "t2.micro",
            "source_ami": "ami-25fd4512afd512fsd_as_like",
            "ssh_username": "ubuntu"
            }
        ]
    }
```
* Now execute the commands ```packer validate ./aws.json``` and you should observe the error about ssh_username and to resolve this at that time 
* 



## Credential pass through ENV variables 

* packer build -var 'aws_access_key=what_ever_the_key' -var 'aws_secret_key=what_ever_the_key_is' ./aws.json