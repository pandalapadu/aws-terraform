Module 5: Terraform Modules
 Creating and using modules to organize and reuse configuration code
 Best practices for module design
 Publishing and sharing Terraform modules
 Versioning and upgrading modules 
######################📖 Theory (Explaining the Concepts)#######
What are Terraform modules ?
Terraform modules are reusable templates for infrastructure.
Instead of writing the same Terraform code again and again, we package it once as a module and reuse it.

Why do we use modules?
1.Reusability
Write code once        
Use it for dev, test, prod
2.Consistency
Same naming, same settings, fewer mistakes
3.Clean & readable code
Main Terraform files stay small
Complex logic lives inside modules
4.Team collaboration
One team builds modules
Others just use them

Terraform Modules explained using a Student Progress Card .
Step 1: The problem (without modules)
Imagine a school where:
Every teacher designs their own progress card
Different formats
Different subjects order
Different grading styles

Result:
Confusion
Inconsistency
More mistakes
Hard to compare students

This is like writing Terraform code without modules — repeated, messy, and error-prone.
Step 2: The solution (modules)
The school decides: “We will create one standard progress card template and reuse it for every student.”
That standard template = Terraform module

| Student Progress Card      | Terraform Module     |
| -------------------------- | -------------------- |
| Progress card template     | Module               |
| Student name, roll no      | Input variables      |
| Subjects & marks logic     | Resource definitions |
| Total, grade, result       | Outputs              |
| Same card for all students | Reusable module      |

Step 3: Inputs (Variables)
Each student is different, but the format stays the same.
For every student, we only change: Name= Student name  , Roll number: Student class num, Marks: Student marks
Terraform : we only change : vnet_name , location, resource_group

Step 4: Outputs :After filling the progress card, we get: Total marks, Grade , Pass/Fail
Terraform Outputs : resource IDs, IP addresses, URLs

Step 5: Reusability
One progress card template can be used for:  Class 1 to Class 10, Any section, Any year.
Same way: One Terraform module Used for dev, test, prod Used by different teams as well .

Step 6: Why this matters in real projects
Without modules: Every student has a different card ❌ , Hard to maintain ❌
With modules: Same structure for everyone ✅  ,Easy to update (change template once) ✅ ,Professional & scalable ✅

Folder structure for multiple environments
terraform-azure/
│
├── modules/
│   ├── resource-group/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   ├── network/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── compute/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── envs/
│   ├── dev/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── terraform.tfvars
│   │
│   ├── test/
│   └── prod/
=======in our example we are creating following ==================
08-Terraform-Modules
│
├── 01.envs        → Different students (dev / stage / prod)
│
└── 02.modules     → Progress card templates (reusable)

What should clearly understand

| Concept    | Dev       | Stage     | Prod      |
| ---------- | --------- | --------- | --------- |
| Modules    | Same      | Same      | Same      |
| Code logic | Same      | Same      | Same      |
| Names      | Different | Different | Different |
| VM size    | Small     | Medium    | Large     |

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

