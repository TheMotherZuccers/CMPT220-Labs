<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Style-Type" content="text/css"/>
    <title>iprints.php</title>
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

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $num = $_POST['num'];

    $fname = $_POST['fname'];

    $lname = $_POST['lname'];

    $err = '';

    if (!valid_number($num))
        $err .= ' number';
    if (!valid_name($fname))
        $err .= ' first name';
    if (!valid_name($lname))
        $err .= ' last name';

    if (empty($err)) {
        $result = insert_record($dbc, $num, $fname, $lname);
    } else {
        echo '<p style="color:red;font-size:16px;">Error! Invalid' . $err . '.</p>';
    }
}

# Show the records
show_records($dbc);

# Close the connection
mysqli_close($dbc);
?>

<!-- Get inputs from the user. -->
<form action="vipresidents.php" method="POST">
    <table>
        <tr>
            <td>Number:</td>
            <td><input type="text" name="num"></td>
        </tr>
        <tr>
            <td>First name:</td>
            <td><input type="text" name="fname"></td>
        </tr>
        <tr>
            <td>Last name:</td>
            <td><input type="text" name="lname"></td>
        </tr>
    </table>
    <p><input type="submit"></p>
</form>
</html>
</body>
</html>