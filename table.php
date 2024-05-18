<?php include 'connect.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Display.css">
    <title>Pending</title>
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        .containers {
            display: flex;
            flex-direction: row; /* Make it row to place items side by side */
            justify-content: space-between;
        }
        .containers_button {
            display: flex;
            flex-direction: row; /* Make it row to place items side by side */
            justify-content: center;
        }

        .left-table,
        .right-table {
            width: 48%; /* Adjust the width as needed */
            background-color: white;
            border: 1px solid black;
            border-radius: 10px;
            padding: 20px;
            margin: 10px;
            height: 400px; /* Set a fixed height */
            overflow-y: auto; /* Add scrollbar when content overflows */
        }

        .left-table h2,
        .right-table h2 {
            text-align: center; /* Center the title */
            background: -webkit-linear-gradient(black, orange);
             -webkit-background-clip: text;
             -webkit-text-fill-color: transparent;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; 
        }
    </style>
</head>
<body>

<header class="header">
    <div class="header_photo1">
        <img class="CEATlogo" src="images/ceat_logo.png" alt="">
    </div>
    <h3 style="color: white;">CEA QUEUEING APPOINTMENT SYSTEM</h3>
    <div class="header_photo2">
        <img class="RTUlogo" src="images/rtu_logo.png" alt="">
    </div>
</header>

<div class="containers">
    <div class="left-table">
        <!-- Left Table Content Goes Here -->
        <h2>Pending</h2>
        <?php
            // Example PDO code to fetch data from the database and display it in the table
            $sql = "SELECT uid, name, department, status FROM fillup ORDER BY date DESC";
            $result = $conn->query($sql);

            if ($result->rowCount() > 0) {
                echo "<table>";
                echo "<tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>";
                while($row = $result->fetch(PDO::FETCH_ASSOC)) {
                    echo "<tr>
                            <td>" . $row["uid"] . "</td>
                            <td>" . $row["name"] . "</td>
                            <td>" . $row["department"] . "</td>
                            <td>" . $row["status"] . "</td>
                            <td><button onclick=\"acceptAppointment('" . $row['uid'] . "')\">Accept</button> <button onclick=\"rejectAppointment('" . $row['uid'] . "')\">Reject</button></td>
                        </tr>";
                }
                echo "</table>";
            } else {
                echo "No Pending";
            }
        ?>
    </div>
    <div class="right-table">
        <!-- Right Table Content Goes Here -->
        <h2>Proceed Inside the Faculty</h2>
        <table id="proceed-table">
        <?php
            // Example PDO code to fetch data from the database and display it in the table
            $sql = "SELECT uid, name, department, status FROM proceed ORDER BY date DESC";
            $stmt = $conn->query($sql);

            if ($stmt->rowCount() > 0) {
                echo "<table>";
                echo "<tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>";
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                    echo "<tr>
                            <td>" . $row["uid"] . "</td>
                            <td>" . $row["name"] . "</td>
                            <td>" . $row["department"] . "</td>
                            <td>" . $row["status"] . "</td>
                            <td><button onclick=\"acceptAppointment('" . $row['uid'] . "')\">Accept</button> <button onclick=\"rejectAppointment('" . $row['uid'] . "')\">Reject</button></td>
                        </tr>";
                }
                echo "</table>";
            } else {
                echo "No Pending";
            }
        ?>
        </table>
    </div>
</div>

<div class="containers_button" style="text-align: center; margin-top: 20px; ">
    <div style="width: 200px;">
        <a href="/jegg">
            <button class="login100-form-btn">Back to the form</button>
        </a>
    </div>
</div>
<br>

<footer class="footer"></footer>

<script>
    function acceptAppointment(uid) {
        alert("Accepted UID: " + uid);
        // You can add your logic here to handle accepting the appointment
    }

    function rejectAppointment(uid) {
        alert("Rejected UID: " + uid);
        // You can add your logic here to handle rejecting the appointment
    }
</script>

</body>
</html>
