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
    document.querySelector('#idRol').value = ""; //limpia el campo idRol para evitar que se duplique el id y salga el modal de update
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister"); //cambia el color del header del modal
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary"); //cambia el color del boton del modal
    document.querySelector('#btnText').innerHTML = "Guardar"; //cambia el texto del boton del modal
    document.querySelector('#titleModal').innerHTML = "Nuevo Rol de Usuario"; //cambia el titulo del modal
    document.querySelector("#formRol").reset(); //limpia el formulario
    $('#modalFormRol').modal('show'); //abre el modal
}
window.addEventListener('load', function() { //cuando se cargue la pagina se ejecuta la funcion fntEditRol 
    fntEditRol();
}, false);


function fntEditRol() {
    var btnEditRol = document.querySelectorAll(".btnEditRol");
    btnEditRol.forEach(function(btnEditRol) {
        btnEditRol.addEventListener('click', function() {

            document.querySelector('#titleModal').innerHTML = "Actualizar Rol";
            document.querySelector('.modal-header').classList.replace("headerRegister", "headerUpdate");
            document.querySelector('#btnActionForm').classList.replace("btn-primary", "btn-info");
            document.querySelector('#btnText').innerHTML = "Actualizar";

            var idrol = this.getAttribute("rl");
            var request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
            var ajaxUrl = base_url + '/Roles/getRol/' + idrol;
            request.open("GET", ajaxUrl, true);
            request.send();

            request.onreadystatechange = function() {
                if (request.readyState == 4 && request.status == 200) {
                    var objData = JSON.parse(request.responseText);
                    if (objData.status) {
                        document.querySelector("#idRol").value = objData.data.idrol;
                        document.querySelector("#txtNombre").value = objData.data.nombrerol;
                        document.querySelector("#txtDescripcion").value = objData.data.descripcion;

                        if (objData.data.status == 1) {
                            var optionSelect = '<option value="1" selected class="notBlock">Activo</option>';
                        } else {
                            var optionSelect = '<option value="2" selected class="notBlock">Inactivo</option>';
                        }
                        var htmlSelect = `${optionSelect}
                                          <option value="1">Activo</option>
                                          <option value="2">Inactivo</option>
                                        `;
                        document.querySelector("#listStatus").innerHTML = htmlSelect;
                        $('#modalFormRol').modal('show');
                    } else {
                        swal("Error", objData.msg, "error");
                    }
                }
            }

        });
    });
}