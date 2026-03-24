
**Module 6: Terraform Workflow** 
---
# 🌱 Big Picture 
👉 “Terraform workflow is like **building a house**.”
1. You **write a plan** 📝
2. You **check the plan** 🔍
3. You **build it** 🏗️
4. You **fix issues if any** 🔧
5. You can also **destroy it when no longer needed** 💣
---
# 1. Writing and Organizing Terraform Code
### What it means:  You write `.tf` files to define infrastructure.
“This is like writing instructions for what you want.”
Example:
            resource "aws_instance" "my_ec2" {
              ami           = "ami-12345"
              instance_type = "t2.micro"
            }
“We are not creating resources manually — we are **describing them in to code**.”
### Best Practices (keep it simple easy to understand ):
* Separate files:
    * `main.tf` → main logic
    * `variables.tf` → inputs
    * `outputs.tf` → results
    * Use **modules** for reuse
## 2. Planning, Applying, and Destroying Infrastructure
This is the **core workflow** 
## Step 1: `terraform plan`
### What it does: Shows what Terraform **WILL DO**
 “This is a preview — nothing is created yet.”
## 🏗Step 2: `terraform apply`
### What it does: * Actually creates resources
“Now we are pressing the **execute button**.”
## Step 3: `terraform destroy`
### What it does: * Deletes everything created
 “Cleaning up resources to save cost.”
### Simple Flow  Work Flow ### Write Code → Plan → Apply → Use → Destroy 
# 3. Using Terraform CLI Commands Effectively

Explain this like **daily tools** 

| Command              | Meaning      | Simple Explanation        |
| -------------------- | ------------ | ------------------------- |
| `terraform init`     | Initialize   | “Setup Terraform project” |
| `terraform plan`     | Preview      | “What will happen?”       |
| `terraform apply`    | Create       | “Do it now”               |
| `terraform destroy`  | Delete       | “Remove everything”       |
| `terraform validate` | Check syntax | “Is my code correct?”     |
| `terraform fmt`      | Format       | “Make code clean”         |

Compare to cooking:

* `init` → Prepare kitchen
* `plan` → Read recipe
* `apply` → Cook food
* `destroy` → Clean kitchen
#  4. Debugging and Troubleshooting Terraform Configurations
### What it means:  Fix errors when something goes wrong 
## Common Issues :
### 1. Syntax Errors
    instance_type = t2.micro   ❌
    instance_type = "t2.micro" ✅
        ### Missing quotes, brackets
### 2. Wrong Values
* Wrong AMI ID
* Invalid region
### 3. Dependency Issues
* Resource created before another
## Useful Debug Commands:

| Command                | Use            |
| ---------------------- | -------------- |
| `terraform validate`   | Check errors   |
| `terraform plan`       | See problem    |
| `terraform state list` | View resources |
| `terraform logs`       | Deep debugging |

“Terraform errors are like exam mistakes — read carefully, fix step by step.”

You can summarize like this:

> “Terraform workflow is a simple cycle:
>
> 1. Write code
> 2. Preview changes
> 3. Apply infrastructure
> 4. Fix errors if any
> 5. Destroy when not needed
>
> And we use CLI commands to control everything.”
# 💡 Bonus: Friendly Analogy (Very Effective)
👉 **Ordering Food Online**
| Step       | Terraform        | Real Life    |
| ---------- | ---------------- | ------------ |
| Write code | Define resources | Select food  |
| Plan       | Preview order    | Check cart   |
| Apply      | Create infra     | Place order  |
| Destroy    | Delete infra     | Cancel order |

