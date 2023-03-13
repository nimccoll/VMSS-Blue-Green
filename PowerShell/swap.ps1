# Login to Azure
az login

# Validate ARM template for backend pool swap
az deployment group validate -g nimccfta-vmss-bluegreen-rg --template-file loadbalancer.json --parameters loadbalancer.parameters.json --mode Incremental

# Deploy ARM template for backend pool swap
az deployment group create -g nimccfta-vmss-bluegreen-rg --template-file loadbalancer.json --parameters loadbalancer.parameters.json --mode Incremental