<?php
//echo "detalle crud";
//
//exit;
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$id = (isset($_GET['id'])) ? $_GET['id'] : '';
// Recepción de los datos enviados mediante POST desde el JS   
$consulta = "SELECT * FROM detalleComputadora where idDetalle=" . $id;
$resultado = $conexion->prepare($consulta);
$resultado->execute();
$data = $resultado->fetchAll(PDO::FETCH_ASSOC);

foreach ($data as $datos) {
	//echo $datos['sistemaOperativo'] . '<br>';
	if ($datos['tipoDisco'] == 1) {
		$tipoDisco = "HDD";
	} else {
		$tipoDisco = "SSD";
	}
	if ($datos['medidaCapacidad'] == 1) {
		$medidaCapacidad = "GB";
	} else {
		$medidaCapacidad = "TB";
	}
	$disco = $tipoDisco . " " . $datos['capacidadDisco'] . " " . $medidaCapacidad;
	if ($datos['marcaProcesador'] == 1) {
		$tipoMicro = "AMD";
	} else {
		$tipoMicro = "Intel";
	}
	$micro = $tipoMicro . " " . $datos['procesador'];
	$ram = $datos['ram'];
	$sistemaOperativo = $datos['sistemaOperativo'];
	$observaciones = $datos['observaciones'];
}

?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Detalle PC</title>

	<meta name="description" content="">
	<meta name="author" content="LayoutIt!">

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">

</head>

<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2">
					</div>
					<div class="col-md-8">
						<table class="table">
							<thead>
								<tr>
									<th>

									</th>
									<th>
										<h1>Detalle PC</h1>
										<h5>ID: <?php echo ($id); ?></h5>
									</th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										Microprocesador
									</td>
									<td>
										<?php echo ($micro); ?>
									</td>

								</tr>
								<tr class="table-active">
									<td>
										Memoria RAM
									</td>
									<td>
										<?php echo ($ram); ?> GB
									</td>

								</tr>
								<tr class="table-success">
									<td>
										Disco Rígido
									</td>
									<td>
										<?php echo ($disco); ?>
									</td>

								</tr>
								<tr class="table-warning">
									<td>
										Sistema Operativo
									</td>
									<td>
										<?php echo ($sistemaOperativo); ?>
									</td>

								</tr>
								<tr class="table-danger">
									<td>
										Observaciones
									</td>
									<td>
										<?php echo ($observaciones); ?>
									</td>

								</tr>
							</tbody>
						</table>
					</div>
					<div class="col-md-2">
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>

</html>