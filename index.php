<?php 
	session_start();
	if (!isset($_SESSION['hoten'])) {
	 header('Location: html/dangnhap.php');
	}
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>INDEX</title>
</head>
<body>
	Xin chào <?php echo $_SESSION['hoten']; ?>
</body>
</html>