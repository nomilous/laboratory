ipso  = require 'ipso'

start = ({port}) -> 

    server = require('http').createServer()
    server.listen port, -> console.log server.address()


describe 'start()', ->

    it 'starts http at config.port', ipso (facto, http) ->

        http.does 
            createServer: ->
                listen: (port) -> 
                    port.should.equal 3000

            #
            # _createServer: -> console.log '_ denotes spy'
            # 

        #
        # http.does singLullaby: ->
        # 

        start port: 3000
        facto()

