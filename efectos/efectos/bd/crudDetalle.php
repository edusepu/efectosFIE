<?php
//echo "detalle crud";
//var_dump($_POST);
//exit;
include_once '../bd/conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
// Recepción de los datos enviados mediante POST desde el JS   

$micro = (isset($_POST['micro'])) ? $_POST['micro'] : '';
/*$INE = (isset($_POST['INE'])) ? $_POST['INE'] : '';
$NI = (isset($_POST['NI'])) ? $_POST['NI'] : '';
$dpto = (isset($_POST['dpto'])) ? $_POST['dpto'] : '';*/

$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['id'])) ? $_POST['id'] : '';

switch($opcion){
    case 1: //alta
        $consulta = "INSERT INTO detallecomputadora (idDetalle, procesador) VALUES('$id', '$micro') ";			
        $resultado = $conexion->prepare($consulta);
        $resultado->execute(); 

        $consulta = "SELECT id, NNE, INE, NI, dpto FROM efectos ORDER BY id DESC LIMIT 1";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 2: //modificación
        $consulta = "UPDATE efectos SET NNE='$NNE', INE='$INE', NI='$NI', dpto='$dpto' WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();        
        
        $consulta = "SELECT id, NNE, INE, NI, dpto FROM efectos WHERE id='$id' ";       
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;        
    case 3://baja
        $consulta = "UPDATE efectos SET activo=1 WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute(); 
        $consulta = "SELECT id, NNE, INE, NI, dpto FROM efectos WHERE id='$id' ";       
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);                      
        break;        
}

print json_encode($data, JSON_UNESCAPED_UNICODE); //enviar el array final en formato json a JS
$conexion = NULL;
