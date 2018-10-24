<?php
$debug = true;

# Shows the records in prints
function show_records($dbc) {
    # Create a query to get the name and price sorted by price
    $query = 'SELECT num, fname, lname FROM presidents ORDER BY num DESC';

    # Execute the query
    $results = mysqli_query($dbc, $query);
    check_results($results);

    # Show results
    if ($results) {
        # But...wait until we know the query succeeded before
        # starting the table.
        echo '<H1>Dead Presidents</H1>';
        echo '<TABLE border="1">';
        echo '<TR>';
        echo '<TH>Num</TH>';
        echo '<TH>Firstname</TH>';
        echo '<th>Lastname</th>';
        echo '</TR>';

        # For each row result, generate a table row
        while ($row = mysqli_fetch_array($results, MYSQLI_ASSOC)) {
            echo '<TR>';
            echo '<TD>' . $row['num'] . '</TD>';
            echo '<TD>' . $row['fname'] . '</TD>';
            echo '<TD>' . $row['lname'] . '</TD>';
            echo '</TR>';
        }

        # End the table
        echo '</TABLE>';

        # Free up the results in memory
        mysqli_free_result($results);
    } else {
        # If we get here, something has gone wrong
        echo '<p>' . mysqli_error($dbc) . '</p>';
    }
}

# Inserts a record into the prints table
function insert_record($dbc, $num, $fname, $lname) {
    $query = 'INSERT INTO presidents(num, fname, lname) VALUES ("' . $num . '" , "' . $fname . '", "' . $lname . '" )';
    show_query($query);

    $results = mysqli_query($dbc, $query);
    check_results($results);

    return $results;
}

# Shows the query as a debugging aid
function show_query($query) {
    global $debug;

    if ($debug)
        echo "<p>Query = $query</p>";
}

# Checks the query results as a debugging aid
function check_results($results) {
    global $dbc;

    if ($results != true)
        echo '<p>SQL ERROR = ' . mysqli_error($dbc) . '</p>';
}

function valid_number($num) {
    if (empty($num) || !is_numeric($num)) {
        return false;
    } else {
        $num = intval($num);
        if ($num <= 0)
            return false;
    }
    return true;
}


function valid_name($name) {
    return !empty ($name);
//    if (!empty ($name)) {
//        return true;
//    } else {
//        return false;
//    }
}

?>