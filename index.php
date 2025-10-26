<?php
// 1. CORRECCIÓN DE RUTA: Uso de __DIR__ para asegurar que PHP encuentra el archivo en el mismo directorio.
// 2. CORRECCIÓN DE CASO: Se usa 'conexion.php' (minúsculas) para coincidir con el nombre del archivo en GitHub.
include __DIR__ . '/conexion.php';

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Inicializa la variable $familia ANTES de usarla
$familia = isset($_POST['familia']) ? $_POST['familia'] : null;

// NOTA: Si usaste PDO/Postgres, la variable de conexión debe ser $conn, como está.
?>

<!DOCTYPE html>
<html lang="es">    
    <head>
        <meta charset= "UTF-8">
        <title>DWES03</title>
        <link rel="stylesheet" href="style.css">
        <style>
            .producto-fila {
                display: flex;
                justify-content: space-between; /* Separar botones de texto */
                align-items: center;
                width: 100%;
                margin-bottom: 10px;
                padding: 5px 0;
                border-bottom: 1px dashed #5e5e5eff; /* linea divisora */
            }
            .botones-acciones {
                display: flex;
                gap: 10px;
            }
        </style>
    </head>

<body>

<div class="encabezado">

    <h1>Tarea: Listados de productos de una familia</h1>
    <form id="form_seleccion" action="index.php" method="post">
        <span>Familia: </span>
        <select name="familia">
            <?php
            try {

                $sql = "SELECT cod, nombre FROM familia";
                $resultado = $conn->query($sql);

                if ($resultado) {
                    while ($row = $resultado->fetch(PDO::FETCH_ASSOC)) {
                        
                        $selected = ($row['cod'] == $familia) ? 'selected' : '';

                        echo "<option value='" . htmlspecialchars($row['cod']) . "' " . $selected . ">";
                        
                        echo htmlspecialchars($row['nombre']) . "</option>";
                    }
                }
            } catch (PDOException $e) {
                // Mostrar un mensaje de error claro en caso de falla de la conexión o consulta
                echo "<option value=''>--- ERROR DB ---</option>";
                echo "<p>Error: " . htmlspecialchars($e->getMessage()) . "</p>";
            }
            ?>
            </select>
        <button class="mostrar" id="mostrar" type="submit">Mostrar productos</button>
    </form>
</div>

<div id="contenido">
    <h2>Productos de la familia:</h2>
    
    <?php
    // Si se recibió un codigo de familia
    if (isset($familia)) {
        try {

        // Consulta para obtener productos de una familia
        $sql = "SELECT * FROM producto WHERE familia = :familia";

        $consulta = $conn->prepare($sql);
        $consulta->bindParam(':familia', $familia);
        $consulta->execute();

        if ($consulta) {
            
            while ($producto = $consulta->fetch(PDO::FETCH_ASSOC)) { ?>
                
                <div class="producto-fila">
                    <span class="producto-info">
                        <?= htmlspecialchars($producto['nombre_corto']) ?> - <?= htmlspecialchars($producto['PVP']) ?>€
                    </span>
                    
                    <div class="botones-acciones" style="padding: 4px 16px ">
                        <form method="post" action="editar.php" style="display:inline;">
                            <input type="hidden" name="cod" value="<?= $producto['cod'] ?>">
                            <button class="editar" type="submit">Editar</button>
                        </form>
                        <form method="post" action="eliminar.php" style="display:inline;">
                            <input type="hidden" name="cod" value="<?= $producto['cod'] ?>">
                            <button class="eliminar" type="submit">Eliminar</button>
                        </form>
                    </div>
                </div> <?php
            }
        }
    } catch (PDOException $e) {
        echo "<p>Error en la consulta de stock: " . htmlspecialchars($e->getMessage()) . "</p>";
    }
}
?>
</div> </body>
</html>
