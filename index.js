var abi = require('ethereumjs-abi')

var parameterTypes = ["string"];
var parameterValues = ["Hello World!"];

var encoded = abi.rawEncode(parameterTypes, parameterValues);

console.log(encoded.toString('hex'));
