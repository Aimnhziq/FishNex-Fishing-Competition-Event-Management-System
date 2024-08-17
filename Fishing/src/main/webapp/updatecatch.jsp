<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Catch</title>

<!-- Box icons -->
<link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="header.css" rel="stylesheet">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>

<div class="container">
  <button class="back-button" onclick="goBack()">Back</button>
  <h2>Update Catch</h2>
  <form action="updatecatchcontroller" method="post" onsubmit="return submitForm()">
    <div class="form-group">
      <label for="CustID">Participant ID: <c:out value="${c.custID}"/></label>
    </div>
    <div class="form-group">
      <label for="CustName">Cust Name: <c:out value="${c.custName}"/></label>
    </div>
    <div class="form-group">
      <label for="catchName">Catch Name: <c:out value="${c.catchName}"/></label>
    </div>
    <div class="form-group">
      <label for="catchWeight">Catch Weight in kg :</label>
      <input type="text" id="CatchWeight" name="CatchWeight" value="<c:out value="${c.catchWeight}"/>" required>
    </div>
    <div class="form-group">
      <label for="CatchLength">Catch Length in cm :</label>
      <input type="text" id="CatchLength" name="CatchLength" value="<c:out value="${c.catchLength}"/>" required>
    </div>
    <input type="hidden" id="CatchID" name="CatchID" value="<c:out value="${c.catchID}"/>" required><br><br>
    <input type="hidden" id="EventID" name="EventID" value="<%= request.getParameter("EventID") %>">
    <button class="submit" type="submit" class="btn">Update</button><br>
    <button class="reset" type="reset" class="btn">Reset</button>
  </form>
</div>

<!-- Bootstrap Modal -->
<div class="modal fade" id="updateCatchModal" tabindex="-1" aria-labelledby="updateCatchModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="updateCatchModalLabel">Update Success</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Catch has been successfully updated!
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
function goBack() {
  window.history.back();
}

function submitForm() {
  // Prevent form submission for showing modal
  var myModal = new bootstrap.Modal(document.getElementById('updateCatchModal'));
  myModal.show();

  // Simulate form submission after showing the modal
  setTimeout(function() {
    document.querySelector("form").submit();
  }, 5000); // 2 seconds delay
}
</script>

</body>
<style>
.container {
  color: var(--text-color);
  max-width: 600px;
  margin: 50px auto;
  margin-top: 100px;
  padding: 20px;
  border: 1px solid #ccc;
  background: linear-gradient(90deg, var(--other-color), var(--other-color));
  border-radius: 50px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
  color: var(--text-color);
  text-align: center;
  margin-bottom: 20px;
}

.form-group {
  margin-bottom: 20px;
}

label {
  display: block;
  font-weight: bold;
}

input[type="text"],
input[type="number"] {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

.submit {
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  color: #fff;
  background-color: #007bff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.submit:hover {
  background-color: #0056b3;
}

.reset {
  display: block;
  width: 100%;
  padding: 10px;
  font-size: 16px;
  color: #fff;
  background-color: #ff000097;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.reset:hover {
  background-color: #ff0000b3;
}

.back-button {
  display: inline-block;
  margin-bottom: 20px;
  padding: 10px 20px;
  font-size: 16px;
  color: #fff;
  background-color: #6c757d;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  text-align: center;
  text-decoration: none;
  transition: background-color 0.3s ease;
}

.back-button:hover {
  background-color: #5a6268;
}
</style>
</html>
