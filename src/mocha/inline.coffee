
Mocha = require 'mocha'

module.exports = (specFile) -> 

    #
    # https://github.com/visionmedia/mocha/wiki/Using-mocha-programmatically
    #

    mocha = new Mocha 

        reporter: (runner) -> 

            ###
            
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
            
            ###

            # runner.on 'start', -> console.log 'start', arguments
            runner.on 'suite', -> console.log 'suite', arguments
            runner.on 'test',  -> console.log 'test',  arguments
            # runner.on 'hook',  -> console.log 'hook',  arguments
            # runner.on 'pass',  -> console.log 'pass',  arguments
            # runner.on 'fail',  -> console.log 'fail',  arguments

            #
            # nice!
            # 


    mocha.addFile specFile
    mocha.run (failureCount) ->
        console.log failed: failureCount
        process.on 'exit', ->
            process.exit failureCount

