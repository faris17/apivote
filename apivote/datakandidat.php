<?php
	
	include 'Koneksi.php';
	
	class usr{}
	
	$query = mysqli_query($con, "SELECT * FROM kandidat WHERE tahun='".date('Y')."' Order By nomor_kandidat ASC");
	
	if(mysqli_num_rows($query) > 0 ){
	  $response = array();
	  $response["data"] = array();
	  while($x = mysqli_fetch_array($query)){
		$h['idkandidat'] = $x["idkandidat"];
		$h['tahun'] = $x["tahun"];
		$h['visi'] = $x["visi"];
		$h['fotoprofilketua'] = $x["fotoprofilketua"];
		$h['fotoprofilwakil'] = $x["fotoprofilwakil"];
		$h['nim_calonketua'] = $x["nim_calonketua"];
		$h['nim_calonwakil'] = $x["nim_calonwakil"];
		array_push($response["data"], $h);
	  }
	  echo json_encode($response);
	}else {
	  $response["message"]="tidak ada data";
	  echo json_encode($response);
	}
	
	mysqlI_close($con);


	

?>