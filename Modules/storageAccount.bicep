@maxLength(5)

param location string = resourceGroup().location
param tagValues object


param LoopDieLoop array = [
  'storagevanjansen1000'
  'storagevanjansen2000'
  'storagevanjansen3000'
]
 
resource sta 'Microsoft.Storage/storageAccounts@2021-01-01' = [for name in LoopDieLoop:{
  name: '${name}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: tagValues
  properties: {
    supportsHttpsTrafficOnly: true
  }
}]

output staid string = sta.id
