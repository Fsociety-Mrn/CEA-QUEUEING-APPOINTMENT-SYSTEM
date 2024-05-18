<?php
// Include your database connection file
include 'connect.php';

// Get the UID from the POST request
if(isset($_POST['uid'])) {
    $uid = $_POST['uid'];
    
    // Fetch the appointment data from the fillup table based on UID
    $sqlSelect = "SELECT * FROM fillup WHERE uid = :uid";
    $stmtSelect = $conn->prepare($sqlSelect);
    $stmtSelect->bindParam(':uid', $uid, PDO::PARAM_INT);
    $stmtSelect->execute();
    $row = $stmtSelect->fetch(PDO::FETCH_ASSOC);

    if ($row) {
        // Insert the appointment data into the proceed table
        $sqlInsert = "INSERT INTO proceed (name, section, department, course, professor, date, uid, status) 
                      VALUES (:name, :section, :department, :course, :professor, :date, :uid, :status)";
        $stmtInsert = $conn->prepare($sqlInsert);
        $stmtInsert->bindParam(':name', $row['name'], PDO::PARAM_STR);
        $stmtInsert->bindParam(':section', $row['section'], PDO::PARAM_STR);
        $stmtInsert->bindParam(':department', $row['department'], PDO::PARAM_STR);
        $stmtInsert->bindParam(':course', $row['course'], PDO::PARAM_STR);
        $stmtInsert->bindParam(':professor', $row['professor'], PDO::PARAM_STR);
        $stmtInsert->bindParam(':date', $row['date'], PDO::PARAM_STR);
        $stmtInsert->bindParam(':uid', $row['uid'], PDO::PARAM_STR);
        $status = "proceed"; // Set the status to "proceed"
        $stmtInsert->bindParam(':status', $status, PDO::PARAM_STR);

        if ($stmtInsert->execute()) {
            // Delete the appointment from the fillup table
            $sqlDelete = "DELETE FROM fillup WHERE uid = :uid";
            $stmtDelete = $conn->prepare($sqlDelete);
            $stmtDelete->bindParam(':uid', $uid, PDO::PARAM_INT);
            $stmtDelete->execute();
            
            echo "Appointment accepted successfully.";
        } else {
            echo "Failed to accept appointment.";
        }
    } else {
        echo "Appointment not found.";
    }
} else {
    echo "Invalid request.";
}

// Close the database connection
$conn = null;
?>
