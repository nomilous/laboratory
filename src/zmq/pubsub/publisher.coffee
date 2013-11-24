zmq  = require 'zmq'
sock = zmq.socket 'push'

sock.bindSync 'tcp://127.0.0.1:3000'

seq = 0

# sock.send seq++ while true 


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

