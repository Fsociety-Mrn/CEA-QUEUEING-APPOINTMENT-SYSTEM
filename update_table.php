<?php
// Include database connection
include './connect.php';

      // Get the current date in the format YYYY-MM-DD
      $currentDate = date("Y-m-d");

// Example PDO code to fetch data from the database and display it in the table
$sql = "SELECT uid, professor, name, course, section FROM fillup WHERE DATE(date) = :currentDate ORDER BY date DESC";
$result = $conn->prepare($sql);
$result->bindParam(':currentDate', $currentDate);
$result->execute();


if ($result->rowCount() > 0) {
    echo "<tr><th>ID</th><th>Professor</th><th>Student Name</th><th>Course</th><th>Section</th><th>Action</th></tr>";
    while($row = $result->fetch(PDO::FETCH_ASSOC)) {
        echo "<tr><td>" . $row["uid"] . "</td><td>" . $row["professor"] . "</td><td>" . $row["name"] . "</td><td>" . $row["course"] . "</td>";
        echo "<td> 
                <div class='containers_button_again'>" . $row["section"] . "</div>
            </td>";
        echo "<td>";
        echo "<div class='containers_button'>";
            echo "<button class='accept-btn' onclick=\"acceptAppointment('" . $row['uid'] . "','proceed')\">✔</button>"; // Pass uid to JavaScript function
            echo "<button class='reject-btn' onclick=\"acceptAppointment('" . $row['uid'] . "','reject')\">❌</button>"; // Pass uid to JavaScript function
        echo "</div>";
        echo "</td></tr>";
    }

}
?>

<script>


    function acceptAppointment(uid,status) {
       
        $.ajax({
        url: 'reject.php',
        type: 'POST',
        data: { uid: uid, status: status},
        success: function(response) {
            alert(response); // Alert the response from the PHP file
            location.reload(); // Reload the page
        },
        error: function() {
            alert('Failed to accept appointment.');
        }
    });
    }

    function rejectAppointment(uid) {
        alert("Rejected UID: " + uid);
        // You can add your logic here to handle rejecting the appointment


    }





</script>