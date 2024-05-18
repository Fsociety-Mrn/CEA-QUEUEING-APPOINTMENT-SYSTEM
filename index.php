<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/Display.css">


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <title>Pending</title>
    <style>
        .table {
            width: 100%; /* Make the table take up the entire width */
            background-color: white;
            border: 1px solid black;
            border-radius: 10px;
            padding: 20px;
            margin: 10px;
            height: 50%; 
            overflow-y: auto; 
        }

        .table h2 {
            text-align: center; /* Center the title */
            background: -webkit-linear-gradient(black, orange);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        th, td {
         border: 1px solid black;
          padding: 10px;
          text-align: left;
             font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
             width: 30%; /* Adjust the width as needed */
             height: 50px; /* Adjust the height as needed */
        }
        .container-login100-form-btn {
            width: 100%;
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .login100-form-btn {
            display: -webkit-box;
            display: -webkit-flex;
            display: -moz-box;
            display: -ms-flexbox;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 0 20px;
            width: 100%;
            height: 50px;
            border-radius: 10px;
            background: #6675df;
            font-family: Montserrat-Bold;
            font-size: 12px;
            color: #fff;
            line-height: 1.2;
            text-transform: uppercase;
            letter-spacing: 1px;
            -webkit-transition: all 0.4s;
            -o-transition: all 0.4s;
            -moz-transition: all 0.4s;
            transition: all 0.4s;
        }
        .login100-form-btn:hover {
            background: #333333;
        }

  
        .accept-btn, .reject-btn {
            width: 50%;
            height: 30px;
            border-radius: 5px;
            font-size: 12px;
        }
        .accept-btn {
            background-color: green;
            color: white;
        }
        .reject-btn {
            background-color: #fff;
            color: white;
        }
        .containers_button {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center; /* Center items vertically */
            width: 100px;
            gap: 10px; 
        }
        .containers_button_again {
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center; /* Center items vertically */
            width: 120px;
            gap: 10px; 
        }
    </style>
</head>
<body>

<header class="header">
    <div class="header_photo1">
        <img class="CEATlogo" src="./images/ceat_logo.png" alt="">
    </div>
    <h3 style="color: white;">CEA QUEUEING APPOINTMENT SYSTEM</h3>
    <div class="header_photo2">
        <img class="RTUlogo" src="./images/rtu_logo.png" alt="">
    </div>
</header>

<div class="table">
    <!-- Table Content Goes Here -->
    <h2>APPOINTMENT</h2>

    <table id='fillup-table'>
    <tr><th>ID</th><th>Professor</th><th>Student Name</th><th>Course</th><th>Section</th><th>Action</th></tr>
    <?php
// Include your database connection file
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
            echo "<button class='accept-btn' onclick=\"acceptAppointment('" . $row['uid'] . "')\">✔</button>"; // Pass uid to JavaScript function
            echo "<button class='reject-btn' onclick=\"acceptAppointment('" . $row['uid'] . "')\">❌</button>"; // Pass uid to JavaScript function
        echo "</div>";
        echo "</td></tr>";
    }

} else {
    echo "No Pending";
}
?>
</table>

</div>




<footer class="footer"></footer>

<script src="./EnvSecret.js"></script>






</body>
<script>

// Function to update the table
function updateTable() {
    $.ajax({
        url: 'update_table.php', // URL of your PHP script to fetch updated data
        success: function(response) {
            console.log("running");
            $('#fillup-table').html(response);
        }
    });
}

// Update the table every second
setInterval(updateTable, 500);

function acceptAppointment(uid) {
        alert("Accepted UID: " + uid);
        // You can add your logic here to handle accepting the appointment
    }

    function rejectAppointment(uid) {
        alert("Rejected UID: " + uid);
        // You can add your logic here to handle rejecting the appointment
    }


    async function verify_rfid(rfid, name) {
            try {
                const response = await fetch(mySecrets().api + "/verify_rfid", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': mySecrets().secret
                    },
                    body: JSON.stringify({
                        name: name
                    })
                });

                if (response.ok) {
                    const data = await response.json();
                    alert(data + name + rfid);
                    location.reload();

                    // const NameElement = document.getElementById('name');
                    // const StatusElement = document.getElementById('status');
                    // NameElement.value = name;
                    // StatusElement.value = data.data;

                    // // Display notification
                    // const notification = document.getElementById('notification');
                    // notification.textContent = name + " is " + data.data;
                    // notification.style.display = 'block';

                    // Reload the page after a short delay
                    // setTimeout(() => {
                    //     location.reload();
                    // }, 3000);

                } else {
                    throw new Error(`Error: ${response.status} ${response.statusText}`);
                }
            } catch (error) {
                console.error('There was a problem with the fetch operation:', error);
                const notification = document.getElementById('notification');
                notification.textContent = 'Please Login before tap your RFID';
                notification.style.display = 'block';
                throw error;
            }
        }

// Function to fetch RFID data
async function get_RFID() {
    try {
        const response = await fetch(mySecrets().raspberry + "/get_rfid", {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        if (response.ok) {
            const data = await response.json();
            console.log(data);
            await verify_rfid(data.ID, data.TEXT);
        } else {
            throw new Error(`Error: ${response.status} ${response.statusText}`);
        }
    } catch (error) {
        console.error('There was a problem with the fetch operation:', error);
        location.reload();
        throw error;
    }
}

// Call get_RFID function
get_RFID();


async function get_IRsensor() {
    try {
        const response = await fetch(mySecrets().raspberry + "/IR_sensor", {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            },
        });

        if (response.ok) {
            const data = await response.json();
            console.log(data);
            if (data.status){
                location.href = "/admin/facial.html"
            }

        } else {
            throw new Error(`Error: ${response.status} ${response.statusText}`);
        }
    } catch (error) {
        console.error('There was a problem with the fetch operation:', error);

        throw error;
    }
}

setInterval(get_IRsensor, 1000);


</script>
</html>
