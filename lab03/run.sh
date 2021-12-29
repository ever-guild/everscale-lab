# destruct and renew contract

# this is can be analogue of setcode function but with external calling

set -o errexit

tondev se reset
tondev network default se
rm -fr *.abi.json *.tvc

tondev sol compile Updateable.sol
tondev contract deploy Updateable --value 1000000000
UpdateableAddr=$(tondev contract info Updateable | grep Address | cut -d':' -f3 | cut -d' ' -f1)
echo $UpdateableAddr
tondev contract run Updateable cleaner #or cleaner2
#next run 
#tondev contract deploy Updateable -v 1
