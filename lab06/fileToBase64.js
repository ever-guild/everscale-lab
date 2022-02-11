const imageToBase64 = require('image-to-base64');
const fs = require("fs");

imageToBase64("./img.png") // Path to the image
    .then(
        (response) => {
            fs.writeFileSync("./img.txt", response);
        }
    )
    .catch(
        (error) => {
            console.log(error);
        }
    )