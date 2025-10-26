<?php
// Obtiene los datos de conexión de las variables de entorno de Render
$servername = getenv('DB_HOST');
$dbname     = getenv('DB_NAME');
$username   = getenv('DB_USER');
$password   = getenv('DB_PASSWORD');
$port       = getenv('DB_PORT'); // Necesitas el puerto en Render

$conn = null;

try {
   // Usa PDO para conectar, incluyendo el puerto (port)
   $conn = new PDO("mysql:host=$servername;port=$port;dbname=$dbname;charset=utf8", $username, $password);
   $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
}
catch (PDOException $e) {
    echo "❌ Error de conexión en conexion.php: " . $e->getMessage();
}
?>
