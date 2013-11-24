zmq  = require 'zmq'
sock = zmq.socket 'pull'

sock.connect 'tcp://127.0.0.1:3000'

me          = 0
subscribers = 0
seq         = 0 
prev        = 0
first       = undefined

messages    = []


sock.on 'message', (msg) -> 

    #
    # * roundrobin, use seq to determine count of other subscribers
    # 

    seq = parseInt msg
    delta = seq - prev
    me = ( seq % delta ) + 1
    subscribers = delta
    prev = seq

    first = seq unless first?

    #
    # * store each arrived message
    #

    messages.push seq


process.on 'SIGINT', -> 

    sock.close()
    setTimeout (-> 
        console.log last: prev
        process.exit 0
    ), 2000


lastSecond = 0
setInterval (->

    perSecond  = seq - lastSecond
    lastSecond = prev


    #
    # per second
    # ----------
    # 
    # * count arrived messages and flush array
    #

    msgCount = messages.length
    messages.length = 0

                                                    # overall rate, not rate to this subscriber                         # spreads across all subscribers
    console.log "#{me} of #{subscribers}, global:[first: #{first}, seq: #{seq}, #{perSecond} msg/s], local:[newLocalMessageCount: #{msgCount}]"

), 1000




