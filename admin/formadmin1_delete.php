<?php 
require_once('connection.php');
if( isset($_POST['id'])){
	$o=$_POST['id'];
	$sql="Select * from  employee_users where emp_id='$o'";
	$result=mysqli_query($conn,$sql);
	if(mysqli_num_rows($result)!=0){
		$sql= mysqli_query($conn,"DELETE FROM employee WHERE emp_id='$o'");	
	header("Location: formadmin1.html");
	}
	else{
	
	
	header("Location: input_wrong.html");
	}
	

	
}
?>
	
	
