<!DOCTYPE html>
<html lang="en">
<head>
    <title>Appointment</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->    
    <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <!--===============================================================================================-->    
    <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
    <!--===============================================================================================-->    
    <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!--===============================================================================================-->
</head>
<audio id="successSound" style="display:none;">
  <source src="success.wav" type="audio/wav">
</audio>
<style>
     .table-container {
    margin-top: 20px; /* Add margin at the top */
    height: 200px; /* Set the desired height for the scrollable area */
    overflow-y: auto; /* Enable vertical scrolling */
    border: 1px solid #ddd; /* Add border for visual clarity */
}


.table-wrapper {
    width: 100%; /* Ensure table takes full width */
}

.professor-table {
    width: 100%;
    border-collapse: collapse;
    /* Remove margin-top: 20px; */
}

.professor-table th, .professor-table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.professor-table th {
    background-color: #f2f2f2;
}


    </style>
<body style="background-color: #666666;">
    
    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
            <form class="login100-form validate-form" method="post" action="insert.php" id="myForm">
                    <span class="login100-form-title p-b-40">
                        Fill up information
                    </span>
                    
                    
                    <div class="wrap-input100 validate-input" required>
                        <input class="input100" type="text" name="name">
                        <span class="focus-input100"></span>
                        <span class="label-input100">Name</span>
                    </div>
                    
                    
                    <div class="wrap-input100 validate-input" required>
                        <input class="input100" type="text" name="section">
                        <span class="focus-input100"></span>
                        <span class="label-input100">Section</span>
                    </div>

                    <div class="wrap-input100 validate-input" required>
                        <select class="input100" name="department">
                            <option value="">Choose Department</option>
                            <option value="CEA">CEA</option>
                            <option value="CBEA">CBEA</option>
                            <option value="CEAT">CEAT</option>
                            
                        </select>
                        <span class="focus-input100"></span>
                        <span class="label-input100">Department</span>
                    </div>

                    <div class="wrap-input100 validate-input" required>
                        <select class="input100" name="course">
                            <option value="">Choose Course</option>
                            <option value="BSCompEng">BS Computer Engineering</option>
                            <option value="BSElectrical">BS Electrical Engineer</option>
                            <option value="BSElectronics">BS Electronics Engineer</option>
                            
                        </select>
                        <span class="focus-input100"></span>
                        <span class="label-input100">Course</span>
                    </div>

                    <div class="wrap-input100 validate-input" required>
                        <!-- <input class="input100" type="text" name="professor">
                        <span class="focus-input100"></span>
                        <span class="label-input100">Professor</span> -->
                        <select class="input100" name="professor" id="professor">
                            <option>Choose Professor</option>
                            <option value="BSCompEng">Rizal Laqui</option>
                            <option value="BSElectrical">Ronel Paglomutan</option>
                            <option value="BSElectronics">Ezekiel Nequit</option>
                            
                        </select>

                        <span class="focus-input100"></span>
                        <span class="label-input100">Professor</span>
                    </div>
                    

                    
            
                    &nbsp;
                    <div class="container-login100-form-btn">
                        <button onclick="playSuccessSound();" class="login100-form-btn">
                            Proceed
                        </button>
                    </div>
                    
                    
                    <div class="table-container">
                    <div class="table-wrapper">
                    <table class="professor-table">
                        <thead>
                            <tr>
                                <th>Professor Name</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>

                        <?php
            // Include your database connection file
            include 'connection/connect.php';

            // Get the current date in the format YYYY-MM-DD
            $currentDateTime = date("Y-m-d");

            // Example PDO code to fetch data from the database and display it in the table
            $sql = "SELECT name FROM `$currentDateTime` WHERE available = :available";
            $stmt = $conn->prepare($sql);
            $stmt->bindValue(':available', true, PDO::PARAM_BOOL);
            $stmt->execute();

            if ($stmt->rowCount() > 0) {
                
                // echo "<table>";
                // echo "<tr>
                //     <th>ID</th>
                //     <th>Name</th>
                //     <th>Department</th>
                //     <th>Status</th>
                // </tr>";
                while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {

            

                echo "<tr>
                        <th>" . $row["name"] . "</th>
                        <th>In Office</th>
                    </tr>";
                }
    

        
            } else {
                echo "
                <tr>
                <th>No Professor</th>
                <th>Today</th>
            </tr>

                ";
            }
        ?>
<!-- 
                            <tr>
                                <th>Ronel Paglomutan</th>
                                <th>In Office</th>
                            </tr>
                            <tr>
                                <th>Ronel Paglomutan</th>
                                <th>In Office</th>
                            </tr>
                            <tr>
                                <th>Ronel Paglomutan</th>
                                <th>In Office</th>
                            </tr>
                            <tr>
                                <th>Ronel Paglomutan</th>
                                <th>In Office</th>
                            </tr> -->
                        </tbody>
                    </table>
                    </div>
                </div>
                </form>
                

                <div id="loading-overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(255, 255, 255, 0.7); text-align: center; padding-top: 20%;">
                    <div class="spinner-border text-primary" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                    <p>Loading...</p>
                </div>
                
                <div class="login100-more" style="background-image: url('images/bg.png');">
                    <img src="images/rtu_logo.png" alt="Your Logo" class="logo-above-bg">
                    <img src="images/ceat_logo.png" alt="Your Logo" class="logo1-above-bg">
                    <div class="header-container">
                        <h2>CEA QUEUEING APPOINTMENT SYSTEM</h2>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    

    
    
<!--===============================================================================================-->
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
    <script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
    <script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
    <script src="vendor/daterangepicker/moment.min.js"></script>
    <script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
    <script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script>

function playSuccessSound() {
  var audio = document.getElementById('successSound');
  audio.play();
}
</script>

    <script src="js/main.js"></script>
    <script src="./EnvSecret.js"></script>
    <script>
        // Set a timeout to redirect the page after 30 seconds of inactivity
        var redirectTimeout = setTimeout(function() {
            window.location.href = 'pending.php'; // Redirect to pending.php after 30 seconds
        }, 30000); // 30 seconds in milliseconds

        // Reset the timeout if there's any activity
        window.addEventListener('mousemove', resetTimer);
        window.addEventListener('mousedown', resetTimer);
        window.addEventListener('keypress', resetTimer);
        
        function resetTimer() {
            clearTimeout(redirectTimeout);
            redirectTimeout = setTimeout(function() {
                window.location.href = 'pending.php'; // Redirect to pending.php after 30 seconds
            }, 30000); // 30 seconds in milliseconds
        }
    </script>
    
    <script>
        $(document).ready(function(){
    $('#myForm').submit(function(event){
        event.preventDefault(); // Prevent form submission

        // Check if any input inside the form is empty or "Choose Professor" is selected
        var isEmpty = false;
        $(this).find('input, select').each(function(){
            if($(this).val() === '' || ($(this).is('select') && $(this).val() === 'Choose Professor')){
                isEmpty = true;
                return false; // Break out of the loop if any input is empty or "Choose Professor" is selected
            }
        });

        // If any input is empty or "Choose Professor" is selected, display an alert and don't proceed
        if(isEmpty){
            alert('Please fill in all fields.');
            return;
        }

        // Proceed with form submission after 3 seconds
        $('#loading-overlay').show();
        setTimeout(function(){
            
            $('#myForm').unbind('submit').submit();
            
        }, 3000);
    });
});

    </script>
    <script>


         // Function to render professor options
         function renderProfessorOptions(professorNames) {
            const selectElement = document.getElementById('professor');

             // Clear existing options
             selectElement.innerHTML = '';

         // Create default option
             const defaultOption = document.createElement('option');
             defaultOption.textContent = 'Choose Professor';
             selectElement.appendChild(defaultOption);

             // Create options for each professor name
             professorNames.forEach(name => {
                 const option = document.createElement('option');
                 option.value = name;
                option.textContent = name;
                 selectElement.appendChild(option);
            });
        }

        // Get access to the camera and display the stream in the video element
        window.onload = function getPornToday() {
            
			setTimeout(async function(){

 
            try {
                const response = await fetch(mySecrets().api + "/get_professor_today", {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json',
                        'Authorization': mySecrets().secret
                    },
                });

                // Check if the response is successful (status code in the range 200-299)
                if (response.ok) {
                    // Parse the response body as JSON
                    const data = await response.json();

                    console.log(data)
                    // Render the professor options
                    renderProfessorOptions(data) ;

                } else {
                    // If response is not successful, throw an error
                    throw new Error(`Error: ${response.status} ${response.statusText}`);
                }
            } catch (error) {
                // Handle any errors that occur during the fetch operation
                console.error('There was a problem with the fetch operation:', error);
                throw error; // Rethrow the error for further handling if needed
            }
		}, 1000);
        }


    </script>
</body>
</html>
