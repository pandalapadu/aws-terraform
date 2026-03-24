Module 4: Resource Provisioning
 Creating and managing infrastructure resources with Terraform
 Handling resource dependencies and interpolation
 Implementing resource lifecycle management
 Optimizing resource provisioning processes

## 📖 Theory
1. **Creating and Managing Infrastructure Resources with Terraform**
    - Terraform lets you describe infrastructure (like VPCs, subnets, EC2 instances) in simple text files (`.tf`).
    - Instead of clicking in AWS Console, you write code → Terraform provisions it automatically.
    - This is called **Infrastructure as Code (IaC)**.

2. **Handling Resource Dependencies and Interpolation**
    - Some resources depend on others (e.g., a subnet depends on a VPC).
    - Terraform understands these relationships and creates resources in the right order.
    - You can reference one resource inside another using interpolation (`aws_vpc.main.id`).

3. **Implementing Resource Lifecycle Management**
    - Terraform tracks resources in a **state file**.
    - You can `apply` to create, `destroy` to delete, and `plan` to preview changes.
    - Lifecycle rules (like `create_before_destroy`) help avoid downtime.

4. **Optimizing Resource Provisioning Processes**
    - Use modules to reuse code.
    - Use variables to make configurations flexible.
    - Automate with CI/CD pipelines so infrastructure changes are consistent and fast.

---

## 💻 Practical (Terraform Examples)

### Example 1: Create a VPC
```hcl
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "Student-VPC"
  }
}
```

### Example 2: Create a Subnet (depends on VPC)
```hcl
resource "aws_subnet" "main_subnet" {
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "Student-Subnet"
  }
}
```

### Example 3: Lifecycle Example
```hcl
resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Example Amazon Linux AMI
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "WebServer"
  }
}
```

---

## 🏫 Teaching Flow 
1. **Run commands together**
    - `terraform init` → downloads provider plugins.
    - `terraform plan` → shows what will be created.
    - `terraform apply` → provisions resources.
2.**Check AWS Console** → students see the VPC/subnet created.
3.**Destroy resources** with `terraform destroy` → shows lifecycle management.

