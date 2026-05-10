<?php 
require_once('connection.php');
session_start();
if(isset($_POST['fname'])&& isset($_POST['pass'])){
	$input_data=$_POST['fname'];
	$p=$_POST['pass'];
	$sql="Select * from  admin_users where user='$input_data' and pass='$p'";
	$result=mysqli_query($conn,$sql);
	if(mysqli_num_rows($result)!=0){
		session_start();
		
    $_SESSION['input_data'] = $_POST['fname'];
	
		//echo" Admin logged in";
		header('Location: home1.html');
	}
	
	else{
		$sql="Select * from  employee_users where user='$input_data' and pass='$p'";
		$result=mysqli_query($conn,$sql);
		if(mysqli_num_rows($result)!=0){
			//echo "Employee Logged in";
			 $_SESSION['input_data'] = $_POST['fname'];
			 header('Location: home2.html');
		}
		else{
			echo" Username or Password Invalid";
			
		}
		}
			
	
	}

?>
		