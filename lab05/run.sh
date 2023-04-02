set -o errexit

everdev se reset &> /dev/null
everdev network default se
rm -fr *.abi.json *.tvc

everdev sol compile D.sol
everdev contract deploy D --value 1000000000 | grep deployed | xargs

everdev contract info D | grep acc_type_name | xargs
everdev contract run D destructor1 
everdev contract info D | grep acc_type_name | xargs 

everdev contract deploy D --value 1000000000 | grep deployed | xargs
everdev contract info D | grep acc_type_name | xargs
everdev contract run D destructor2
everdev contract info D | grep acc_type_name | xargs
