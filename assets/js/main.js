$(document).ready(function() {

    //Cargar el carrito
    //$('#cart-wrapper').html('prueba si esta vacio');

    function load_cart() { //Cargar el carrito
        var load_wrapper = $('#load_wrapper');
        var wrapper = $('#cart_wrapper'); //Accion a realizar
        action = 'get'; //Accion a realizar
        //wrapper.waitMe('hide'); //Mostrar el spinner de carga

        //peticion ajax
        $.ajax({ //peticion ajax para cargar el carrito de compras
            url: 'ajax.php', //url del archivo ajax.php
            type: 'POST', //tipo de peticion ajax GET
            dataType: 'JSON', //tipo de datos ajax json (se usa para recibir datos de una peticion ajax) 
            data: {
                action: action //accion a realizar en el archivo ajax.php (get) xq toma la accion get para cargar el carrito de compras

            }, //datos a enviar ajax
            beforeSend: function() { //antes de enviar la peticion
                load_wrapper.waitMe() //mostrar el spinner de carga
            }

            //promesas (COMPROMETIDO A REGRESARTE ALGO;ERROR ;RESPUESTA O LO QUE SEA)
        }).done(function(res) { //si se ejecuta la peticion ajax
            // console.log('Done'); //imprimir la respuesta de la peticion ajax
            //validacion de la respuesta de la peticion ajax

            if (res.status === 200) {


                setTimeout(() => { //esperar un tiempo de 1 segundo para mostrar el spinner de carga y ocultarlo despues de ese tiempo de espera 
                    wrapper.html(res.data); //mostrar el contenido de la respuesta de la peticion ajax
                    load_wrapper.waitMe('hide'); //ocultar el spinner de carga 

                }, 1000);

                // $('#prueba').val(res.data); //mostrar el contenido de la respuesta de la peticion ajax en un input para pruebas
                //$('#prueba').attr('placeholder', res.data); //cambiar el mensaje de placeholder del input para pruebas
                //si la respuesta es exitosa
                // console.log(res);
            } else {
                Swal.fire('Error', 'No se pudo cargar el carrito de compras', 'error'); //mostrar un mensaje de error
                wrapper.html('intenta de nuevo, por favorss');
                return true;
            }


        }).fail(function() { //si la peticion falla
            //console.log(err); //imprimir el error
            Swal.fire('ERROR'); //mostrar una alerta de error
            return false; //retornar false para parar la ejecucion del script
        }).always(function() { //si la peticion se ejecuta correctamente o falla osea siempre se ejecuta
            //console.log("ejecutando always");
            //tiempo de espera en milisegundos
        });
    };

    load_cart(); //llamamos a la funcion load_cart para cargar el carrito al cargar la pagina 

    //Agregar el carro al dar click en boton


    $('.do_add_to_cart').on('click', function(event) { //evento click para agregar el carrito de compras')
        event.preventDefault(); //prevenir el evento por defecto del boton, prevenir alguna accion/(Subtmit) por defecto del formulario/ redireección a otra pagina

        var id = $(this).data('id'); //obtener el id del producto al dar click en el boton  de agregar al carrito de compras
        cantidad = $(this).data('cantidad'); //obtener la cantidad del producto al dar click en el boton  de agregar al carrito de compras
        action = 'post'; // accion a realizar en el archivo ajax.php (post) xq toma la accion post para agregar el producto al carrito de compras
        //Swal.fire('Hola' + id); //mostrar una alerta de confirmacion

        //peticion ajax
        $.ajax({ //peticion ajax para agregar el producto al carrito de compras
            url: 'ajax.php', //url del archivo ajax.php
            type: 'POST', //tipo de peticion ajax POST
            dataType: 'JSON', //tipo de datos ajax json (se usa para recibir datos de una peticion ajax)
            cache: false, //no cachear la peticion ajax para evitar errores de caché en el navegador 
            data: {
                action,
                id,
                cantidad

            },
            beforeSend: function() { //antes de enviar la peticion
                //$('#cart-wrapper').waitMe(); //mostrar el spinner de carga
                console.log('Agregando...');
            }
        }).done(function(res) { //si se ejecuta la peticion ajax
            if (res.status === 201) { //si la respuesta es exitosa, osea se agrego el producto al carrito de compras
                Swal.fire('Exito', 'Producto agregado al carrito de compras', 'success'); //mostrar un mensaje de exito
                load_cart(); //cargar el carrito de compras
                return;
            } else {
                Swal.fire('Error', 'No se pudo agregar el producto al carrito de compras', 'error'); //mostrar un mensaje de error
                return;
            }
        }).fail(function(err) { //si la peticion falla
        }).always(function() { //si la peticion se ejecuta correctamente o falla osea siempre se ejecuta

        });

    });
    //Actualizar las cantidaddes del carro si el producto ya existe dentro


    //Actualizar carro con input
    $('body').on('blur', '.do_update_cart', do_update_cart); //evento focus para actualizar el carrito de compras con un input


    function do_update_cart(event) {
        // console.log($(this).val()); //imprimir el valor del input
        var input = $(this), //obtener el input que se esta actualizando
            cantidad = parseInt(input.val()), //obtener la cantidad del input
            id = input.data('id'), //obtener el id del input
            action = 'put',
            cant_original = parseInt(input.data('cantidad')); //obtener la cantidad original del input

        //validar que el numero ingresado sea mayor a 0 y menor a 99 y que sea numeros enteros
        if (Math.floor(cantidad) !== cantidad || !$.isNumeric(cantidad)) {
            cantidad = 1;
        }
        if (cantidad < 1) {
            //Swal.fire('Error', 'La cantidad debe ser mayor a 0', 'error'); //mostrar un mensaje de error
            cantidad = 1; //si la cantidad es 0 o menor a 0 se le asigna 1
        } else if (cantidad > 99) {
            //Swal.fire('Error', 'La cantidad no debe ser mayor a 99', 'error'); //mostrar un mensaje de error
            cantidad = 99; //si la cantidad es mayor a 99 se le asigna 99
        }
        //console.log(cantidad);

        if (cantidad === cant_original)
            return false; //si la cantidad que se inserta no es diferente no se ejecuta la peticion ajax

        $.ajax({ //peticion ajax para actualizar el carrito de compras
            url: 'ajax.php', //url del archivo ajax.php
            type: 'POST', //tipo de peticion ajax POST
            dataType: 'JSON', //tipo de datos ajax json (se usa para recibir datos de una peticion ajax)
            data: {
                action,
                id,
                cantidad
            }
        }).done(function(res) { //si se ejecuta la peticion ajax
            if (res.status === 200) { //si la respuesta es exitosa, osea se agrego el producto al carrito de compras
                Swal.fire('Exito', 'Producto actualizado', 'success'); //mostrar un mensaje de exito
                load_cart(); //cargar el carrito de compras
                return;
            } else {
                Swal.fire('Error', 'No se pudo actualizar el producto', 'error'); //mostrar un mensaje de error
                return;
            }
        }).fail(function(err) { //si la peticion falla
            //console.log(err); //imprimir el error
            Swal.fire('ERROR'); //mostrar una alerta de error
            //retornar false para parar la ejecucion del script
        }).always(function() { //si la peticion se ejecuta correctamente o falla osea siempre se ejecuta
            //console.log("ejecutando always");
        });

    }

    //Borrar elemento del carro
    $('body').on('click', '.do_delete_from_cart', delete_from_cart); //evento click para borrar el producto del carrito de compras')
    function delete_from_cart(event) { //funcion para borrar el producto del carrito de compras
        var confirmation,
            id = $(this).data('id'), //obtener el id del producto al dar click en el boton  de agregar al carrito de compras
            action = 'delete'; // accion a realizar en el archivo ajax.php (post) xq toma la accion post para agregar el producto al carrito de compras

        confirmation = confirm('¿Estas seguro de querer eliminar este producto del carrito de compras?'); //confirmar si se quiere borrar el producto del carrito de compras

        if (!confirmation) return;

        //peticion ajax
        $.ajax({ //peticion ajax para agregar el producto al carrito de compras
            url: 'ajax.php', //url del archivo ajax.php
            type: 'POST', //tipo de peticion ajax POST
            dataType: 'JSON', //tipo de datos ajax json (se usa para recibir datos de una peticion ajax)
            data: {
                action,
                id
            }
        }).done(function(res) { //si se ejecuta la peticion ajax
            if (res.status === 200) { //si la respuesta es exitosa, osea se agrego el producto al carrito de compras
                Swal.fire('Exito', 'Producto eliminado del carrito de compras', 'success'); //mostrar un mensaje de exito
                load_cart(); //cargar el carrito de compras
                return;
            } else {
                Swal.fire('Error', res.msg, 'error'); //mostrar un mensaje de error
                return;
            }
        }).fail(function(err) { //si la peticion falla
            Swal.fire('Error', 'No se pudo eliminar el producto del carrito de compras', 'error'); //mostrar un mensaje de error
        }).always(function() {});

    }

    //Vaciar carro
    $('body').on('click', '.do_destroy_cart', destroy_cart); //evento click para vaciar el carrito de compras') body es el elemento padre y esta desde el inicio del documento hasta el final del documento

    function destroy_cart(event) {

        event.preventDefault();
        //console.log($(this));
        var action = 'destroy';



        $.ajax({
            url: 'ajax.php',
            type: 'POST',
            dataType: 'JSON',
            data: {
                action
            }

        }).done(function(res) {

            if (res.status === 200) {
                const swalWithBootstrapButtons = Swal.mixin({
                    customClass: {
                        confirmButton: 'btn btn-success',
                        cancelButton: 'btn btn-danger'
                    },
                    buttonsStyling: false
                })

                swalWithBootstrapButtons.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, delete it!',
                    cancelButtonText: 'No, cancel!',
                    reverseButtons: true
                }).then((result) => {
                    if (result.isConfirmed) {
                        swalWithBootstrapButtons.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                        load_cart();
                        return;
                    } else if (

                        /* Read more about handling dismissals below */
                        result.dismiss === Swal.DismissReason.cancel
                    ) {
                        swalWithBootstrapButtons.fire(
                            'Cancelled',
                            'Your imaginary file is safe :)',
                            'error'
                        )


                    }
                    return;
                })
            }

        }).fail(function(err) {
            Swal.fire('Error', 'Error,intenta de nuevo', 'error');

        }).always(function() {




        });
    }

    //realizar pago
    $('body').on('submit', '#do_pay', do_pay); //evento submit para realizar el pago
    function do_pay(event) {
        event.preventDefault(); //para que no se manden los datos sin existir carrito de compras
        var form = $(this);
        data = form.serialize(); //obtener los datos del formulario y unirlas en un string (cadena de texto  )
        action = 'pay';
        $.ajax({ //peticion ajax para agregar el producto al carrito de compras
            url: 'ajax.php', //url del archivo ajax.php
            type: 'POST', //tipo de peticion ajax POST
            dataType: 'JSON', //tipo de datos ajax json (se usa para recibir datos de una peticion ajax)
            data: {
                action,
                data
            }
        }).done(function(res) { //si se ejecuta la peticion ajax
            if (res.status === 200) { //si la respuesta es exitosa, osea se agrego el producto al carrito de compras
                Swal.fire('Exito', 'Pago realizado con exito', 'success'); //mostrar un mensaje de exito
                load_cart(); //cargar el carrito de compras
                return;
            } else {
                Swal.fire('Error', res.msg, 'error'); //mostrar un mensaje de error
                return;
            }
        }).fail(function(err) { //si la peticion falla
            Swal.fire('Error', 'No se llevo a cabo la compra, intenta de nuevo', 'error'); //mostrar un mensaje de error
        }).always(function() {});
    }
});