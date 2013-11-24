zmq  = require 'zmq'


                    #
                    # push - spreads messages evenly between all 
                    #        pulling subscribers
                    #

sock = zmq.socket 'push'
seq  = 0 

sock.bind 'tcp://127.0.0.1:3000', ->

    console.log sending: 1

    #
    # sent messages are queued while no subscribers are present
    #

    setInterval (-> sock.send seq++), 0
    setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0
    # setInterval (-> sock.send seq++), 0

    # setTimeout (-> 

    #     sock.close()
    #     console.log closed: 1

    # ), 10000

    

    prevMem = undefined

    setInterval (->


        mem = process.memoryUsage()


        if prevMem? then console.log delta: 
            rss: mem.rss - prevMem.rss
            heap: 
                tot: mem.heapTotal - prevMem.heapTotal
                used: mem.heapUsed - prevMem.heapUsed



        prevMem = mem

    ), 1000

