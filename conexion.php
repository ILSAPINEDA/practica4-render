<?php
// Obtiene los datos de conexión de las variables de entorno de Render
$host = getenv('DB_HOST');
$db   = getenv('DB_NAME');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');
$port = getenv('DB_PORT');
 
$conn = null;

try {
   // Usa PDO para conectar
   $conn = new PDO("mysql:host=$host;port=$port;dbname=$db;charset=utf8", $user, $pass);
   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e) {
    echo "❌ Error de conexión en conexion.php: " . $e->getMessage();
}
?>
