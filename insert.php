<?php
include 'connection/connect.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Assuming your form fields are named appropriately
    $name = filter_var($_POST['name'], FILTER_SANITIZE_STRING);
    $section = filter_var($_POST['section'], FILTER_SANITIZE_STRING);
    $department = filter_var($_POST['department'], FILTER_SANITIZE_STRING);
    $course = filter_var($_POST['course'], FILTER_SANITIZE_STRING);
    $professor = filter_var($_POST['professor'], FILTER_SANITIZE_STRING);

    // Generate a 2-character UID (one number and one letter)
    $uid = generateRandomUid();

    // Get the current date
    $date = date("Y-m-d");

    // Your SQL query to insert data
    $query = "INSERT INTO fillup (name, section, department, course, professor,date,uid,status) VALUES (?, ?, ?, ?, ?, ?, ?,?)";
    $stmt = $conn->prepare($query);
    $stmt->execute([$name, $section, $department, $course, $professor, $date, $uid,"pending"]);

    echo "Appointment created successfully.";

    header("Location: display.php");
}

// Function to generate a 2-character UID (one number and one letter)
function generateRandomUid() {
    $characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $randomUid = $characters[rand(0, 9)] . $characters[rand(10, 35)];
    return $randomUid;
}
?>
