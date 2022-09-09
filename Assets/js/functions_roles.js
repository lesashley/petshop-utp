var tableRoles;
document.addEventListener('DOMContentLoaded', function() {
    tableRoles = $('#tableRoles').dataTable({
        "aProcessing": true,
        "aServerSide": true,
        "language": {
            "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
        },
        "ajax": {
            "url": "" + base_url + "/Roles/getRoles",
            "dataSrc": ""
        },
        "columns": [
            { "data": "idrol" },
            { "data": "nombrerol" },
            { "data": "descripcion" },
            { "data": "status" },
            { "data": "options" }
        ],
        "resonsieve": "true",
        "bDestroy": true,
        "iDisplayLength": 10,
        "order": [
            [0, "desc"]
        ]
    });

    //NUEVO ROL
    var formRol = document.querySelector("#formRol");
    formRol.onsubmit = function(e) {
        e.preventDefault(); //evita que se recargue la pagina
        var strNombre = document.querySelector('#txtNombre').value;
        var strDescripcion = document.querySelector('#txtDescripcion').value;
        var intStatus = document.querySelector('#listStatus').value;
        if (strNombre == '' || strDescripcion == '' || intStatus == '') {
            swal.fire("Atención", "Todos los campos son obligatorios.", "error");
            return false;
        }
        var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP'); //para que funcione en todos los navegadores
        var ajaxUrl = base_url + '/Roles/setRol'; //ruta del controlador
        var formData = new FormData(formRol); //obtiene los datos del formulario
        request.open("POST", ajaxUrl, true); //abre la conexion
        request.send(formData); //envia los datos
        request.onreadystatechange = function() {
            if (request.readyState == 4 && request.status == 200) {
                var objData = JSON.parse(request.responseText); //convierte el json a un objeto
                if (objData.status) {
                    $('#modalFormRol').modal("hide");
                    formRol.reset();
                    swal.fire("Roles de Usuario", objData.msg, "success");
                    tableRoles.api().ajax.reload(function() {


                    });
                } else {
                    swal.fire("Error", objData.msg, "error");
                }
            }
        }
    }
});

$('#tableRoles').DataTable();

function openModal() {
    $('#modalFormRol').modal('show');
}