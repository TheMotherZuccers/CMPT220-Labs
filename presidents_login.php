
<!--
This PHP script front-ends linkyprints.php with a login page.
Originally created By Ron Coleman.
Revision history:
Who	Date		Comment
RC  07-Nov-13   Created.
-->
<!DOCTYPE html>
<html>
<?php
# Connect to MySQL server and the database
require('./connect_db.php') ;

# Connect to MySQL server and the database
require('./presidents_login_tools.php') ;

if ($_SERVER[ 'REQUEST_METHOD' ] == 'POST') {

    $name = $_POST['name'] ;

    $pid = validate($name) ;

    if($pid == -1)
        echo '<P style=color:red>Login failed please try again.</P>' ;

    else
        load('linkypresidents.php', $pid);
}
?>
<!-- Get inputs from the user. -->
<h1>Prints login</h1>
<form action="presidents_login.php" method="POST">
    <table>
        <tr>
            <td>Name:</td><td><input type="text" name="name"></td>
        </tr>
    </table>
    <p><input type="submit" ></p>
</form>
</html>