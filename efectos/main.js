$(document).ready(function () {
    tablaPersonas = $("#tablaPersonas").DataTable({
        "order": [[ 0, "desc" ]],
        "columnDefs": [{
            "targets": -1,
            "data": null,
            "defaultContent": "<div class='text-center'><div class='btn-group'><a id='ubicacion' href='#'><img class='btnUbicacion' style=' height: 38px;' src='img/ubicacion.png'></a><a id='detalle' href='#'><img class='btnQR' style=' height: 38px;' src='img/qr.png'></a><button class='btn btn-info btnDetalle'>Detalles</button><button class='btn btn-primary btnEditar'>Editar</button><button class='btn btn-danger btnBorrar'>Borrar</button></div></div>"
        }
        ],

        "language": {
            "lengthMenu": "Mostrar _MENU_ registros",
            "zeroRecords": "No se encontraron resultados",
            "info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
            "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
            "infoFiltered": "(filtrado de un total de _MAX_ registros)",
            "sSearch": "Buscar:",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "sProcessing": "Procesando...",
        }
    });

    $("#btnNuevo").click(function () {
        $("#formPersonas").trigger("reset");
        $(".modal-header").css("background-color", "#1cc88a");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Nuevo Efecto");
        $("#modalCRUD").modal("show");
        id = null;
        opcion = 1; //alta
    });



    var fila; //capturar la fila para editar o borrar el registro
    //botón Detalle    
    $(document).on("click", ".btnDetalle", function () {
        fila = $(this).closest("tr");
        id = parseInt(fila.find('td:eq(0)').text());
        NNE = fila.find('td:eq(1)').text();
        INE = fila.find('td:eq(2)').text();
        NI = fila.find('td:eq(3)').text();
        dpto = parseInt(fila.find('td:eq(4)').text());

        idDetalle = parseInt(fila.find('td:eq(5)').text());
        marcaProcesador = parseInt(fila.find('td:eq(6)').text());
        procesador = (fila.find('td:eq(7)').text());
        ram = parseInt(fila.find('td:eq(8)').text());
        tipoDisco = parseInt(fila.find('td:eq(9)').text());
        capacidadDisco = parseInt(fila.find('td:eq(10)').text());
        medidaCapacidad = parseInt(fila.find('td:eq(11)').text());
        sistemaOperativo = (fila.find('td:eq(12)').text());
        observaciones = (fila.find('td:eq(13)').text());

        //alert(observaciones);
        $("#NNE").val(NNE);
        $("#INE").val(INE);
        $("#NI").val(NI);
        $("#dpto").val(dpto);
        $("#idDetalle").val(idDetalle);
        $("#micro").val(procesador);
        $("#so").val(sistemaOperativo);
        $("#ram").val(ram);
        $("#disco").val(capacidadDisco);
        $("#tipoMicro").val(marcaProcesador);
        $("#tipoDisco").val(tipoDisco);
        $("#capacidadDisco").val(medidaCapacidad);
        $("#obs").val(observaciones);

        //detalle

        if (idDetalle) {            
            $(".modal-header").css("background-color", "#4e73df");
            $(".modal-header").css("color", "white");
            $(".modal-title").text("Editar Detalle a EFECTO ID: " + idDetalle);
            $('#detalle').attr('href', 'detalle.php?id='+idDetalle);
            $('.detalle').attr('href', 'detalle.php?id='+idDetalle);
            $('.detalle').show();
            opcion = 2;
        } else {
            $("#formDetalle").trigger("reset");
            $(".modal-header").css("background-color", "#1cc88a");
            $(".modal-header").css("color", "white");
            $(".modal-title").text("Asignar Detalle a EFECTO ID: " + id);

            //$('#detalle').attr('href', 'detalle.php?id='+idDetalle);
            $('.detalle').hide();
            opcion = 1; //alta
        }

        $("#modalDetalle").modal("show");

    });
    //botón EDITAR    
    $(document).on("click", ".btnEditar", function () {
        fila = $(this).closest("tr");
        id = parseInt(fila.find('td:eq(0)').text());
        NNE = fila.find('td:eq(1)').text();
        INE = fila.find('td:eq(2)').text();
        NI = fila.find('td:eq(3)').text();
        dpto = parseInt(fila.find('td:eq(4)').text());
        idDetalle = parseInt(fila.find('td:eq(5)').text());
        marcaProcesador = parseInt(fila.find('td:eq(6)').text());
        procesador = (fila.find('td:eq(7)').text());
        ram = parseInt(fila.find('td:eq(8)').text());
        tipoDisco = parseInt(fila.find('td:eq(9)').text());
        capacidadDisco = parseInt(fila.find('td:eq(10)').text());
        medidaCapacidad = parseInt(fila.find('td:eq(11)').text());
        sistemaOperativo = (fila.find('td:eq(12)').text());
        observaciones = (fila.find('td:eq(13)').text());

        $("#NNE").val(NNE);
        $("#INE").val(INE);
        $("#NI").val(NI);
        $("#dpto").val(dpto);

        opcion = 2; //editar

        $(".modal-header").css("background-color", "#4e73df");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Editar Persona");
        $("#modalCRUD").modal("show");

    });

    //botón BORRAR
    $(document).on("click", ".btnBorrar", function () {
        fila = $(this);
        id = parseInt($(this).closest("tr").find('td:eq(0)').text());
        opcion = 3 //borrar
        var respuesta = confirm("¿Está seguro de eliminar el registro: " + id + "?");
        if (respuesta) {
            $.ajax({
                url: "bd/crud.php",
                type: "POST",
                dataType: "json",
                data: { opcion: opcion, id: id },
                success: function () {
                    tablaPersonas.row(fila.parents('tr')).remove().draw();
                }
            });
        }
    });

    $("#formPersonas").submit(function (e) {
//        alert("anda");
        e.preventDefault();
        NNE = $.trim($("#NNE").val());
        INE = $.trim($("#INE").val());
        NI = $.trim($("#NI").val());
        dpto = $.trim($("#dpto").val());

        $.ajax({
            url: "bd/crud.php",
            type: "POST",
            dataType: "json",
            data: { NNE: NNE, INE: INE, NI: NI, dpto: dpto, id: id, opcion: opcion },
            success: function (data) {
                //console.log(data);
                id = data[0].id;
                NNE = data[0].NNE;
                INE = data[0].INE;
                NI = data[0].NI;
                dpto = data[0].dpto;
                idDetalle = data[0].idDetalle;
                marcaProcesador = data[0].marcaProcesador;
                procesador = data[0].procesador;
                ram = data[0].ram;
                tipoDisco = data[0].tipoDisco;
                capacidadDisco = data[0].capacidadDisco;
                medidaCapacidad = data[0].medidaCapacidad;
                sistemaOperativo = data[0].sistemaOperativo;
                observaciones = data[0].observaciones;
                if (opcion == 1) {
                    tablaPersonas.order([0, 'desc']).draw();
                    tablaPersonas.row.add([id, NNE, INE, NI, dpto, "", "", "", "", "", "", "", "", ""]).draw();
                    $('#tablaPersonas tbody td').eq(5).addClass('oculto');
                    $('#tablaPersonas tbody td').eq(6).addClass('oculto');
                    $('#tablaPersonas tbody td').eq(7).addClass('oculto');
                    $('#tablaPersonas tbody td').eq(8).addClass('oculto');
                    $('#tablaPersonas tbody td').eq(9).addClass('oculto');
                    $('#tablaPersonas tbody td').eq(10).addClass('oculto');
                    $('#tablaPersonas tbody td').eq(11).addClass('oculto');
                    $('#tablaPersonas tbody td').eq(12).addClass('oculto');

                    $('#tablaPersonas tbody td').eq(13).addClass('oculto');

                }
                else { tablaPersonas.row(fila).data([id, NNE, INE, NI, dpto, idDetalle, marcaProcesador, procesador, ram, tipoDisco, capacidadDisco, medidaCapacidad, sistemaOperativo, observaciones]).draw(); }
            }
        });
        $("#modalCRUD").modal("hide");

    });



    $("#formDetalle").submit(function (e) {
        // alert("anda detalle" +opcion);
        e.preventDefault();

        micro = $.trim($("#micro").val());
        marcaProcesador = $.trim($("#tipoMicro").val());
        ram = $.trim($("#ram").val());
        tipoDisco = $.trim($("#tipoDisco").val());
        disco = $.trim($("#disco").val());
        medidaCapacidad = $.trim($("#capacidadDisco").val());
        so = $.trim($("#so").val());
        obs = $.trim($("#obs").val());

        /*   INE = $.trim($("#INE").val());
           NI = $.trim($("#NI").val());
           dpto = $.trim($("#dpto").val());*/

        $.ajax({
            url: "bd/crudDetalle.php",
            type: "POST",
            dataType: "json",
            data: {id: id, marcaProcesador:marcaProcesador, micro: micro, ram:ram, tipoDisco:tipoDisco, disco:disco, medidaCapacidad:medidaCapacidad,so:so,obs:obs,opcion: opcion },
            success: function (data) {
                //console.log(data);
                id = data[0].id;
                micro = data[0].micro;
                INE = data[0].INE;
                NI = data[0].NI;
                dpto = data[0].dpto;
                idDetalle = data[0].id;
                marcaProcesador = data[0].marcaProcesador;
                procesador = data[0].procesador;
                ram = data[0].ram;
                tipoDisco = data[0].tipoDisco;
                capacidadDisco = data[0].capacidadDisco;
                medidaCapacidad = data[0].medidaCapacidad;
                sistemaOperativo = data[0].sistemaOperativo;
                observaciones = data[0].observaciones;


                if (opcion == 1) { tablaPersonas.row(fila).data([id, NNE, INE, NI,dpto,id, marcaProcesador, procesador, ram, tipoDisco, capacidadDisco, medidaCapacidad, sistemaOperativo, observaciones]).draw(); }
                else { tablaPersonas.row(fila).data([id, NNE, INE, NI, dpto, idDetalle, marcaProcesador, procesador, ram, tipoDisco, capacidadDisco, medidaCapacidad, sistemaOperativo, observaciones]).draw(); }
            }
        });
        $("#modalDetalle").modal("hide");


    });

    //botón QR
   /* $(document).on("click", ".btnQR", function () {
        alert('hhhh');
        fila = $(this).closest("tr");
        id = parseInt(fila.find('td:eq(0)').text());
        NNE = fila.find('td:eq(1)').text();
        INE = fila.find('td:eq(2)').text();
        NI = fila.find('td:eq(3)').text();
        dpto = parseInt(fila.find('td:eq(4)').text());
        idDetalle = parseInt(fila.find('td:eq(5)').text());
        marcaProcesador = parseInt(fila.find('td:eq(6)').text());
        procesador = (fila.find('td:eq(7)').text());
        ram = parseInt(fila.find('td:eq(8)').text());
        tipoDisco = parseInt(fila.find('td:eq(9)').text());
        capacidadDisco = parseInt(fila.find('td:eq(10)').text());
        medidaCapacidad = parseInt(fila.find('td:eq(11)').text());
        sistemaOperativo = (fila.find('td:eq(12)').text());
        observaciones = (fila.find('td:eq(13)').text());

        $("#NNE").val(NNE);
        $("#INE").val(INE);
        $("#NI").val(NI);
        $("#dpto").val(dpto);

        opcion = 2; //editar

        $(".modal-header").css("background-color", "#4e73df");
        $(".modal-header").css("color", "white");
        $(".modal-title").text("Editar Persona");
        $("#modalCRUD").modal("show");

    });*/
    $(document).on("click", ".btnQR", function (event) {
        var sizeqr="300";
        fila = $(this).closest("tr");
        id = parseInt(fila.find('td:eq(0)').text());
        var textqr="10.24.39.215/efectos/efectos/detalle.php?id="+id;
        parametros={"textqr":textqr,"sizeqr":sizeqr};
        $.ajax({
            type: "POST",
            url: "qr.php",
            data: parametros,
            success: function(datos){
                $(".result").html(datos);
            }

        })
        //alert(sizeqr);
        event.preventDefault();
        $(".modal-title").text("Imprimir Codigo QR");

        $("#modalQR").modal("show");
    });

    $(document).on("click", ".btnUbicacion", function (event) {
        fila = $(this).closest("tr");
        var idurl =parseInt(fila.find('td:eq(0)').text());
        window.open("mapa.php?id="+idurl, '_self');
        event.preventDefault();

    });

});