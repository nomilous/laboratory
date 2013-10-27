should = require 'should'

it "object carries scope into eval'd function", (done) ->

    eval """

        fn = function(obj){ 
            return obj.getVar();
        }

    """

    {obj} = require './obj'
    obj.getVar().should.equal 1
    
    
    fn(obj).should.equal 1
    done()
    
it "what if it's deeper and via a property getter", (done) ->

    eval """

        fn = function(obj){ 
            return obj.getVar();
        }

    """

    {factory} = require './obj'
    Factory = factory()
    obj = Factory.create()

    obj.getVar().should.equal 1

    fn(obj).should.equal 1
    done()


it 'if it has a $ in the name', (done) -> 

    eval """

        fn = function(obj){ 
            return obj.$getVar();
        }

    """

    {obj} = require './obj'

    fn(obj).should.equal 1
    done()

it 'if it has $$ in the name', (done) ->

    eval """

        fn = function(obj){ 
            return obj.$$getVar();
        }

    """

    {obj} = require './obj'

    fn(obj).should.equal 1
    done()


it 'if it has been substituted', (done) -> 

    fn = (obj) -> obj.$$getVar()

    src = """

        fn = "__FUNCTION__"

    """

    src = src.replace /\"__FUNCTION__\"/, fn.toString()
    
    should.exist fn.toString().match /\$\$/
    should.exist src.match /\$\$/
    
    done()


