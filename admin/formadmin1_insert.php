<?php 
require_once('connection.php');
if(isset($_POST['fname'])&&isset( $_POST['lname'])&&isset($_POST['id'])&& isset($_POST['action'])&& isset($_POST['pass'])){
	$fname=$_POST['fname'];
	$lastname=$_POST['lname'];
	$id=$_POST['id'];
	$o=$_POST['action'];
	$pass=$_POST['pass'];
	$date = date('d-m-y h:i:s');
	$sql="Select * from  employee_users where emp_id='$id'";
	$result=mysqli_query($conn,$sql);
	if(mysqli_num_rows($result)!=0){
		header("Location: input_wrong.html");
	}
else{
	$sql= mysqli_query($conn,"INSERT INTO employee(emp_id, first_name, last_name,type) VALUES ('$id','$fname','$lastname','$o')");	
	$sql= mysqli_query($conn,"INSERT INTO employee_users(emp_id,user, pass) VALUES ('$id','$id','$pass')");

	 if ($o=='intern'){
		$sql= mysqli_query($conn,"INSERT INTO intern(emp_id,start_date,Leaves_taken,Progress) VALUES ('$id','$date',0,0)");
		$sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (5000,'$id')");
		header("Location: formadmin1.html");
	}
	else  if ($o=='part_timer'){
		$sql= mysqli_query($conn,"INSERT INTO part_timer(emp_id,start_date,leaves_taken,Progress) VALUES ('$id','$date',0,0)");
		$sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (1000,'$id')");
		header("Location: formadmin1.html");
	}
	 else if ($o=='permanent'){
		 $sql= mysqli_query($conn,"INSERT INTO permanent(emp_id,start_date,leaves_taken,raise_progress) VALUES ('$id','$date',0,0)");
		 $sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (30000,'$id')");
		header("Location: formadmin1.html");
	}
}
}
	

	

?>