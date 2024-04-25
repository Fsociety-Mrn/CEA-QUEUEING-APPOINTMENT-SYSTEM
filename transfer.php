<?php
// Include your database connection file
include 'connection/connect.php';

// Fetch the top row from the fillup table
$sqlSelect = "SELECT * FROM fillup ORDER BY id ASC LIMIT 1";
$stmtSelect = $conn->prepare($sqlSelect);
$stmtSelect->execute();
$row = $stmtSelect->fetch(PDO::FETCH_ASSOC);

if ($row) {
    // Insert the data into the proceed table
    $sqlInsert = "INSERT INTO proceed (name, section, department, course, professor, date, uid,status) 
                  VALUES (:name, :section, :department, :course, :professor, :date, :uid, :status)";
    $stmtInsert = $conn->prepare($sqlInsert);
    $stmtInsert->bindParam(':name', $row['name'], PDO::PARAM_STR);
    $stmtInsert->bindParam(':section', $row['section'], PDO::PARAM_STR);
    $stmtInsert->bindParam(':department', $row['department'], PDO::PARAM_STR);
    $stmtInsert->bindParam(':course', $row['course'], PDO::PARAM_STR);
    $stmtInsert->bindParam(':professor', $row['professor'], PDO::PARAM_STR);
    $stmtInsert->bindParam(':date', $row['date'], PDO::PARAM_STR);
    $stmtInsert->bindParam(':uid', $row['uid'], PDO::PARAM_STR);
    $status = "reject"; // Set the status to "proceed"
    $stmtInsert->bindParam(':status', $status, PDO::PARAM_STR);

    if ($stmtInsert->execute()) {
        // Delete the row from the fillup table
        $sqlDelete = "DELETE FROM fillup WHERE id = :id";
        $stmtDelete = $conn->prepare($sqlDelete);
        $stmtDelete->bindParam(':id', $row['id'], PDO::PARAM_INT);
        $stmtDelete->execute();
    }
}

// Close the database connection
$conn = null;
?>
