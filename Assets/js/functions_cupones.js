let tableCupones;
tableCupones = $('#tableCupones').dataTable({
    "aProcessing": true,
    "aServerSide": true,
    "language": {
        "url": "//cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
    },
    "ajax": {
        "url": " " + base_url + "/Cupon/getCupones",
        "dataSrc": ""
    },
    "columns": [
        { "data": "id" },
        { "data": "cupon" },
        { "data": "porcentaje" },
        { "data": "fecha_inicio" },
        { "data": "fecha_fin" },
        { "data": "cantidad" },
        { "data": "total" },
        { "data": "estado" },
        { "data": "options" }

    ],
    'dom': 'lBfrtip',
    'buttons': [{
        "extend": "copyHtml5",
        "text": "<i class='far fa-copy'></i> Copiar",
        "titleAttr": "Copiar",
        "className": "btn btn-secondary"
    }, {
        "extend": "excelHtml5",
        "text": "<i class='fas fa-file-excel'></i> Excel",
        "titleAttr": "Esportar a Excel",
        "className": "btn btn-success"
    }, {
        "extend": "pdfHtml5",
        "text": "<i class='fas fa-file-pdf'></i> PDF",
        "titleAttr": "Esportar a PDF",
        "className": "btn btn-danger"
    }, {
        "extend": "csvHtml5",
        "text": "<i class='fas fa-file-csv'></i> CSV",
        "titleAttr": "Esportar a CSV",
        "className": "btn btn-info"
    }],
    "resonsieve": "true",
    "bDestroy": true,
    "iDisplayLength": 10,
    "order": [
        [0, "desc"]
    ]
});

function openModal() {
    rowTable = "";
    document.querySelector('#idCategoria').value = "";
    document.querySelector('.modal-header').classList.replace("headerUpdate", "headerRegister");
    document.querySelector('#btnActionForm').classList.replace("btn-info", "btn-primary");
    document.querySelector('#btnText').innerHTML = "Guardar";
    document.querySelector('#titleModal').innerHTML = "Nuevo Cupón";
    document.querySelector("#formCategoria").reset();
    $('#modalFormCupones').modal('show');
    removePhoto();
}