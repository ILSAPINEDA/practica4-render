<?php
// Configuración de las variables de entorno de Render
$host = getenv('DB_HOST');
$db = getenv('DB_NAME');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');
$port = getenv('DB_PORT'); // El puerto lo define Render

try {
    // La conexión PDO usa las variables de entorno
    $conn = new PDO("mysql:host=$host;port=$port;dbname=$db;charset=utf8", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "❌ Error de conexión: " . $e->getMessage();
    // En un entorno de producción, es mejor solo mostrar un error genérico
    exit();
}
// Ahora puedes usar $conn en tus otros archivos PHP
?>
