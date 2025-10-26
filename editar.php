<?php

//Se conecta haciendo una referencia al fichero que tenemos de Conexion
include "Conexion.php";

// Obtener datos del producto
if (isset($_POST['cod'])) {
    try {
        $codigoProducto = $_POST['cod'];
        $stmt = $conn->prepare("SELECT * FROM producto WHERE cod = ?");
        $stmt->bindParam(1, $codigoProducto);
        $stmt->execute();
        $producto = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "<p>Error en la consulta de stock: " . $e->getMessage() . "</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Tarea: Edición de un producto</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="encabezado">
        <h1>Tarea: Edición de un producto</h1>
    </div>


<div class="contenido">
    <?php if ($producto): ?>
        <form  method="post" action="actualizar.php">
            <input class="formulario" type="hidden" name="cod" value="<?= $producto['cod'] ?>">
            <label for="nombre_corto">Nombre corto:</label>
            <input class="formulario" type="text" id="nombre_corto" name="nombre_corto" value="<?= htmlspecialchars($producto['nombre_corto']) ?>" required><br>

            <label for="nombre">Nombre:</label>
            <input class="formulario" type="text" id="nombre" name="nombre" value="<?= htmlspecialchars($producto['nombre']) ?>" required><br>

            <label for="descripcion">Descripción:</label>
            <textarea class="formulario" id="descripcion" name="descripcion" required><?= htmlspecialchars($producto['descripcion']) ?></textarea><br>

            <label for="PVP">PVP:</label>
            <input class="formulario" type="text" id="PVP" name="PVP" value="<?= htmlspecialchars($producto['PVP']) ?>" required><br>

            <button class="actualizar" type="submit" name="accion" value="actualizar">Actualizar</button>
            <button class="cancelar" type="submit" name="accion" value="cancelar">Cancelar</button>
        </form>
        <?php else: ?>
            <p>Producto no encontrado:</p>
        <?php endif; ?>

</div>
    
    </body>
</html>
