<?php include 'connection/connect.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Display.css">
    <title>Pending</title>
    <style>
        .containers {
            display: flex;
            flex-direction: row; /* Make it row to place items side by side */
            justify-content: space-between;
        }

        .left-table,
        .right-table {
            width: 48%; /* Adjust the width as needed */
            background-color: white;
            border: 1px solid black;
            border-radius: 10px;
            padding: 20px;
            margin: 10px;
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
            // Include your database connection file
            include 'connection/connect.php';

            // Get the current date in the format YYYY-MM-DD
            $currentDate = date("Y-m-d");

            // Example PDO code to fetch data from the database and display it in the table
            $sql = "SELECT uid, name, department, status FROM fillup WHERE DATE(date) = :currentDate";
            $result = $conn->prepare($sql);
            $result->bindParam(':currentDate', $currentDate);
            $result->execute();


            if ($result->rowCount() > 0) {
                echo "<table>";
                echo "<tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Department</th>
                        <th>Status</th>
                    </tr>";
                while($row = $result->fetch(PDO::FETCH_ASSOC)) {
                    echo "<tr><td>" . $row["uid"] . "</td><td>" . $row["name"] . "</td><td>" . $row["department"] . "</td><td>" . $row["status"] . "</td></tr>";
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
            // Include your database connection file
            include 'connection/connect.php';

            // Get the current date in the format YYYY-MM-DD
            $currentDate = date("Y-m-d");

            // Example PDO code to fetch data from the database and display it in the table
            $sql = "SELECT uid, name, department, status FROM proceed WHERE DATE(date) = :currentDate";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':currentDate', $currentDate);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                echo "<table>";
                echo "<tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Status</th>
                </tr>";
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                echo "<tr>
                        <td>" . $row["uid"] . "</td>
                        <td>" . $row["name"] . "</td>
                        <td>" . $row["department"] . "</td>
                        <td>" . $row["status"] . "</td>
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

<footer class="footer"></footer>

<script>
    setTimeout(function() {
        // Move data from fillup to proceed table using AJAX
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                // Update the proceed table content
                document.getElementById('proceed-table').innerHTML = xhr.responseText;
            }
        };
        xhr.open('GET', 'transfer.php', true);
        xhr.send();
    }, 300000); // 5 minutes in milliseconds

    setTimeout(function() {
        location.reload();
    }, 5000); // 2 minutes in milliseconds
</script>

</body>
</html>