<?php
// Incluye el archivo de conexión
include 'conexion.php';

echo "<h1>Práctica DAW: Despliegue en Render</h1>";

// Verifica si la conexión fue exitosa
if (isset($conn) && $conn !== null) {
    echo "<p style='color: green; font-weight: bold;'>✅ Conexión a la base de datos MySQL exitosa.</p>";
} else {
    echo "<p style='color: red; font-weight: bold;'>❌ Error: No se pudo establecer la conexión a la base de datos.</p>";
}
?>
