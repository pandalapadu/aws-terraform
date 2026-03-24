Module 5: Terraform Modules
 Creating and using modules to organize and reuse configuration code
 Best practices for module design
 Publishing and sharing Terraform modules
 Versioning and upgrading modules 

Excellent — let’s break down **Module 5: Terraform Modules** in a way that’s beginner‑friendly for your students, covering both the **theory** and **practical examples**.

---

## 📖 Theory (Explaining the Concepts)

1. **Creating and Using Modules**
    - A module is just a folder containing Terraform files (`.tf`) that group related resources.
    - Instead of writing the same code again and again, you put it in a module and “call” it wherever needed.
    - Example: a “VPC module” that creates a VPC, subnets, and route tables.

2. **Best Practices for Module Design**
    - Keep modules small and focused (one purpose, like networking or compute).
    - Use **variables** for flexibility (e.g., pass in region, CIDR block).
    - Use **outputs** to expose useful values (like VPC ID).
    - Document the module so others know how to use it.

3. **Publishing and Sharing Modules**
    - You can share modules within your team by pushing them to GitHub.
    - Terraform also has a **public registry** (registry.terraform.io) where you can publish modules for the community.
    - This makes collaboration easier and avoids reinventing the wheel.

4. **Versioning and Upgrading Modules**
    - Modules evolve over time (new features, bug fixes).
    - You can specify versions when using a module, so your infrastructure doesn’t break unexpectedly.
    - Example:
      ```hcl
      module "vpc" {
        source  = "terraform-aws-modules/vpc/aws"
        version = "5.0.0"
      }
      ```

---

## 💻 Practical Demo (Simple Module Example)

### Step 1: Create a Module Folder
```
modules/
  vpc/
    main.tf
    variables.tf
    outputs.tf
```

### Step 2: Inside `modules/vpc/main.tf`
```hcl
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}
```

### Step 3: Inside `modules/vpc/variables.tf`
```hcl
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
  default = "Student-VPC"
}
```

### Step 4: Inside `modules/vpc/outputs.tf`
```hcl
output "vpc_id" {
  value = aws_vpc.this.id
}
```

### Step 5: Use the Module in Root `main.tf`
```hcl
provider "aws" {
  region = "us-east-1"
}

module "my_vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.1.0.0/16"
  vpc_name = "Classroom-VPC"
}
```

