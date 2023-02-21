# Login to Azure
az login

# Validate ARM template (green parameters)
az deployment group validate -g nimccfta-vmss-bluegreen-rg --template-file vmss.json --parameters green.parameters.json --mode Incremental

# Deploy ARM template (green parameters)
az deployment group create -g nimccfta-vmss-bluegreen-rg --template-file vmss.json --parameters green.parameters.json --mode Incremental

# Update load balancer rule to set backend pool to green
az network lb rule update -g nimccfta-vmss-bluegreen-rg --lb-name nimcc-bluegreen-lb -n LBRule --backend-pool-name greenbepool