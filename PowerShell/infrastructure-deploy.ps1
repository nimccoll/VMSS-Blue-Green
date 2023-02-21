# Login to Azure
az login

# Create resource group
az group create --name nimccfta-vmss-bluegreen-rg --location eastus

# Validate ARM template for infrastructure
az deployment group validate -g nimccfta-vmss-bluegreen-rg --template-file infrastructure.json --parameters infrastructure.parameters.json --mode Incremental

# Deploy ARM template for infrastructure
az deployment group create -g nimccfta-vmss-bluegreen-rg --template-file infrastructure.json --parameters infrastructure.parameters.json --mode Incremental