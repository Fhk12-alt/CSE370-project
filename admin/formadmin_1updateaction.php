<?php 
require_once('connection.php');
if(isset($_POST['fname'])&&isset($_POST['lname'])&&isset($_POST['id'])&& isset($_POST['action'])){
	$fname=$_POST['fname'];
	$lastname=$_POST['lname'];
	$id=$_POST['id'];
	$o=$_POST['action'];
	$date = date('d-m-y h:i:s');
	$sql="Select * from  employee_users where emp_id='$id'";
	$result=mysqli_query($conn,$sql);
	if(mysqli_num_rows($result)==0){
		header("Location: input_wrong.html");
	}
	else{
	 if ($o=='intern'){
		$query = "SELECT type FROM employee WHERE emp_id='$id'";
		$result = mysqli_query($conn, $query);
		$row = mysqli_fetch_array($result);
		$type = (string) $row['type'];
		 if ($type=='intern'){
		 $sql= mysqli_query($conn,"UPDATE employee SET first_name='$fname',last_name='$lastname' WHERE emp_id='$id'");
		header("Location: formadmin1.html");
		 }
		 else{
			 $sql= mysqli_query($conn,"UPDATE employee SET first_name='$fname',last_name='$lastname',type='$o' WHERE emp_id='$id'");
			 $sql= mysqli_query($conn,"INSERT INTO intern(emp_id,start_date,Leaves_taken,Progress) VALUES ('$id','$date',0,0)");
			 
			 $delete_query = "DELETE FROM $type WHERE emp_id='$id'";
    $sql = mysqli_query($conn, $delete_query);
	$delete_query = "DELETE FROM allowance WHERE emp_id='$id'";
			 $sql = mysqli_query($conn, $delete_query);
			 if ($o=='part_time'){
			 $sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (1000,'$id')");
			 }
			 else{$sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (30000,'$id')");
			 }
		header("Location: formadmin1.html");
			 
		 }
	}
	else  if ($o=='part_timer'){
		$query = "SELECT type FROM employee WHERE emp_id='$id'";
		$result = mysqli_query($conn, $query);
		$row = mysqli_fetch_array($result);
		$type = (string) $row['type'];
		 if ($type=='part_timer'){
		 $sql= mysqli_query($conn,"UPDATE employee SET first_name='$fname',last_name='$lastname' WHERE emp_id='$id'");
		header("Location: formadmin1.html");
		 }
		 else{
			 $sql= mysqli_query($conn,"UPDATE employee SET first_name='$fname',last_name='$lastname',type='$o' WHERE emp_id='$id'");
			 $sql= mysqli_query($conn,"INSERT INTO part_timer(emp_id,start_date,Leaves_taken,Progress) VALUES ('$id','$date',0,0)");
			 
			 $delete_query = "DELETE FROM $type WHERE emp_id='$id'";
			 
    $sql = mysqli_query($conn, $delete_query);
	$delete_query = "DELETE FROM allowance WHERE emp_id='$id'";
			 $sql = mysqli_query($conn, $delete_query);
			 if ($o=='intern'){
			 $sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (5000,'$id')");
			 }
			 else{$sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (30000,'$id')");
			 }
		header("Location: formadmin1.html");
			 
		 }
	}
	 else if ($o=='permanent'){
		$query = "SELECT type FROM employee WHERE emp_id='$id'";
		$result = mysqli_query($conn, $query);
		$row = mysqli_fetch_array($result);
		$type = (string) $row['type'];
		 if ($type=='permanent'){
		 $sql= mysqli_query($conn,"UPDATE employee SET first_name='$fname',last_name='$lastname' WHERE emp_id='$id'");
		header("Location: formadmin1.html");
		 }
		 else{
			 $sql= mysqli_query($conn,"UPDATE employee SET first_name='$fname',last_name='$lastname',type='$o' WHERE emp_id='$id'");
			 $sql= mysqli_query($conn,"INSERT INTO permanent(emp_id,start_date,Leaves_taken,Progress) VALUES ('$id','$date',0,0)");
			
			 $delete_query = "DELETE FROM $type WHERE emp_id='$id'";
			 $sql = mysqli_query($conn, $delete_query);
			 $delete_query = "DELETE FROM allowance WHERE emp_id='$id'";
			 $sql = mysqli_query($conn, $delete_query);
			 if ($o=='part_time'){
			 $sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (1000,'$id')");
			 }
			 else{$sql= mysqli_query($conn,"INSERT INTO allowance(base_amount,emp_id) VALUES (5000,'$id')");
			 }
			 
 
		header("Location: formadmin1.html");
			 
		 }
	}
}
}
?>