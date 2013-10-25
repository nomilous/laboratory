should = require 'should'
q = require 'q'

describe 'q', -> 

    promised = -> 
        action = q.defer()
        action.resolve()
        action.promise


    xit 'it loses the AssertionError', (done) -> 

        promised().then(
            (resolve) ->  
                2.should.equal 3
                done()
        )



    context 'aaaaah...  (duh, dunno how i missed that)', -> 

        xit """

            it's the chainability, should's throw is nabbed and will be raised
            into a second promise handler as a rejection

        """, (done) ->

            promised().then(
                (resolve) ->  

                    2.should.equal 3

            ).then done, done

            #
            # easily confuzing
            # 



    context 'a decorator can do it - ', -> 

        be = (fn) -> (done) -> 
            
            fn( done ).then (->), done


        it 'should something', be (done) -> 

            promised().then -> 
               
               2.should.equal 2
               done()

