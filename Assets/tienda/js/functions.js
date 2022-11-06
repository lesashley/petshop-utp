$(".js-select2").each(function() {
    $(this).select2({
        minimumResultsForSearch: 20,
        dropdownParent: $(this).next('.dropDownSelect2')
    });
});

$('.parallax100').parallax100();

$('.gallery-lb').each(function() { // the containers for all your galleries
    $(this).magnificPopup({
        delegate: 'a', // the selector for gallery item
        type: 'image',
        gallery: {
            enabled: true
        },
        mainClass: 'mfp-fade'
    });
});

$('.js-addwish-b2').on('click', function(e) {
    e.preventDefault();
});

$('.js-addwish-b2').each(function() {
    var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
    $(this).on('click', function() {
        swal(nameProduct, "is added to wishlist !", "success");

        $(this).addClass('js-addedwish-b2');
        $(this).off('click');
    });
});

$('.js-addwish-detail').each(function() {
    var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

    $(this).on('click', function() {
        swal(nameProduct, "is added to wishlist !", "success");

        $(this).addClass('js-addedwish-detail');
        $(this).off('click');
    });
});

/*---------------------------------------------*/

$('.js-addcart-detail').each(function() {
    var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
    $(this).on('click', function() {
        let id = this.getAttribute('id');
        let cant = document.querySelector('#cant-product').value;

        if (isNaN(cant) || cant < 1) {
            swal("", "La cantidad debe ser mayor o igual que 1", "error");
            return;
        }
        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url + '/Tienda/addCarrito';
        let formData = new FormData();
        formData.append('id', id);
        formData.append('cant', cant);
        request.open("POST", ajaxUrl, true);
        request.send(formData);
        request.onreadystatechange = function() {
            if (request.readyState != 4) return;
            if (request.status == 200) {
                let objData = JSON.parse(request.responseText);
                if (objData.status) {
                    document.querySelector("#productosCarrito").innerHTML = objData.htmlCarrito;
                    //document.querySelectorAll(".cantCarrito")[0].setAttribute("data-notify",objData.cantCarrito);
                    //document.querySelectorAll(".cantCarrito")[1].setAttribute("data-notify",objData.cantCarrito);
                    const cants = document.querySelectorAll(".cantCarrito");
                    cants.forEach(element => {
                        element.setAttribute("data-notify", objData.cantCarrito)
                    });
                    swal(nameProduct, "¡Se agrego al carrito!", "success");
                } else {
                    swal("", objData.msg, "error");
                }
            }
            return false;
        }
    });
});

$('.js-pscroll').each(function() {
    $(this).css('position', 'relative');
    $(this).css('overflow', 'hidden');
    var ps = new PerfectScrollbar(this, {
        wheelSpeed: 1,
        scrollingThreshold: 1000,
        wheelPropagation: false,
    });

    $(window).on('resize', function() {
        ps.update();
    })
});


/*==================================================================
[ +/- num product ]*/
$('.btn-num-product-down').on('click', function() {
    let numProduct = Number($(this).next().val());
    let idpr = this.getAttribute('idpr');
    if (numProduct > 1) $(this).next().val(numProduct - 1);
    let cant = $(this).next().val();
    if (idpr != null) {
        fntUpdateCant(idpr, cant);
    }
});

$('.btn-num-product-up').on('click', function() {
    let numProduct = Number($(this).prev().val());
    let idpr = this.getAttribute('idpr');
    $(this).prev().val(numProduct + 1);
    let cant = $(this).prev().val();
    if (idpr != null) {
        fntUpdateCant(idpr, cant);
    }
});

//Actualizar producto
if (document.querySelector(".num-product")) {
    let inputCant = document.querySelectorAll(".num-product");
    inputCant.forEach(function(inputCant) {
        inputCant.addEventListener('keyup', function() {
            let idpr = this.getAttribute('idpr');
            let cant = this.value;
            if (idpr != null) {
                fntUpdateCant(idpr, cant);
            }
        });
    });
}

if (document.querySelector("#formRegister")) {
    let formRegister = document.querySelector("#formRegister");
    formRegister.onsubmit = function(e) {
        e.preventDefault();
        let strNombre = document.querySelector('#txtNombre').value;
        let strApellido = document.querySelector('#txtApellido').value;
        let strEmail = document.querySelector('#txtEmailCliente').value;
        let intTelefono = document.querySelector('#txtTelefono').value;

        if (strApellido == '' || strNombre == '' || strEmail == '' || intTelefono == '') {
            swal("Atención", "Todos los campos son obligatorios.", "error");
            return false;
        }

        let elementsValid = document.getElementsByClassName("valid");
        for (let i = 0; i < elementsValid.length; i++) {
            if (elementsValid[i].classList.contains('is-invalid')) {
                swal("Atención", "Por favor verifique los campos en rojo.", "error");
                return false;
            }
        }
        divLoading.style.display = "flex";
        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url + '/Tienda/registro';
        let formData = new FormData(formRegister);
        request.open("POST", ajaxUrl, true);
        request.send(formData);
        request.onreadystatechange = function() {
            if (request.readyState == 4 && request.status == 200) {
                let objData = JSON.parse(request.responseText);
                if (objData.status) {
                    window.location.reload(false);
                } else {
                    swal("Error", objData.msg, "error");
                }
            }
            divLoading.style.display = "none";
            return false;
        }
    }
}

if (document.querySelector(".methodpago")) {

    let optmetodo = document.querySelectorAll(".methodpago");
    optmetodo.forEach(function(optmetodo) {
        optmetodo.addEventListener('click', function() {
            if (this.value == "Paypal") {
                document.querySelector("#msgpaypal").classList.remove("notblock");
                document.querySelector("#divtipopago").classList.add("notblock");
                document.querySelector("#btnComprar").classList.add("notblock");
                document.querySelector("#hrComprar").classList.add("notblock");
            } else {
                document.querySelector("#msgpaypal").classList.add("notblock");
                document.querySelector("#divtipopago").classList.remove("notblock");
                document.querySelector("#btnComprar").classList.remove("notblock");
                document.querySelector("#hrComprar").classList.remove("notblock");
            }
        });
    });
}

function fntdelItem(element) {
    //Option 1 = Modal
    //Option 2 = Vista Carrito
    let option = element.getAttribute("op");
    let idpr = element.getAttribute("idpr");
    if (option == 1 || option == 2) {

        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url + '/Tienda/delCarrito';
        let formData = new FormData();
        formData.append('id', idpr);
        formData.append('option', option);
        request.open("POST", ajaxUrl, true);
        request.send(formData);
        request.onreadystatechange = function() {
            if (request.readyState != 4) return;
            if (request.status == 200) {
                let objData = JSON.parse(request.responseText);
                if (objData.status) {
                    if (option == 1) {
                        if (objData.cantCarrito == 0) {
                            let $base_url = base_url + '/tienda';
                            document.querySelector("#productosCarrito").innerHTML = '<div class="text-empty-cart"><div class="text-empty-cart">Agrega productos y da el primer paso para iniciar tu compra.</div><div class="img-empty-cart"><img src="/petshop-utp/Assets/tienda/images/img/EmptyCart.svg" alt="Oh my pet-Petshop"></div><div class="box-empty-cart"><h2>Carrito vacío</h2><button class="btn-ver-productos"><a href="'+$base_url+'">Ver productos</a></button></div></div>';
                        } else {
                            document.querySelector("#productosCarrito").innerHTML = objData.htmlCarrito;
                        }
                        const cants = document.querySelectorAll(".cantCarrito");
                        cants.forEach(element => {
                            element.setAttribute("data-notify", objData.cantCarrito)
                        });
                    } else {
                        element.parentNode.parentNode.remove();
                        document.querySelector("#subTotalCompra").innerHTML = objData.subTotal;
                        document.querySelector("#totalCompra").innerHTML = objData.total;
                        if (document.querySelectorAll("#tblCarrito tr").length == 1) {
                            window.location.href = base_url;
                        }
                    }
                } else {
                    swal("", objData.msg, "error");
                }
            }
            return false;
        }

    }
}

function fntUpdateCant(pro, cant) {
    if (cant <= 0) {
        document.querySelector("#btnComprar").classList.add("notblock");
    } else {
        document.querySelector("#btnComprar").classList.remove("notblock");
        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url + '/Tienda/updCarrito';
        let formData = new FormData();
        formData.append('id', pro);
        formData.append('cantidad', cant);
        request.open("POST", ajaxUrl, true);
        request.send(formData);
        request.onreadystatechange = function() {
            if (request.readyState != 4) return;
            if (request.status == 200) {
                let objData = JSON.parse(request.responseText);
                if (objData.status) {
                    let colSubtotal = document.getElementsByClassName(pro)[0];
                    colSubtotal.cells[4].textContent = objData.totalProducto;
                    document.querySelector("#subTotalCompra").innerHTML = objData.subTotal;
                    document.querySelector("#totalCompra").innerHTML = objData.total;
                } else {
                    swal("", objData.msg, "error");
                }
            }

        }
    }
    return false;



}


if (document.querySelector("#frmContacto")) {

    let frmContacto = document.querySelector("#frmContacto");

    frmContacto.addEventListener('submit', function(e) {
        e.preventDefault();
        let nombre = document.querySelector("#nombreContacto").value;
        let email = document.querySelector("#emailContacto").value;
        let mensaje = document.querySelector("#mensaje").value;
        if (nombre == "") {
            swal("", "El nombre es obligatorio", "error");
            return false;
        }
        if (!fntEmailValidate(email)) {
            swal("", "El email no es válido.", "error");
            return false;
        }
        if (mensaje == "") {
            swal("", "Por favor escribe el mensaje", "error");
            return false;
        }
        divLoading.style.display = "flex";
        let request = (window.XMLHttpRequest) ?
            new XMLHttpRequest() :
            new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url + '/Tienda/contacto';
        let formData = new FormData(frmContacto);
        request.open("POST", ajaxUrl, true);
        request.send(formData);
        request.onreadystatechange = function() {
            if (request.readyState != 4) return;
            if (request.status == 200) {
                console.log(request.responseText);
                let objData = JSON.parse(request.responseText);
                if (objData.status) {
                    swal("", objData.msg, "success");
                    document.querySelector("#frmContacto").reset();
                } else {
                    swal("", objData.msg, "error");
                }
            }
            divLoading.style.display = "none";
            return false;
        }
    }, false);

}

if(document.querySelector("#btnComprar")){
	let btnPago = document.querySelector("#btnComprar");
	btnPago.addEventListener('click',function() { 
		let dir = document.querySelector("#txtDireccion").value;
	    let ciudad = document.querySelector("#txtCiudad").value;
	    let inttipopago = document.querySelector("#listtipopago").value;
        let idcupon = document.querySelector("#hdIdCupon").value;
        if (inttipopago == "") {
            swal("", "Seleccione tipo de pago" , "info");
			return;
        }
	    else if(dir == "" || ciudad == "" ){
			swal("", "Complete datos de envío" , "info");
			return;
		}else{
			divLoading.style.display = "flex";
			let request = (window.XMLHttpRequest) ? 
	                    new XMLHttpRequest() : 
	                    new ActiveXObject('Microsoft.XMLHTTP');
			let ajaxUrl = base_url+'/Tienda/procesarVenta';
			let formData = new FormData();
		    formData.append('direccion', dir);    
		   	formData.append('ciudad', ciudad);
			formData.append('inttipopago', inttipopago);
            formData.append('total', total);
            formData.append('idCupon', idcupon);
		   	request.open("POST",ajaxUrl,true);
		    request.send(formData);
		    request.onreadystatechange = function(){
		    	if(request.readyState != 4) return;
		    	if(request.status == 200){
		    		let objData = JSON.parse(request.responseText);
		    		if(objData.status){
		    			window.location = base_url+"/Tienda/confirmarpedido/";
		    		}else{
		    			swal("", objData.msg , "error");
		    		}
		    	}
		    	divLoading.style.display = "none";
            	return false;
		    }
		}
	},false);
}

if(document.querySelector("#condiciones")){
	let opt = document.querySelector("#condiciones");
	opt.addEventListener('click', function(){
		let opcion = this.checked;
		if(opcion){
			document.querySelector('#optMetodoPago').classList.remove("notblock");
		}else{
			document.querySelector('#optMetodoPago').classList.add("notblock");
		}
	});
}

if (document.querySelector("#btnValidarCupon")) {

    let btnValidarCupon = document.querySelector("#btnValidarCupon");
    btnValidarCupon.addEventListener('click', function () {

        let cupon = document.getElementById("txtCupon").value;
        let spanTotal = document.getElementById("totalCompra");
        let spanTotalCupon = document.getElementById("totalCupon");
        let dsctoCupon = 0;
        
        if (cupon.trim() == '') {
            swal("Advertencia!", 'Ingresar cupón', "info");
            return;
        }
        
        let request = (window.XMLHttpRequest) ? new XMLHttpRequest() : new ActiveXObject('Microsoft.XMLHTTP');
        let ajaxUrl = base_url + '/Cupon/validar/' + cupon;
        request.open("GET", ajaxUrl, true);
        request.send();
        request.onreadystatechange = function () {

            if (request.readyState == 4 && request.status == 200) {

                let objData = JSON.parse(request.responseText);
                
                if (objData.status) {
                    
                    if(document.querySelector("#hdIdCupon").value == objData.data.id_cupon){
                        swal("Advertencia!", 'Cupón ingresado ya se encuentra aplicado en su pedido', "info");
                        return;
                    }
                    
                    dsctoCupon = (total * (objData.data.porcentaje_dscto / 100)).toFixed(2);
                    total = (total - dsctoCupon).toFixed(2);

                    document.querySelector("#hdIdCupon").value = objData.data.id_cupon;
                    document.querySelector("#dsctoCupon").innerHTML = '- S/. ' + dsctoCupon;
                    document.querySelector("#totalCupon").innerHTML = '&nbsp;&nbsp;&nbsp;S/. ' + total;

                    spanTotal.style.display = "none";
                    spanTotalCupon.style.display = "block";
                    swal("Correcto!", objData.msg, "success");

                } else {

                    total = totalPedido;
                    document.querySelector("#dsctoCupon").innerHTML = '- S/. 0.00';
                    document.querySelector("#hdIdCupon").value = "0";
                    spanTotal.style.display = "block";
                    spanTotalCupon.style.display = "none";
                    swal("Advertencia!", objData.msg, "info");

                }
            }
        }
    }, false);
}

if (document.querySelector("#btnRetirarCupon")) {

    let spanTotal = document.getElementById("totalCompra");
    let spanTotalCupon = document.getElementById("totalCupon");
    let btnValidarCupon = document.querySelector("#btnRetirarCupon");

    btnValidarCupon.addEventListener('click', function () {

        document.querySelector("#txtCupon").value = '';
        document.querySelector("#hdIdCupon").value = '0';
        document.querySelector("#dsctoCupon").innerHTML = '- S/. 0.00';
        total = totalPedido;
        spanTotal.style.display = "block";
        spanTotalCupon.style.display = "none";
        swal("Correcto!", "Cupón retirado correctamente", "success");

    }, false);  

}