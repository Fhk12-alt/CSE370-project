<?php 
require_once('connection.php');
if( isset($_POST['action'])){
	$o=$_POST['action'];
	if($o=='insert'){
	
	header("Location: formadmin_1insert.html");
	}
	else if ($o=='delete'){
		
	header("Location: formadmin_1delete.html");
	
	}
	else if ($o=='update'){
		header("Location: formadmin_1update.html");
	}
}
?>