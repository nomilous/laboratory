require('nez').realize 'JisonHowTo', (JisonHowTo, test, context, jison, should) -> 

    #
    # run ./objective (repo root), and touch this file
    #

    context 'it', (has) -> 

        has 'a whole bunch of stuff', (done) -> 

            # 
            # console.log jison
            # 
            # { Jison: [Circular],
            # version: '0.4.6',
            # print: [Function],
            # LR0Generator: { [Function] mix: [Function: typal_mix] },
            # LALRGenerator: { [Function] mix: [Function: typal_mix] },
            # SLRGenerator: { [Function] mix: [Function: typal_mix] },
            # LR1Generator: { [Function] mix: [Function: typal_mix] },
            # LLGenerator: { [Function] mix: [Function: typal_mix] },
            # Generator: [Function: Jison_Generator],
            # Parser: [Function: Parser] }
            # 
            # 

            test done

        has 'a parser', (that) -> 

            that 'requires at least one grammar rule', (done) -> 

                try

                    parser = new jison.Parser {}

                catch error

                    error.should.match /Grammar error: must have at least one rule/
                    test done

    context 'parser', (can) -> 

        parser = new jison.Parser 

            lex:
                rules: [
                    ["\\s+",        "/* skip whitespace */"]
                    ["[a-f0-9]+",   "return 'HEX';"]
                ]

            bnf: 
                hex_strings: ["hex_strings HEX", "HEX"]

        can 'idetify hex', (done) -> 

            parser.parse("adcdef34bc e82a").should.equal true
            test done

        can 'do what i need?', (done) ->  

            throw 'hard to tell'
            test done


