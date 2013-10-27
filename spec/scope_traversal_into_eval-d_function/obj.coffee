scopeVar = 1

module.exports.obj = 

    getVar: -> scopeVar

    $getVar: -> scopeVar
    $$getVar: -> scopeVar


module.exports.factory = -> 

    local =   

        scopeVar: 1
        create: -> 

            deeper = {}
            Object.defineProperty deeper, 'getVar', 
                get: -> -> local.scopeVar

