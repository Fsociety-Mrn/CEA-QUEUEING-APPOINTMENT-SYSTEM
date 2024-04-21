
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Admin</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="admin/vendors/feather/feather.css">
  <link rel="stylesheet" href="admin/vendors/ti-icons/css/themify-icons.css">
  <link rel="stylesheet" href="admin/vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="admin/css/vertical-layout-light/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="admin/images/favicon.png" />
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <h1>Admin</h1>
              </div>
             <!-- Login Form  -->
              <h6 class="font-weight-light">Sign in to continue.</h6>
        
                <div class="form-group">
                 <input type="text" name="username" class="form-control form-control-lg" id="username" placeholder="Username" required>
                </div>

                <div class="form-group">
                  <input type="password" name="password" class="form-control form-control-lg" id="password" placeholder="Password" required>
              
                  <input type="checkbox" id="showPasswordCheckbox" onclick="togglePasswordVisibility()">
                  <label for="showPasswordCheckbox">Show Password</label>
                </div>

                <div class="mt-3">
                  <button type="submit" onclick="handleLoginForm()" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn">SIGN IN</button>
                </div>
 
   


            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="admin/vendors/js/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page -->
  <!-- End plugin js for this page -->
  <!-- inject:js -->

  <script src="admin/js/off-canvas.js"></script>
  <script src="admin/js/hoverable-collapse.js"></script>
  <script src="admin/js/template.js"></script>
  <script src="admin/js/settings.js"></script>
  <script src="admin/js/todolist.js"></script>
  <!-- endinject -->

  <script src="./EnvSecret.js"></script>
  <script>

function togglePasswordVisibility() {
    var passwordField = document.getElementById("password");
    var checkbox = document.getElementById("showPasswordCheckbox");
    if (checkbox.checked) {
        passwordField.type = "text";
    } else {
        passwordField.type = "password";
    }
}


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

        if (data.status) {


          // Redirect to login page if not authenticated
          window.location.href = "/admin/admin/index.html";
        }else{
          sessionStorage.clear();
        }
     
    } catch (error) {
        console.error('There was a problem with the fetch operation:', error);
    }

    }

    async function handleLoginForm() {
      sessionStorage.clear();
      var username = document.getElementById("username").value;
      var password = document.getElementById("password").value;

      console.log(username,password)

      if (username === "" && password === ""){
        alert("Uh-oh! 😔 Please provide your username and password.");
        return
      }
      if(username === "" || password === ""){
        alert("Uh-oh! 😔 Please provide your username or password.");
        return
      }

        try {
          const response = await fetch(mySecrets().api + "/login_as_admin", {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': mySecrets().secret
            },
            body: JSON.stringify({
                username: username,
                password: password
            })
        });

       
        const data = await response.json();
        console.log(data)

        if (data['login status']) {

            // await checkLogin(data['idToken'])
            sessionStorage.setItem("idToken",data['idToken'])
            sessionStorage.setItem("userID",data.data[0])
            sessionStorage.setItem("cardUID",data.data[1])
            sessionStorage.setItem("username",data.data[2])
            sessionStorage.setItem("name",data.data[3])
            window.location.href = '/admin/admin'; // Redirect to dashboard
        } else {
            alert("Oops! 😔 Please check your username or password and try again.")
            document.getElementById('message').textContent = data.message;
        }
     
        } catch (error) {
          console.error('There was a problem with the fetch operation:', error);
        }  

    }


    checkLogin()

</script>


</body>

</html>
