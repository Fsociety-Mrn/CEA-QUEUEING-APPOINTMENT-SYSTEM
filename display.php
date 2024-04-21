<?php
include 'connection/connect.php';

// Example PDO code to fetch the latest UID from the database
$sql = "SELECT uid FROM fillup ORDER BY id DESC LIMIT 1";
$result = $conn->query($sql);

$latestUid = "";
if ($result->rowCount() > 0) {
    $row = $result->fetch(PDO::FETCH_ASSOC);
    $latestUid = $row['uid'];
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/Display.css">
    <title>Home</title>
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

<div class="container">
    <div class="container1">
        <div class="box">
            <h6 style="font-size: larger;">Your appointment is being processed.</h6>
            <h1 style="text-align: center;"><?php echo $latestUid; ?></h1>
            <h2>Your Queue Number is </h2><br><br><br>
            <h6 id="countdown" style="font-size: larger;">This message will disappear in <span style="color: red;"></span> seconds</h6>
        </div>
    </div>
    <footer class="footer"></footer>
</div>

<script>
    let countdown = 5;

    function updateCountdown() {
        document.getElementById('countdown').innerHTML = `This message will disappear in <span style="color: red;">${countdown}</span> seconds`;
        countdown--;

        if (countdown < 0) {
            window.location.href = 'pending.php'; // Redirect to pending.php after countdown
        } else {
            setTimeout(updateCountdown, 1000); // Update countdown every 1 second
        }
    }

    // Start the countdown when the page loads
    document.addEventListener('DOMContentLoaded', function () {
        updateCountdown();
    });
</script>

</body>
</html>