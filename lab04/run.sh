set -o errexit

everdev se reset &> /dev/null
everdev network default dev
rm -fr *.abi.json *.tvc

everdev sol compile C.sol

