# destruct and renew contract

# this is can be analogue of setcode function but with external calling

set -o errexit

tondev se reset
tondev network default dev
rm -fr *.abi.json *.tvc

tondev sol compile T.sol
tondev contract deploy T --value 1000000000
TAddr=$(tondev contract info T | grep Address | cut -d':' -f3 | cut -d' ' -f1)
echo $TAddr
tondev contract run T trnsf -i "dest:a88acdb4b54b6772d931c41847791660983fe8d44e466b1a5e11c968a76467c4"
#0.009811006 total tr fee with bounce true
