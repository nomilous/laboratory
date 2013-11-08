



describe('a spec', function() {

    it('fails a test', function() {

        this.timeout(3000);
        throw new Error()

    });

    it('fails another test', function() {

        throw new Error()

    });

})