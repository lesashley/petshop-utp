<?php 

require_once 'app/config.php';


//prueba de respuesta json
// $products=  get_products(); //obtener todos los productos  
// $response = 
// [
// 'status' => 200,
// 'mensaje' => 'ok',
// 'data' =>$products
// ]; //respuesta de la peticion 



//funcion para sacar un jsaon en pantalla
// echo json_encode($response); //enviar respuesta en formato json 

//print_r($_SERVER['REQUEST_METHOD']);//revisar el metodo que se esta solicitando

if(!isset($_POST['action'])){//si no existe la accion 
    // $response = [
    //     'status' => 400,
    //     'mensaje' => 'Accion no definida'
    // ];
    http_response_code(403);//codigo de error
    echo json_encode(['status'=>403]);//enviar respuesta en formato json
    die;
}

$action = $_POST['action'];//obtener la accion 
//get cart

switch($action){
    case 'get': //en minisculas o como este escrito para evitar errores
        $cart=get_cart();//obtener el carrito de compras 
        $output='';
        
        if(!empty($cart['products'])){
            $output .=' <!--final carrito total para concatenar el html se usa . -->
        <div class="table-responsive">
        <table class="table table-hover table-sm table-striped">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th class="text-center">Precio</th>
                    <th class="text-center">Cantidad</th>
                    <th class="text-end">Total</th>
                    <th class="text-end"></th>
                </tr>
            </thead>
            <tbody>';
            foreach($cart['products']as $p ){
                $output.= '
         
                <tr>
                    <td class="align-middle">
                        '.$p['nombre'].'
                       <small class="d-block text-muted"> SKU '.$p['sku'].'</small>
                    </td>
                    <td class="text-end align-middle">'.format_currence($p['precio']).'
                    </td>
                    <td class="align-middle text-center" width="5%">
                    <input data-cantidad ="'.$p['cantidad'].'" data-id="'.$p['id'].'" type="text" class="form-control form-control-small do_update_cart" value="'.$p['cantidad'].'">
                    </td>
                    <td class="text-end align-middle">'.format_currence(floatval($p['cantidad']*$p['precio'])).'</td>
                    <td class="text-end align-middle">
                    <button class="btn btn-sm btn-danger do_delete_from_cart" data-id="'.$p['id'].'">
                        <i class="fa fa-trash"></i>
                        </button>
                  </td>
                </tr>';
            }

            $output.='</tbody>

          
            
            
        </table>
        </div>
        <button class="btn btn-sm btn-primary do_destroy_cart">Vaciar Carrito</button>
        <!--final del carrito--> ';
        }else{
            $output.='
            <div class="alert alert-warning">
            <div class="text-center">
                <h4 class="alert-heading">Carrito vacio</h4>
                <img src="'.IMAGES.'carrito_vacio.png'.'" alt="empty cart" class="img-fluid" style="width:100px;">
                <p class="mb-0">No hay productos en el carrito de compras.</p>
           </div>
            </div>';
        }
   
        $output.=
        '<br>
    <!--carrito total-->
    <table class="table">
        <tr>
            <th class="border-0"> Subtotal</th>
            <td class="text-success text-end border-0">'.format_currence($cart['cart_totals']['subtotal']).'</td>
        </tr>
        <tr>
            <th> Envio</th>
            <td class="text-success text-end">'.format_currence($cart['cart_totals']['shipment']).'</td>
        </tr>
        <tr>
            <th class="align-middle"> Total</th>
            <td class="text-success text-end">
                <h3 class="fw-bold">'.format_currence($cart['cart_totals']['total']).'</h3>
            </td>
        </tr>
    </table>
    <!--final carrito total-->
    <!--payment form-->
    <br>
    <form  class="mt-4" action="" id="do_pay">
    <legend>Completa el formulario</legend>
            <div class="form-group">
                <label for="card_name" class="form-label mt-4" >Nombre del titular de la tarjeta</label>
                <input type="text" class="form-control" name="card_name" id="card_name" placeholder="Ingrese el nombre del titular de la tarjeta">
            </div>
            
               
                
            <div class="form-group row">
                <div class="col-xl-6">
                    <label for="card_number" class="form-label mt-4" >Numero de la tarjeta</label>
                    <input type="text" class="form-control" name="card_number" id="card_number" placeholder="Ingrese el numero de la tarjeta">
                </div>
                <div class="col-xl-3">
                <label for="card_date" class="form-label mt-4" >MM/AA</label>
                <input type="text" class="form-control" name="card_date" id="card_date" placeholder="MM/AA">
                </div>
                <div class="col-xl-3">
                <label for="card_cvc" class="form-label mt-4" >CVC</label>
                <input type="text" class="form-control" name="card_cvc" id="card_cvc" placeholder="CVC">
                </div>
            </div>
            <div class="form-group">
                <label for="card_email" class="form-label mt-4" >E-mail</label>
                <input type="text" class="form-control" name="card_email" id="card_email" placeholder="Ingrese el correo electronico">
            </div>
            <div class="d-grid gap-2">
            <button type="submit" class="btn btn-primary btn-success btn-lg mt-4">Pagar Ahora</button>   
            </div>
    </form>
    <!--final payment form-->
    <!--Botton pagar-->
   ';
        

        json_output(200,'OK',$output);
    break;

    case 'post'://agregar producto
    if(!isset($_POST['id'],$_POST['cantidad'])){
      //  json_output(400,'Product ID is required');
      json_output(403,'ERROR');
    }
    if(!add_to_cart($_POST['id'],$_POST['cantidad'])){
        json_output(400,'No se pudo agregar al carrito,intenta de nuevo');
    }
    json_output(201,'Agregado al carrito');
    break;
    

    case 'put': //actualizar el carrito
    if(!isset($_POST['id'],$_POST['cantidad'])){
            json_output(403,'Product ID is required');
     }
    if(!update_cart_product((int)$_POST['id'],(int)$_POST['cantidad'])){
    json_output(400,'No se pudo actualizar el carrito,intenta de nuevo');
        }
    json_output(200,'Actualizado correctamente');
     break;


    case 'destroy': //eliminar el carrito
        if(!destroy_cart()){
        json_output(400,'No se pudo vaciar el carrito');
        }
     json_output(200);
    break;
    case 'delete': //eliminar un producto del carrito
        if(!isset($_POST['id'])){
            json_output(403,'Product ID is required');//codigo de error
        }
        if(!delete_from_cart((int)$_POST['id'])){
            json_output(400,'No se pudo borrar el carrito,intenta de nuevo');
        }
    json_output(200);
    break;

    case 'pay':
        parse_str($_POST['data'],$_POST);
        if(!isset($_POST['card_name'],$_POST['card_number'],$_POST['card_date'],$_POST['card_cvc'],$_POST['card_email'])){ //verificar que se hayan enviado los datos
            json_output(400,'Todos los campos son requeridos, completa todos los campos e intenta de nuevo');
        }

        $card = [
            'name'=> 'John Doe',
            'number'=> '4242424242424242',
            'month'=> '12',
            'year'=> '20',
            'cvc'=> '123'

        ];

        if(!filter_var($_POST['card_email'],FILTER_VALIDATE_EMAIL)){//validar correo electronico
            json_output(400,'El correo electronico no es valido');
        }
        
        $errors=0;
        //validar nombre
        if($_POST['card_name'] !==$card['name']){
            $errors++;
        }
        //validar numero de tarjeta
        // if(clean_string(str_replace(' ','',$_POST['card_number'])) !==clean_string(str_replace(' ','',$card['card_number']))){
        //     $errors++;
        // }
        if(clean_string(str_replace(' ','',$_POST['card_number'])) !==$card['number']){
            $errors++;
        }
        //validar fecha de expiracion
        if(!empty($_POST['card_date'])){ 
              $date=explode('/',$POST['card_date']);
        if(count($date) <2){
            $errors++;
        }
        if(clean_string($date[0])!==$card['month'] ){
            $errors++;
        }
        if(clean_string($date[1])!==$card['year'] ){
            $errors++;
        }
        //validar cvc

        if(clean_string($_POST['card_cvc'])!==$card['cvc'] ){
            $errors++;
        }
         }else{
            $errors++;
         }

        //verificar si hay algun error
        if($errors > 0){
            json_output(400,'Los datos de la tarjeta no son validos, verifica los datos e intenta de nuevo');
        } 
        break;
    
    default:
        json_output(403,'Accion no definida');
  
    break;  
}
