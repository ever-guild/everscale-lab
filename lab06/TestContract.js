const TestContract = {
    abi: {
        "ABI version": 2,
        "version": "2.2",
        "header": [
            "time"
        ],
        "functions": [
            {
                "name": "constructor",
                "inputs": [
                    {
                        "name": "chunk",
                        "type": "string"
                    }
                ],
                "outputs": []
            },
            {
                "name": "add",
                "inputs": [
                    {
                        "name": "s",
                        "type": "string"
                    },
                    {
                        "name": "chunk",
                        "type": "uint256"
                    }
                ],
                "outputs": []
            },
            {
                "name": "chunksList",
                "inputs": [],
                "outputs": [
                    {
                        "name": "chunksList",
                        "type": "map(uint256,address)"
                    }
                ]
            },
            {
                "name": "m_chunk",
                "inputs": [],
                "outputs": [
                    {
                        "name": "m_chunk",
                        "type": "string"
                    }
                ]
            }
        ],
        "data": [
            {
                "key": 1,
                "name": "chunkNum",
                "type": "uint256"
            }
        ],
        "events": [],
        "fields": [
            {
                "name": "_pubkey",
                "type": "uint256"
            },
            {
                "name": "_timestamp",
                "type": "uint64"
            },
            {
                "name": "_constructorFlag",
                "type": "bool"
            },
            {
                "name": "chunksList",
                "type": "map(uint256,address)"
            },
            {
                "name": "m_chunk",
                "type": "string"
            },
            {
                "name": "chunkNum",
                "type": "uint256"
            }
        ]
    },
    tvc: "te6ccgECFwEAAp8AAgE0AwEBAcACAEPQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAgaK2zUWBAQkiu1TIOMDIMD/4wIgwP7jAvILEwYFFQKE7UTQ10nDAfhmIds80wABn4ECANcYIPkBWPhC+RDyqN7TPwH4QyG58rQg+COBA+iogggbd0CgufK0+GPTHwHbPPI8CQcDSu1E0NdJwwH4ZiLQ1wsDqTgA3CHHAOMCIdcNH/K8IeMDAds88jwSEgcEUCCCEAf/+sm64wIgghAO9QhXuuMCIIIQQifnCrrjAiCCEFAHOdS64wIQDwsIAigw+EJu4wD4RvJz1NH4APhr2zzyAAkMAhbtRNDXScIBjoDjDQoRAVJw7UTQ9AVt+GqI+GtxIYBA9A6T1wv/kXDi+GyAQPQO8r3XC//4YnD4YxUDLDD4RvLgTPhCbuMA1NP/0ds8MNs88gARDQwAMvhM+Ev4SvhD+ELIy//LP8+D9ADMy//J7VQC6vgAAXDIy/9wbYBA9EMiyMv/cViAQPRDyPQAyfhBiMjPjits1szOycjPhID0APQAz4HJIPkAyM+KAEDL/8nQWSLIz4WIzo0EkCKSGQAAAAAAAAAAAAAAAAABwM8WIds8zM+QoA5zqczJcPsAAfhKgQEA9Bb4ahYOADTQ0gABk9IEMd7SAAGT0gEx3vQE9AT0BNFfAwFOMNHbPPhLIY4bjQRwAAAAAAAAAAAAAAAAI71CFeDIzszJcPsA3vIAEQFQMNHbPPhKIY4cjQRwAAAAAAAAAAAAAAAAIf/+smDIzvQAyXD7AN7yABEANO1E0NP/0z/TADH0BNTT/9H4bPhr+Gr4Y/hiAAr4RvLgTAIK9KQg9KEVFAAUc29sIDAuNTMuMAAAAAwg+GHtHtk=",
    code: "te6ccgECFAEAAnIAAgaK2zUTAQQkiu1TIOMDIMD/4wIgwP7jAvILEAMCEgKE7UTQ10nDAfhmIds80wABn4ECANcYIPkBWPhC+RDyqN7TPwH4QyG58rQg+COBA+iogggbd0CgufK0+GPTHwHbPPI8BgQDSu1E0NdJwwH4ZiLQ1wsDqTgA3CHHAOMCIdcNH/K8IeMDAds88jwPDwQEUCCCEAf/+sm64wIgghAO9QhXuuMCIIIQQifnCrrjAiCCEFAHOdS64wINDAgFAigw+EJu4wD4RvJz1NH4APhr2zzyAAYJAhbtRNDXScIBjoDjDQcOAVJw7UTQ9AVt+GqI+GtxIYBA9A6T1wv/kXDi+GyAQPQO8r3XC//4YnD4YxIDLDD4RvLgTPhCbuMA1NP/0ds8MNs88gAOCgkAMvhM+Ev4SvhD+ELIy//LP8+D9ADMy//J7VQC6vgAAXDIy/9wbYBA9EMiyMv/cViAQPRDyPQAyfhBiMjPjits1szOycjPhID0APQAz4HJIPkAyM+KAEDL/8nQWSLIz4WIzo0EkCKSGQAAAAAAAAAAAAAAAAABwM8WIds8zM+QoA5zqczJcPsAAfhKgQEA9Bb4ahMLADTQ0gABk9IEMd7SAAGT0gEx3vQE9AT0BNFfAwFOMNHbPPhLIY4bjQRwAAAAAAAAAAAAAAAAI71CFeDIzszJcPsA3vIADgFQMNHbPPhKIY4cjQRwAAAAAAAAAAAAAAAAIf/+smDIzvQAyXD7AN7yAA4ANO1E0NP/0z/TADH0BNTT/9H4bPhr+Gr4Y/hiAAr4RvLgTAIK9KQg9KESEQAUc29sIDAuNTMuMAAAAAwg+GHtHtk=",
    codeHash: "584ad64e05897f8f893a7e1609999b77eb414bed162139048ac1586f8108205e",
};
module.exports = { TestContract };