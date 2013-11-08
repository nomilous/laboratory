// Generated by CoffeeScript 1.6.3
var Mocha;

Mocha = require('mocha');

module.exports = function(specFile) {
  var mocha;
  mocha = new Mocha({
    reporter: function(runner) {
      /*
      
         from: mocha/lib/runner.js
      
         Initialize a `Runner` for the given `suite`.
         
         Events:
         
           - `start`  execution started
           - `end`  execution complete
           - `suite`  (suite) test suite execution started
           - `suite end`  (suite) all tests (and sub-suites) have finished
           - `test`  (test) test execution started
           - `test end`  (test) test completed
           - `hook`  (hook) hook execution started
           - `hook end`  (hook) hook complete
           - `pass`  (test) test passed
           - `fail`  (test, err) test failed
           - `pending`  (test) test pending
      */

      runner.on('suite', function() {
        return console.log('suite', arguments);
      });
      return runner.on('test', function() {
        return console.log('test', arguments);
      });
    }
  });
  mocha.addFile(specFile);
  return mocha.run(function(failureCount) {
    console.log({
      failed: failureCount
    });
    return process.on('exit', function() {
      return process.exit(failureCount);
    });
  });
};