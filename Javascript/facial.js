

// get facial udpdate
async function getFacial_status() {
    try {
        const response = await fetch(mySecrets().api + "/get_Facial_login_status", {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': mySecrets().secret
            },
            // Optionally, include credentials such as cookies or authorization headers
            // credentials: 'include'
        });

        // Check if the response is successful (status code in the range 200-299)
        if (response.ok) {
            // Parse the response body as JSON
            const data = await response.json();
            console.log(data) ;

            // Update the content of the h1 element with the facial recognition status
            const facialStatusElement = document.getElementById('facialStatus');
            facialStatusElement.textContent = data.message;

            if(data.result) {
                stopInterval();
                alert(data.message);
                window.location.href = "login.html"
          
            }

        } else {
            // If response is not successful, throw an error
            throw new Error(`Error: ${response.status} ${response.statusText}`);
        }
    } catch (error) {
        // Handle any errors that occur during the fetch operation
        console.error('There was a problem with the fetch operation:', error);
        throw error; // Rethrow the error for further handling if needed
    }
}

getFacial_status();


// Function to stop the interval
function stopInterval() {
    clearInterval(intervalID);
}

// Get access to the camera and display the stream in the video element
window.onload = async function initCamera() {
    // Update facial recognition status periodically (every 5 seconds)
    intervalID = setInterval(getFacial_status, 1000);

    const videoElement = document.getElementById('videoElement');
    videoElement.src = mySecrets().api + "/video_feed?token=" + mySecrets().secret
}

// Stop the interval when the page is about to unload
window.addEventListener('beforeunload', stopInterval);