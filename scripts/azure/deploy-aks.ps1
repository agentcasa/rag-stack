Write-Host '    ____              _____ __             __  '  
Write-Host '   / __ \____ _____ _/ ___// /_____ ______/ /__' 
Write-Host '  / /_/ / __ `/ __ `/\__ \/ __/ __ `/ ___/ //_/' 
Write-Host ' / _, _/ /_/ / /_/ /___/ / /_/ /_/ / /__/ ,<   '  
Write-Host '/_/ |_|\__,_/\__, //____/\__/\__,_/\___/_/|_|  '  
Write-Host '            /____/   ' 
Write-Host '_______________________________________________'
Write-Host

# Prompt the user for their deployment details
$SUBSCRIPTION_ID = Read-Host -Prompt "Enter your Azure subscription ID"
$REGION = Read-Host -Prompt "Enter the Azure region (default: East US)"
$RESOURCE_GROUP_NAME = Read-Host -Prompt "Enter the Azure resource group name (default: rag-stack-resources)"
$MODEL = Read-Host -Prompt "Model to deploy: llama2-7b or falcon7b (default: falcon7b)"

# Set the Terraform variables
$Env:TF_VAR_subscription_id = $SUBSCRIPTION_ID
$Env:TF_VAR_region = $REGION
$Env:TF_VAR_resource_group_name = $RESOURCE_GROUP_NAME
$Env:TF_VAR_model = $MODEL

# Initialize Terraform
terraform init

# Validate the Terraform configuration
terraform validate

# Apply the deployment
terraform apply
