should = require 'should'

it "object carries scope into eval'd function", (done) ->

    fn = eval """

        fn = function(obj){ 
            return obj.getVar();
        }

    """

    {obj} = require './obj'
    obj.getVar().should.equal 1
    
    
    fn(obj).should.equal 1
    done()
    
