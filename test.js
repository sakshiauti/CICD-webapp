//for unit test
const assert = require('assert');
const greetings = require('./greetings');

assert.strictEqual(greetings('World'), 'Hello World');
console.log('All tests passed!');


// This code tests the greetings module to ensure it returns the expected greeting message.