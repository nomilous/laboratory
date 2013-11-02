inline = require '../../lib/mocha/inline'

describe 'inline', -> 


    it 'runs a coffee spec inline ("programatically")', (done) -> 
        
        inline __dirname + '/a_spec.js'

