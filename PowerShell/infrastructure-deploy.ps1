# Login to Azure
az login

# Create resource group
az group create --name nimccfta-vmss-bluegreen-rg --location eastus

# Validate ARM template for infrastructure
az deployment group validate -g nimccfta-vmss-bluegreen-rg --template-file infrastructure-no-lb.json --parameters infrastructure.parameters.json --mode Incremental

# Deploy ARM template for infrastructure
az deployment group create -g nimccfta-vmss-bluegreen-rg --template-file infrastructure-no-lb.json --parameters infrastructure.parameters.json --mode Incremental

# Validate ARM template for infrastructure
az deployment group validate -g nimccfta-vmss-bluegreen-rg --template-file loadbalancer.json --parameters loadbalancer.parameters.json --mode Incremental

# Deploy ARM template for infrastructure
az deployment group create -g nimccfta-vmss-bluegreen-rg --template-file loadbalancer.json --parameters loadbalancer.parameters.json --mode Incremental