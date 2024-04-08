
async function checkLogin() {
    try {
          const response = await fetch(mySecrets().api + "/check_login", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': mySecrets().secret
            },
            body: JSON.stringify({
              idToken: sessionStorage.getItem("idToken"),
            })
        });

       
        const data = await response.json();
        console.log(data)

        if (!data.status) {

          sessionStorage.clear();
          // Redirect to login page if not authenticated
          window.location.href = "/admin/login.php";
        }

     
    } catch (error) {
        console.error('There was a problem with the fetch operation:', error);
    }

  }

checkLogin();