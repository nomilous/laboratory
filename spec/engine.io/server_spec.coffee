engine = require 'engine.io'
client = require 'engine.io-client'
should = require 'should'


describe 'engine.io', -> 

    before -> 

        @server = engine.listen 3333


    it 'allows multiple clients', (done) -> 

        clients = []

        @server.on 'connection', (socket) -> 
            socket.on 'message', (data) -> 
                clients.push socket
                if clients.length == 2
                    client.send 'okgood' for client in clients

        c0 = new client.Socket 'ws://localhost:3333'
        c1 = new client.Socket 'ws://localhost:3333'

        c0.on 'open', -> c0.send 1
        c1.on 'open', -> 

            c1.send 2
            c1.on 'message', (data) -> 

                data.should.equal 'okgood'
                done()
