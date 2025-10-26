<?php
include 'Conexion.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Verificar si se recibió el código
if (isset($_POST['cod'])) {
    $cod = $_POST['cod'];

    try {
        // Preparar y ejecutar la eliminación
        $sql = "DELETE FROM producto WHERE cod = :cod";
        $stmt = $conn->prepare($sql);
        $stmt->bindParam(':cod', $cod);
        $stmt->execute();

        // Redireccionar de vuelta al listado
        header("Location: listado.php");
        exit;
    } catch (PDOException $e) {
        echo "<p>Error al eliminar el producto: " . htmlspecialchars($e->getMessage()) . "</p>";
    }
} else {
    echo "<p>No se recibió código de producto para eliminar.</p>";
}
?>
