zmq  = require 'zmq'
sock = zmq.socket 'pull'

sock.connect 'tcp://127.0.0.1:3000'

me          = 0
subscribers = 0
seq         = 0 
prev        = 0

sock.on 'message', (msg) -> 

    #
    # * roundrobin, use seq to determine count of other subscribers
    # 

    seq = parseInt msg
    delta = seq - prev
    me = ( seq % delta ) + 1
    subscribers = delta
    prev = seq



lastSecond = 0
setInterval (->

    perSecond  = seq - lastSecond
    lastSecond = prev

                                                    # overall rate, not rate to this subscriber
    console.log "subscriber #{me} of #{subscribers}, #{perSecond} msg/second, total #{seq} "

), 1000

