zmq  = require 'zmq'


                    #
                    # push - spreads messages evenly between all 
                    #        pulling subscribers
                    #

sock = zmq.socket 'push'

sock.bind 'tcp://127.0.0.1:3000', ->

    console.log sending: 1

    seq = 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0

    setTimeout (-> 

        sock.close()
        console.log closed: 1

    ), 10000

