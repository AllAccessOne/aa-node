const NodeList = artifacts.require('./NodeList.sol')
const whitelistedAccounts = require('../whiteList')

module.exports = async function(deployer, network, accounts) {
  const NodeListInstance = await NodeList.at("0xD44F7724b0a0800e41283E97BE5eC9E875f59811")
  const nodeAddresses = await NodeListInstance.getNodes(1);
  console.log("🚀 ~ file: 4_get_index_node.js:7 ~ module.exports=function ~ nodeAddresses:", nodeAddresses)
  for await (const address of nodeAddresses) {
    const node = await NodeListInstance.nodeDetails(address);
    console.log("🚀 ~ file: 4_get_index_node.js:9 ~ forawait ~ node:", address,node.position.toString())
  }
}
