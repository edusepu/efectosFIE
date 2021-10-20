<?php require_once "vistas/parte_superior.php" ?>

<!--INICIO del cont principal-->
<div class="container">
    <h1>Efectos</h1>



    <?php
    include_once 'bd/conexion.php';
    $objeto = new Conexion();
    $conexion = $objeto->Conectar();

    $consulta = "SELECT * FROM efectos LEFT JOIN detallecomputadora ON efectos.id=detallecomputadora.idDetalle WHERE efectos.activo=0";
    $resultado = $conexion->prepare($consulta);
    $resultado->execute();
    $data = $resultado->fetchAll(PDO::FETCH_ASSOC);

    ?>


    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <button id="btnNuevo" type="button" class="btn btn-success" data-toggle="modal">Nuevo</button>
            </div>
        </div>
    </div>
    <br>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table id="tablaPersonas" class="table table-striped table-bordered table-condensed" style="width:100%">
                        <thead class="text-center">
                            <tr>
                                <th>Id</th>
                                <th>NNE</th>
                                <th>INE</th>
                                <th>NI</th>
                                <th>Departamento</th>
                                <th class="oculto">idDetalle</th>
                                <th class="oculto">marcaProcesador</th>
                                <th class="oculto">procesador</th>
                                <th class="oculto">ram</th>
                                <th class="oculto">tipoDisco</th>
                                <th class="oculto">capacidadDisco</th>
                                <th class="oculto">medidaCapacidad</th>
                                <th class="oculto">sistemaOperativo</th>
                                <th class="oculto">observaciones</th>

                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            foreach ($data as $dat) {
                            ?>
                                <tr>
                                    <td><?php echo $dat['id'] ?></td>
                                    <td><?php echo $dat['NNE'] ?></td>
                                    <td><?php echo $dat['INE'] ?></td>
                                    <td><?php echo $dat['NI'] ?></td>
                                    <td><?php echo $dat['dpto'] ?></td>
                                    <td class="oculto"><?php echo $dat['idDetalle'] ?></td>
                                    <td class="oculto"><?php echo $dat['marcaProcesador'] ?></td>
                                    <td class="oculto"><?php echo $dat['procesador'] ?></td>
                                    <td class="oculto"><?php echo $dat['ram'] ?></td>
                                    <td class="oculto"><?php echo $dat['tipoDisco'] ?></td>
                                    <td class="oculto"><?php echo $dat['capacidadDisco'] ?></td>
                                    <td class="oculto"><?php echo $dat['medidaCapacidad'] ?></td>
                                    <td class="oculto"><?php echo $dat['sistemaOperativo'] ?></td>
                                    <td class="oculto"><?php echo $dat['observaciones'] ?></td>
                                    <td></td>
                                </tr>
                            <?php
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>
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

    <!--Modal para Detalle-->
    <div class="modal fade" id="modalDetalle" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2"></h5>
                    <a id="detalle" target="_blank" class="sidebar-brand d-flex align-items-center justify-content-center" href="index.php">
       <!--  <div class="sidebar-brand-icon rotate-n-15">-->
       <div>
        <img class="" style=" height: 50px;" src="img/ver-detalles.png">
        </div>
        <!--<div class="sidebar-brand-text mx-3">Logo_FIE_hor</div>-->
      </a>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="formDetalle" class="form-basic">
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
                            <textarea name="obs" id="obs"></textarea>
                        </label>
                    </div>


                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-dismiss="modal">Cancelar</button>
                        <button type="submit" id="btnGuardarDetalle" class="btn btn-dark">Guardar</button>
                    </div>

                    

                </form>
            </div>
        </div>
    </div>

</div>
<!--FIN del cont principal-->
<?php require_once "vistas/parte_inferior.php" ?>