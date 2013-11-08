describe 'root context', -> 

    #console.log @

    beforeEach -> console.log beforeEach: 1

    context 'outer context', -> 

        beforeEach -> console.log beforeEach: 2

        context 'inner context', -> 

            beforeEach -> console.log beforeEach: 3

            it 'catch the timeout', (done) -> 

                console.log "Starting test '#{@test.title}'"
                console.log "--> Parent beforeEach", @test.parent._beforeEach
                console.log "-->"
                process.stdout.write "Tree: "

                parent = @test.parent

                while parent?

                    if parent.title isnt '' then process.stdout.write "#{parent.title}"

                    parent = parent.parent
                    try if parent.title isnt '' then process.stdout.write " <-- "
                    else console.log()



                originalOnTimeout = @test.timer._onTimeout
                @test.timer._onTimeout = => 

                    console.log "--> Got timeout in test: '#{@test.title}'"
                    console.log '--> pend the end trigger a further 2 seconds'
                    setTimeout (=> originalOnTimeout.call @), 2000
