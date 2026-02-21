instance_type = "t3.small"
# sg_name = "allow-all-terraform-tfvars"


# Diff variables location
# 1) Default values inside variables.tf
# 2) Default values inside terraform.tfvars
# 3) Command line arguments  
# 4) Environment variables  

#ex: set TF_VAR_sg_name="allow-all-terraform-env" 

# Preference: 
# 1st Command Line Arguments # EX: terrform plan -var="sg_name=allow-all-terraform-cmd"
# 2nd Terraform.tfvars  # terraform plan
# 3rd Environment Variables  #Ex: export TF_VAR_instance_type="t3.medium"  # unset TF_VAR_sg_name
# 4th Default values inside variables.tf