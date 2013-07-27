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
