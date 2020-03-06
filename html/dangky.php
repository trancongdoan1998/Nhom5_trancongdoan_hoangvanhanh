<?php 
	 $conn = mysqli_connect('localhost','root','','quanlyphongkham');
	 mysqli_set_charset($conn,'UTF8');
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Dăng ký</title>
	<style>
		*{
	margin:0;
	padding:0;
		}
		body{
			margin:0 auto;
			width: 960px;
			background-image: url("../img/bg.jpg");
			background-size: cover;
			background-repeat: no-repeat;
			background-position: all;
		}
		h1{
			height: 50px;
			line-height: 50px;
			margin-left: 10px;
		}
		form{
			margin-top: 45px;
			width: 500px;
			height: 400px;
			margin-left: 100px;
		}
		form .login{
			width: 60%;
			margin-left: 100px;
		}
		form label{
			display: block;
			height: 20px;
			line-height: 20px;
			margin-bottom: 5px;
			margin-left: 10px;
			font-weight: bold;

		}
		form .input{
			padding-left:5px;
			width: 80%;
			height: 30px;
			border: none;
			display: block;
			border-bottom: 1px solid black;
			margin-bottom: 10px;
			margin-left: 10px;
			background: none;
		}
		form .input:focus{
			
		}
		.login .submit{
			border: none;
			width: 90%;
			height: 40px;
			color: green;
			font-weight: bold;
			border-radius: 2px;
			margin-left: 10px;
			margin-bottom: 10px;
			transition: background 0.5s,color 0.4s;
		}
		.login{
			border: none;
			box-shadow: 0px 0px 14px 0px grey;
		}
		.login .submit:hover{
			background-color: #0EAD00;
			color: white;
			border-radius: 3px;
		}
		h2{
			text-align: center;
			font-size: 40px;
			font-weight: bold;
			color: #0EAD00;
			border-bottom: 2px solid gold;
		}
	</style>
</head>
<body>
	<?php 
			if(isset($_POST['submit']))
			{
				$error = array();
				
				if(empty($_POST['username']))
				{
					$error['username'] = "nhap ten";
				}
				if(empty($_POST['number']))
				{
					$error['number'] = "nhap sdt";
				}
				
				if(empty($_POST['password']))
				{
					$error['password'] = "nhap mat khau";
				}
				$hoten=$_POST['username'];
				$sdt=$_POST['number'];
				$password=$_POST['password'];
				if(empty($error))
				{
						$sql ="INSERT INTO thanhvien (hoten,sdt,matkhau) VALUES('".$hoten."','".$sdt."','".$password."')";
				
				
					if(!mysqli_query($conn,$sql))
					{
						die('Lỗi: '.mysqli_error($conn));
					}
					else{
						header('Location:dangnhap.php');
					}
				}
				
						
			}
			
	 ?>
	<h2>PHÒNG KHÁM BỆNH ĐA KHOA </h2>
	<form action="" method="POST">
		<div class="login">
			<h1>Đăng ký thành viên !</h1>
			<label>Họ Tên:</label>
			<input type="text" name="username" placeholder="Họ Tên.."  class="input">
			<label>Mật khẩu:</label>
			<input type="password" name="password" placeholder="Mật Khẩu.."  class="input">
			<label>Số điện thoại:</label>
			<input type="text" name="number" placeholder="Số điện thoại.." class="input">
			<input type="submit" name="submit" value="Đăng ký" class="submit">
		</div>
	</form>
</body>
</html>