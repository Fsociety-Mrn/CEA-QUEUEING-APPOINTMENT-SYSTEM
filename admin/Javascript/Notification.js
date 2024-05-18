window.onload = async function() {
  const getName = sessionStorage.getItem("name");
  
  // Uncomment the line below to verify if the value is retrieved correctly
  // console.log(getName);
  
  if (getName) {
      try {
          // Perform the "fillup" appointment action
          await appointment("fillup", String(getName), "pending", "");
          
          // Perform the "proceed" appointment action
          await appointment("proceed", String(getName), "accept", "proceed");
          
          // Perform the "proceed" appointment action
          await appointment("proceed", String(getName), "reject", "reject");
      } catch (error) {
          console.error("An error occurred during appointment actions:", error);
      }
  } else {
      console.error("No value found for 'name' in sessionStorage.");
  }
};




async function appointment(tableName,name,dataTable,type){

    try {
        const response = await fetch(mySecrets().api + "/show_appointment", {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
              'Authorization': mySecrets().secret
          },
          body: JSON.stringify({
            table: tableName,
            name: name
          })
      });

     
      const data = await response.json();
  
      renderTableData(data,dataTable,type);
   
    } catch (error) {
      console.error('There was a problem with the fetch operation:', error);
    }
}

// GET TOTAL STUDENTS PER DAY 
async function getTotal(getName,type){

    try {
        const response = await fetch(mySecrets().api + "/show_appointment", {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
              'Authorization': mySecrets().secret
          },
          body: JSON.stringify({
            table: "proceed",
            name: getName
          })
      });

     
      const data = await response.json();


        // Get the current date
        const currentDate = new Date().toISOString().slice(0, 10);

        return data.filter(data=>data.status === type && new Date(data.date).toISOString().slice(0, 10) === currentDate).length
  
    } catch (error) {
      console.error('There was a problem with the fetch operation:', error);
      return 0;
    }
}

// GET TOTAL STUDENTS PER DAY 
async function getAllAppointment(getName){

    try {
        const response = await fetch(mySecrets().api + "/show_appointment", {
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
              'Authorization': mySecrets().secret
          },
          body: JSON.stringify({
            table: "proceed",
            name: getName
          })
      });

     
      const data = await response.json();

      return data;

    } catch (error) {
      console.error('There was a problem with the fetch operation:', error);
      return 0;
    }
}


    // Function to convert the database date format to a comparable format (YYYY-MM-DD)
    const convertDateFormat = dateString => {
      const dateObj = new Date(dateString);
      const year = dateObj.getFullYear();
      const month = String(dateObj.getMonth() + 1).padStart(2, '0'); // Month is zero-based
      const day = String(dateObj.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    };

// Function to render data into the table
function renderTableData(data,tableName,type) {
    const tableBody = document.getElementById(tableName).querySelector('tbody');
    tableBody.innerHTML = ''
    if (tableName === "pending"){

    
        // Loop through the fetched data and populate the table
        data.forEach(appointment => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${appointment.uid}</td>
                <td>${appointment.name}</td>
                <td>${appointment.section}</td>
                <td>${appointment.department}</td>
                <td>
                    <button class="btn btn-success btn-sm" onclick="acceptAppointment('${appointment.id}', '${appointment.uid}');">✔</button>
                    <button class="btn btn-danger btn-sm" onclick="rejectAppointment('${appointment.id}', '${appointment.uid}');">✘</button>
                </td>
            `;
            tableBody.appendChild(row);
        });

        return
    }

    console.log(data)
    // Loop through the fetched data and populate the table
    data.filter(data=>data.status === type).forEach(appointment => {
        const row = document.createElement('tr');
        row.innerHTML = `
            <td>${appointment.uid}</td>
            <td>${appointment.name}</td>
            <td>${appointment.section}</td>
            <td>${appointment.department}</td>
        `;
        tableBody.appendChild(row);
    });    

}

// update appointment
async function update_appointment(status,id_value,uid_value){

    try {
        const response = await fetch(mySecrets().api + "/update_appointment", {
          method: 'PUT',
          headers: {
              'Content-Type': 'application/json',
              'Authorization': mySecrets().secret
          },
          body: JSON.stringify({
            status: status,
            id_value: id_value,
            uid_value: uid_value,
          })
      });

      if(response.ok){
        const data = await response.json();
        console.log(data)
        location.reload()
      }

   
    } catch (error) {
      console.error('There was a problem with the fetch operation:', error);
    }
}

// Function to handle accepting an appointment
async function acceptAppointment(id, uid) {
    update_appointment("proceed",id,uid);
}

// Function to handle rejecting an appointment
async function rejectAppointment(id, uid) {
    update_appointment("reject",id,uid);
}