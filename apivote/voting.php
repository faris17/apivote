<?php
	
	include 'Koneksi.php';
	
	class usr{}
	
	$idkandidat = $_POST["idkandidat"];
	$nim = $_POST["nim"];
	$tanggal = $_POST['tanggal'];
	
	
	
	$query = mysqli_query($con, "INSERT INTO vote VALUES('',$tanggal,$nim,$idkandidat)");
	
	
	if ($query){
		$response = new usr();
		$response->message = "Berhasil Vote";
		die(json_encode($response));
		
	} else { 
		$response = new usr();
		$response->message = "Gagal Voting!";
		die(json_encode($response));
	}
	
	mysqlI_close();


	

?>