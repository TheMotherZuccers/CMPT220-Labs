<?php 
# CONNECT TO MySQL DATABASE.


# Connect  on 'localhost' for user 'mike' with password 'easysteps' to database 'site_db'.

# Otherwise fail gracefully and explain the error. 

$dbc = @mysqli_connect ( '127.0.0.1:3307', 'limbodb', 'limbodbPass', 'site_db' )


OR die ( mysqli_connect_error() ) ;


# Set encoding to match PHP script encoding.

mysqli_set_charset( $dbc, 'utf8' ) ; ?>