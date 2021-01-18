$( document ).ready( function() {
        $( '.check_all' ).click( function() {
          $( '.ab' ).prop( 'checked', this.checked );
		  $( '.check_all' ).prop( 'checked', this.checked );
        } );
} );