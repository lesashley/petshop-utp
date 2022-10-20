document.addEventListener('DOMContentLoaded', function () {
    paypal.Buttons({
        createOrder: (data, actions) => {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: total
                    }
                }]
            });
        },
        onApprove: (data, actions) => {
            return actions.order.capture().then(function (details) {
                let direccion = document.querySelector("#txtDireccion").value;
                let ciudad = document.querySelector("#txtCiudad").value;
                let inttipopago = 1;
                let request = (window.XMLHttpRequest) ?
                    new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
                let ajaxUrl = base_url + '/Tienda/procesarVenta';
                let formData = new FormData();
                formData.append('direccion', direccion);
                formData.append('ciudad', ciudad);
                formData.append('inttipopago', inttipopago);
                formData.append('datapay', JSON.stringify(details));
                request.open("POST", ajaxUrl, true);
                request.send(formData);
                request.onreadystatechange = function () {
                    if (request.readyState !== 4) return;
                    if (request.status === 200) {
                        let objData = JSON.parse(request.responseText);
                        if (objData.status) {
                            window.location = base_url + "/Tienda/confirmarpedido/";
                        } else {
                            swal("", objData.msg, "error");
                        }
                    }
                }
            });
        }
    }).render('#paypal-btn-container');
}, false);