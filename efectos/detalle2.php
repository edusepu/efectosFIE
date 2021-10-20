<?php require_once "vistas/parte_superior.php" ?>

<!--INICIO del cont principal-->
<div class="container">
    <!--<h1>Detalle del Efecto</h1>-->

    <link rel="stylesheet" href="detalle/assets/form-basic.css">

    <?php
    include_once 'bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $consulta = "SELECT * FROM detalleComputadora where activo=0";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $data = $resultado->fetchAll(PDO::FETCH_ASSOC);
    ?>


    <br>
    <div class="container">
        <!-- Area Chart -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="text-center m-0 font-weight-bold text-primary">Detalle del Efecto</h6>
            </div>
            <div class="card-body">
                <!-- You only need this form and the form-basic.css -->

                <form class="form-basic" method="post" action="bd/crudDetalle.php">
                    <div class="form-row shadow-sm p-3 mb-5 bg-body rounded">
                        <div class="col-12 d-inline">
                            <label>
                                <span>Microprocesador</span>
                            </label>
                            <select class="select" id="tipoMicro">
                                <option value="1">AMD</option>
                                <option value="2">Intel</option>
                            </select>
                            <input type="text" id="micro" name="micro">
                        </div>

                    </div>

                    <div class="form-row shadow-sm p-3 mb-5 bg-body rounded">
                        <div class="col-12 d-inline">
                            <label>
                                <span>Memoria RAM</span></label>
                            <input style="width:90px" type="number" name="ram" id="ram"> GB
                        </div>

                    </div>

                    <div class="form-row shadow-sm p-3 mb-5 bg-body rounded">
                        <div class="col-12 d-inline">
                            <label>
                                <span>Disco Rígido</span>
                            </label>
                            <select class="select" id="tipoDisco">
                                <option value="1">HDD</option>
                                <option value="2">SSD</option>
                            </select>
                            <input style="width:90px" type="number" id="disco" name="disco">
                            <select class="select" id="capacidadDisco">
                                <option value="1">GB</option>
                                <option value="2">TB</option>
                            </select>
                        </div>

                    </div>
                    <div class="form-row shadow-sm p-3 mb-5 bg-body rounded">
                        <div class="col-12 d-inline">
                            <label>
                                <span>Sistema Operativo</span></label>
                            <input type="text" name="so" id="so">
                        </div>

                    </div>

                    <div class="form-row shadow-sm p-3 mb-5 bg-body rounded">
                        <label>
                            <span style="color: #858796;">Observaciones</span>
                            <textarea name="obs"></textarea>
                        </label>
                    </div>




                    <div class="form-row">
                        <button type="submit">Guardzxzxzxar</button>

                        <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                    <button type="submit" id="btnGuardarDetalle" class="btn btn-dark">Guardar</button>
                    </div>
                    

                </form>
            </div>
        </div>

        <!--Modal para CRUD-->
        <div class="modal fade" id="modalCRUD" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel"></h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form id="formPersonas">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="NNE" class="col-form-label">NNE:</label>
                                <input type="text" class="form-control" id="NNE">
                            </div>
                            <div class="form-group">
                                <label for="INE" class="col-form-label">INE:</label>
                                <input type="text" class="form-control" id="INE">
                            </div>
                            <div class="form-group">
                                <label for="NI" class="col-form-label">NI:</label>
                                <input type="text" class="form-control" id="NI">
                            </div>
                            <div class="form-group">
                                <label for="dpto" class="col-form-label">Departamento:</label>
                                <input type="number" class="form-control" id="dpto">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                            <button type="submit" id="btnGuardar" class="btn btn-dark">Guardar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>



    </div>
    <!--FIN del cont principal-->
    <?php require_once "vistas/parte_inferior.php" ?>