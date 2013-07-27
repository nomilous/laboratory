coffee = require 'coffee-script'

require('nez').realize 'JavascriptFunctionParser', (JavascriptFunctionParser, test, context, events) -> 

    context 'parse javascript', (it) ->

        it 'is an event emitter', (done) -> 

            JavascriptFunctionParser.should.be.an.instanceof events.EventEmitter
            test done


        it 'emits on leaf of function definition stack', (done) -> 

            STACKS = []

            JavascriptFunctionParser.on 'stack', (stack) -> 

                STACKS.push stack

            JavascriptFunctionParser.on 'end', -> 

                #console.log JSON.stringify STACKS, null, 2

                STACKS[0][0].signature.should.eql ['arg1', 'arg2']
                STACKS[0][0].variables.should.eql ['nestedFn1', 'nestedFn2']
                STACKS[0][0].statements.should.eql [ 
                    'nestedFn1 = function(arg3, arg4)'
                    'nestedFn2 = function(arg5, arg6)'
                    'return nestedFn1(arg1, arg2())' 
                ]
                STACKS[0][1].signature.should.eql ['arg3', 'arg4']
                STACKS[0][1].variables.should.eql ['test']
                STACKS[0][1].statements.should.eql [
                    'test = 5'
                    'return arg3 + arg4'
                ]
                STACKS[1][0].signature.should.eql ['arg1', 'arg2']
                STACKS[1][1].signature.should.eql ['arg5', 'arg6']
                STACKS[1][1].statements.should.eql [
                    'test = 9'
                    'return arg5 + arg6'
                ]
                test done

            JavascriptFunctionParser.parse coffee.compile """

                (arg1, arg2) ->

                    nestedFn1 = (arg3, arg4) ->

                        test = 5
                        arg3 + arg4

                    nestedFn2 = (arg5, arg6) ->

                        test = 9
                        arg5 + arg6

                    nestedFn1 arg1, arg2()


            """, bare: true
