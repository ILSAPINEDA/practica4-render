<?php

include "conexion.php";



if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['accion'])) {
    
    // Si el usuario presiona 'cancelar'
    if ($_POST['accion'] === 'cancelar') {
        header("Location: index.php"); 
        exit();
    }
    
    // Si el usuario presiona 'Actualizar'
    if ($_POST['accion'] === 'actualizar') {
        
        // El 'cod' se usa para identificar el producto a actualizar
        if (!isset($_POST['cod'], $_POST['nombre_corto'], $_POST['nombre'], $_POST['descripcion'], $_POST['PVP'])) {
            die("Faltan datos del formulario.");
        }

        $cod = $_POST['cod'];
        $nombre_corto = $_POST['nombre_corto'];
        $nombre = $_POST['nombre'];
        $descripcion = $_POST['descripcion'];
        $pvp = $_POST['PVP'];
        
        try {
            // Consulta SQL
            $sql = "UPDATE producto SET nombre_corto = ?, nombre = ?,  descripcion = ?, PVP = ? WHERE cod = ?";
            $stmt = $conn->prepare($sql);
            
            //Ejecutar la consulta pasando los valores en un array
            $stmt->execute([$nombre_corto, $nombre, $descripcion, $pvp, $cod]);
            
            $filas_afectadas = $stmt->rowCount();
            
            if ($filas_afectadas) {//Mensaje de exito
                echo "<h1>Producto actualizado con éxito.</h1>";
            } 
            
            
            echo <<<HTML
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="style.css">
    <meta http-equiv="refresh" content="3;url=listado.php?">

</head>
<body>
    <div class="mensaje">
        <h1>✅ Producto actualizado con éxito</h1>
        <p>Serás redirigido al listado en unos segundos...</p>
    </div>
</body>
</html>
HTML;
exit();

        } catch (PDOException $e) {
            echo "<h1>Error al actualizar el producto</h1>";
            echo "<p>Error: " . $e->getMessage() . "</p>";
        }
    }
} else {
    echo "<h1>Acceso no permitido</h1>";
}
?>
