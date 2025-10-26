<?php
$servername = "127.0.0.1";
$dbname = "dwes";
$username = "dwes";
$password = "dwes";

try {
  $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password); //crear el PDO
  $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); //Crear la conexion

} catch(PDOException $e) { //Capturar el ERROR
  echo "Connection failed: " . $e->getMessage();
}

?>
