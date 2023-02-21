# Login to Azure
az login

# Validate ARM template (blue parameters)
az deployment group validate -g nimccfta-vmss-bluegreen-rg --template-file vmss.json --parameters blue.parameters.json --mode Incremental

# Deploy ARM template (blue parameters)
az deployment group create -g nimccfta-vmss-bluegreen-rg --template-file vmss.json --parameters blue.parameters.json --mode Incremental