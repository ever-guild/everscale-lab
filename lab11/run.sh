
set -o errexit
everdev se reset &> /dev/null
everdev network default se
everdev sol compile Deployer.sol

everdev c deploy Deployer.abi.json --value 10000000000 | grep deployed | xargs

everdev sol compile Dummy1.sol
everdev sol compile Dummy2.sol
code1=$(tonos-cli decode stateinit --tvc Dummy1.tvc |  sed '1,4d' |  jq '.code')
code2=$(tonos-cli decode stateinit --tvc Dummy2.tvc |  sed '1,4d' |  jq '.code')

echo "Set code1:"
everdev c r Deployer setCode -i "code:$code1" | grep status_name | xargs
echo "Deploy with new:"
everdev c r Deployer deploy | grep value0 | xargs

echo "Set code2:"
everdev c r Deployer setCode -i "code:$code2" | grep status_name | xargs
echo "Deploy with tranfer:"
everdev c r Deployer deployWithTransfer | grep value0 | xargs


