# set gas to minimal value

set -o errexit

everdev se reset &> /dev/null
everdev network default se
rm -fr *.abi.json *.tvc

everdev sol compile T.sol
everdev contract deploy T --value 1000000000
TAddr=$(everdev contract info T | grep Address | cut -d':' -f3 | cut -d' ' -f1)
echo $TAddr
everdev contract run T trnsf -i "dest:a88acdb4b54b6772d931c41847791660983fe8d44e466b1a5e11c968a76467c4" | grep gas_used
