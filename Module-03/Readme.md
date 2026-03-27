Module 3: State Management
     Understanding Terraform state
     Remote state storage options
     State locking and consistency
     Managing state file drift
#####################################################
| Filename             | Purpose                                  |
| -------------------- | ---------------------------------------- |
| `backend.tf`         | Remote backend config (state storage)    |
| `provider.tf`        | Provider config (Azure, AWS, etc.)       |
| `resource-group.tf`  | Resource group resource definition       |
| `storage-account.tf` | Storage account resource definition      |
| `local.tf`           | Local variables and computed values      |
|        |
| `output.tf`          | Output variables to expose resource info |

###########**implicit vs explicit** dependencies in Terraform ############
**Implicit Dependency**: `variables.tf`       | Input variable declarations              |
| `terraform.tfvars`   | Input variable values overrides
* Terraform automatically understands the order of resources based on references.
* You don’t need to specify anything; Terraform uses the fact that one resource depends on another.
  Example:
  provider "aws" {
  region = "ap-south-1"
  }

    resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    }

    resource "aws_subnet" "subnet1" {
    vpc_id     = aws_vpc.main.id   # 👈 reference
    cidr_block = "10.0.1.0/24"
    }
  “Terraform automatically understands:

Subnet depends on VPC So VPC will be created first”
Here, the aws_subnet implicitly depends on the VPC subnet because we referenced aws_vpc.main.id .
Terraform automatically creates the VPC first.

**Explicit Dependency**:
* Sometimes, Terraform cannot detect a dependency automatically.
* You can force a dependency using the depends_on argument.
* Useful when resources don’t reference each other, but one must be created first.
  Example :
  resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  }

resource "aws_internet_gateway" "igw" {
vpc_id = aws_vpc.main.id
}

resource "aws_instance" "ec2" {
ami           = "ami-0c55b159cbfafe1f0"
instance_type = "t2.micro"

depends_on = [aws_internet_gateway.igw]  # 👈 explicit dependency
}

“Here EC2 does NOT directly use Internet Gateway”
“We are forcing Terraform: Create Internet Gateway first, then EC2”
This is Explicit Dependency
Even if Terraform could detect it, sometimes depends_on ensures the order of operations,
especially with modules or complex resources.

Implicit vs Explicit

| Type     | How it works | Example              |
| -------- | ------------ | -------------------- |
| Implicit | Automatic    | Using `.id`, `.name` |
| Explicit | Manual       | Using `depends_on`   |

“Implicit dependency is automatic — Terraform is smart.
Explicit dependency is manual — we guide Terraform.”