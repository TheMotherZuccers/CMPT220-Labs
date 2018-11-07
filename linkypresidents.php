<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <title>linky</title>
    <link href="/library/skin/tool_base.css" type="text/css" rel="stylesheet" media="all"/>
    <link href="/library/skin/morpheus-default/tool.css" type="text/css" rel="stylesheet" media="all"/>
    <script type="text/javascript" src="/library/js/headscripts.js"></script>
    <style>body {
            padding: 5px !important;
        }</style>
</head>
<body>
<!--
This PHP script was modified based on result.php in McGrath (2012).
It demonstrates how to ...
  1) Connect to MySQL.
  2) Write a complex query.
  3) Format the results into an HTML table.
  4) Update MySQL with form input.
By Ron Coleman
-->
<!DOCTYPE html>
<html>
<?php
# Connect to MySQL server and the database
require('connect_db.php');
# Includes these helper functions
require('helpers.php');

# If user opened the page without submitting, initialize the fields
if ( $_SERVER[ 'REQUEST_METHOD' ] == 'GET' ) {
    if(isset($_GET['id'])) {
        show_record($dbc, $_GET['id']);
    }
}

# Otherwise, user submitted the form, so let's validate
else if ( $_SERVER[ 'REQUEST_METHOD' ] == 'POST' )
{
    # Initialize an error array.
    $errors = array();

    $num = $_POST[ 'num' ] ;
    $fname = $_POST[ 'fname' ] ;
    $lname = $_POST[ 'lname' ] ;

    # Check for a name & email address.
    if ( empty( $num ) )  {
        $errors[] = 'num' ;
    }
    else {
        $num = trim( $num )  ;
    }

    if ( empty( $_POST[ 'fname' ] ) ) {
        $errors[] = 'fname' ;
    }
    else {
        $fname = trim( $fname )  ;
    }

    if ( empty( $_POST[ 'lname' ] ) ) {
        $errors[] = 'lname' ;
    }
    else {
        $lname = trim( $lname )  ;
    }

    # Report result.
    if( !empty( $errors ) )
    {
        echo 'Error! Please enter your  ' ;
        foreach ( $errors as $field ) { echo " - $field " ; }
    }
    else {
        echo "<p>Success! Thanks $num </p>" ;
        insert_record($dbc, $num, $fname, $lname);
    }

}


if (empty($num)) {
    $num = "";
    $fname = "";
    $lname = "";
}

# Show the records
show_link_records($dbc);

show_form($num,$fname,$lname);

# Shows the input form
function show_form($num,$fname,$lname) {
    echo '<form action="linkypresidents.php" method="POST">' ;
    echo '<p>Number: <input type="text" name="num" value="' . $num . '"> </p> ' ;
    echo '<p>First Name: <input type="text" name="fname" value="' . $fname . '"></p>' ;
    echo '<p>Last Name: <input type="text" name="lname" value="' . $lname . '"></p>' ;
    echo '<p><input type="submit"></p>' ;
    echo '</form>' ;
}

# Close the connection
mysqli_close($dbc);
?>
</html>