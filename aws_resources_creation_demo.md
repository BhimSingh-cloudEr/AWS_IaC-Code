terraform apply --auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_subnet.first_subnet_1 will be created
  + resource "aws_subnet" "first_subnet_1" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.0.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "subnet_1_from_tf"
        }
      + tags_all                                       = {
          + "Name" = "subnet_1_from_tf"
        }
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.vpc_first will be created
  + resource "aws_vpc" "vpc_first" {
      + arn                                  = (known after apply)
      + cidr_block                           = "192.168.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "From_tf"
        }
      + tags_all                             = {
          + "Name" = "From_tf"
        }
    }

Plan: 2 to add, 0 to change, 0 to destroy.
aws_vpc.vpc_first: Creating...
aws_vpc.vpc_first: Creation complete after 1s [id=vpc-092e6590a77dfe]
aws_subnet.first_subnet_1: Creating...
aws_subnet.first_subnet_1: Creation complete after 1s [id=subnet-0d4e52728bd9]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

## terraform destroy
aws_vpc.vpc_first: Refreshing state... [id=vpc-092edf90a7ds7bfe]
aws_subnet.first_subnet_1: Refreshing state... [id=subnet-1rtyu0er1d728bd9]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_subnet.first_subnet_1 will be destroyed
  - resource "aws_subnet" "first_subnet_1" {
      - arn                                            = "arn:aws:ec2:ap-south-1:37425399782:subnet/subnet-0d4e10ac11gfd58dd9" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "ap-south-1b" -> null
      - availability_zone_id                           = "aps1-az3" -> null
      - cidr_block                                     = "192.168.0.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0d40acjhgf8511d728bd9" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "6635357697499782" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {
          - "Name" = "subnet_1_from_tf"
        } -> null
      - tags_all                                       = {
          - "Name" = "subnet_1_from_tf"
        } -> null
      - vpc_id                                         = "vpc-00a77bcdfe" -> null
        # (4 unchanged attributes hidden)
    }

  # aws_vpc.vpc_first will be destroyed
  - resource "aws_vpc" "vpc_first" {
      - arn                                  = "arn:aws:ec2:ap-south-1:6269962552782:vpc/vpc-092ek52hh0a77bcdfe" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "192.168.0.0/16" -> null
      - default_network_acl_id               = "acl-01ccc971fc" -> null
      - default_route_table_id               = "rtb-096162c65da0" -> null
      - default_security_group_id            = "sg-082e399a5164" -> null
      - dhcp_options_id                      = "dopt-08a9036648a" -> null
      - enable_dns_hostnames                 = false -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-092ea77bcdfe" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-096162c65da0" -> null
      - owner_id                             = "626635852582" -> null
      - tags                                 = {
          - "Name" = "From_tf"
        } -> null
      - tags_all                             = {
          - "Name" = "From_tf"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_subnet.first_subnet_1: Destroying... [id=subnet-0d4c11d728bd9]
aws_subnet.first_subnet_1: Destruction complete after 1s
aws_vpc.vpc_first: Destroying... [id=vpc-09277bcdfe]
aws_vpc.vpc_first: Destruction complete after 0s

Destroy complete! Resources: 2 destroyed.