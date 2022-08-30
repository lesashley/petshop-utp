<?php

function get_products(){
    $products = require APP.'products.php'; //quitar require_once para poder reutilizar la funcion, dara error en caso contrario.
    return $products;
}
//obtener productos por id
function get_product_by_id($id){
    $products = get_products(); //obtener productos 
    foreach($products as $i =>$v){//recorrer productos 
        if($v['id']==$id){//comparar id con el id del producto que se quiere obtener
            return $products[$i ] ;//retornar el producto que se quiere obtener
        }
    }
    return false; //si no se encuentra el producto retornar false
}

function render_view($view, $data = []){//renderizar vistas con datos 
    if(!is_file(VIEWS.$view.'.php')){
        echo 'no existe la vista'.$view;
        die;
    }
    require_once VIEWS.$view.'.php';
}

//fomatear numero de precios con separador de miles

function format_currence($number,$symbol='S/.'){ 
    if(!is_float($number) && !is_integer($number)){
        $number = 0;
    }
     return $symbol.number_format($number,2,'.',',');//formatear numero de precios con separador de miles y decimales 
}
   


//FUNCIONES DEL CARRITO DE COMPRAS

function get_cart(){
    //productos
       //id
       //SKU
       //nombre
       //precio
       //cantidad
        //imagen
        
        
    //total de productos
    //subtotal
    //cantidad
    //total
    //url pago

    if(isset($_SESSION['cart'])){//si existe la sesion cart 
        $_SESSION['cart']['cart_totals']=calculate_cart_totals();
        return $_SESSION['cart'];//retornar el contenido de la sesion cart
    }

    $cart=[
        'products'=>[],
        'cart_totals'=> calculate_cart_totals(),
        'url_payment'=>NULL
        
    ];
    
    $_SESSION['cart']=$cart;//si no existe la sesion cart 
    return $_SESSION['cart'];//retornar el contenido de la sesion cart

}

function calculate_cart_totals(){ //calcular totales del carrito de compras 

    //primera vez que se carga el carrito, todo en 0
    //el carrito no existe, se inicializa
    //si no hay productos en el carrito,pero el carrito si existe
    if( !isset($_SESSION['cart'])||empty($_SESSION['cart']['products'])){//si no existe la sesion cart o si el carrito esta vacio
        $cart_totals=[
           
            
            'subtotal'=>0,
            'shipment'=>0,
            'total'=>0,
           
            
        ];

//$_SESSION['cart']['cart_totals']=$cart_totals;//si no existe la sesion cart 
//return $_SESSION['cart']['cart_totals'];//retornar el contenido de la sesion cart
return $cart_totals; //retornar el contenido de la sesion cart para usarlas en $cart
    }


//calcular los totales segun los productos del carrito de compras

$subtotal=0;

$shipment=SHIPPING_COST;
$total =0;

// //si no hay productos en el carrito de compras pero el carrito existe
// if(empty($_SESSION['cart']['products'])){// comprando si el carrito de compras esta vacio 
//     $cart_totals=[
//         'subtotal'=>0,
//         'shipment'=>0,
//         'total'=>0,
        
//     ];
//     $_SESSION['cart']['cart_totals']=$cart_totals;
//     return $cart_totals;//retornar los totales
// } 

//si ya hay productos , hay que sumar las cantidades de los productos del carrito de compras y calcular totales

foreach($_SESSION['cart']['products'] as $p){//recorrer productos del carrito de compra 
  $_total =floatval($p['cantidad']*$p['precio']);//calcular total de producto
    $subtotal=floatval($subtotal+$_total);//sumar total de producto al subtotal, floatval para que no redondee y use todas las cosas decimales
}
$total=floatval($subtotal+$shipment);//sumar subtotal y envio al total
$cart_totals=[
    'subtotal'=>$subtotal,
    'shipment'=>$shipment,
    'total'=>$total,
    
];

$_SESSION['cart']['cart_totals']=$cart_totals;
return $cart_totals;//retornar los totales
}

 //funcion agregar al carrito
function add_to_cart($id_producto,$cantidad=1){//agregar producto al carrito de compras 
    $new_product=[
        'id'=>NULL,
        'sku'=>NULL,
        'nombre'=>NULL,
        'cantidad'=>NULL,
        'precio'=>NULL,
        'imagen'=>NULL
    ];
    
    $product=get_product_by_id($id_producto);//obtener producto por id , se obtendra false si no existe el producto
    if(!$product){
        return false;//si no existe el producto retornar false
    }

    $new_product=
    [
        'id'=>$product['id'],
        'sku'=>$product['sku'],
        'nombre'=>$product['nombre'],
        'cantidad'=>$cantidad,
        'precio'=>$product['precio'],
        'imagen'=>$product['imagen']
    ];
     //si no existe el carrito , no existe el producto   
     //agregar producto al carrito de compras
     if(!isset($_SESSION['cart']['products'])||empty($_SESSION['cart']['products'])){
         $_SESSION['cart']['products'][]=$new_product; //agregar producto al carrito de compras
         return true;
     }

    //si existe el producto, se agrega al carrito de compras , primero loopear en el array todos los productos
    //y si el producto ya existe, se suma la cantidad
     foreach($_SESSION['cart']['products'] as $i=>$p){//recorrer productos del carrito de compras
         if($p['id']== $id_producto){//si el producto ya existe en el carrito de compras
                //$p['cantidad']=floatval($p['cantidad']++);//sumar cantidad al producto existente
                $_cantidad=$p['cantidad'] + $cantidad;//sumar cantidad al producto existente
                $p['cantidad']=$_cantidad;//sumar cantidad al producto existente
                $_SESSION['cart']['products'][$i]=$p;//agregar producto al carrito de compras
             return true;
         } 
            
         }
         //si el producto no existe en el carrito de compras, se agrega al carrito de compras
         $_SESSION['cart']['products'][]=$new_product; //agregar producto al carrito de compras
            return true;
     }

 function update_cart_product($id_producto,$cantidad=1){//actualizar cantidad de producto en el carrito de compras
 //si no existe el carrito , no existe el producto   
   
     if(!isset($_SESSION['cart'])||empty($_SESSION['cart']['products'])){ //
        return false;
    }
   //si existe el producto, se agrega al carrito de compras , primero loopear en el array todos los productos
   //y si el producto ya existe, se suma la cantidad
    foreach($_SESSION['cart']['products'] as $i=>$p){//recorrer productos del carrito de compras
        if($id_producto ===$p['id']){//si el producto ya existe en el carrito de compras
               $p['cantidad']=(int)$cantidad;//cambiar el numero de la cantidad por el que se pone en el formulario
               $_SESSION['cart']['products'][$i]=$p;//agregar producto al carrito de compras
            return true;
        } 
           
        }
           return false;
    }


     
    //pruebaxD-
    // $cart = get_cart();//obtener carrito de compras
    // $cart['products'][]=$product;//agregar producto al carrito de compras
    // $_SESSION['cart']=$cart;//actualizar carrito de compras
    // return $_SESSION['cart'];//retornar carrito de compras
function destroy_cart(){
    unset($_SESSION['cart']);//eliminar carrito de compras
    //session_destroy();//destruir sesion usar si no hay variables de sesion (de usuario)
    return true;
}

function delete_from_cart($id_producto){//eliminar producto del carrito de compras
   if(!isset($_SESSION['cart'])||empty($_SESSION['cart']['products'])){ // comprobar si no existe el carrito de compras o esta vacio 
       return false;
    }
   foreach($_SESSION['cart']['products'] as $index=>$p){//recorrer productos del carrito de compras
       if($id_producto === $p['id']){//si el producto existe en el carrito de compras   
        unset($_SESSION['cart']['products'][$index]);//eliminar producto del carrito de compras
        return true;
       }
   }
   return false;
}

function json_output($status=200,$msg='' ,$data=[]){ //funcion para enviar respuesta json 
    http_response_code($status);
    $r=
    [  'status' => $status, //codigo de respuesta
        'mensaje' => $msg, //mensaje de respuesta
        'data' =>$data //datos de respuesta
    ];
    
 echo json_encode($r);
 die;

}

function clean_data($data){ //funcion para limpiar datos
    $data=trim($data);//limpiar espacios en blanco
    $data=rtrim($data);//limpiar espacios en blanco derecha
    $data=ltrim($data);//limpiar espacios en blanco izquierda
    //$data=stripslashes($data);//eliminar barras invertidas
    //$data=htmlspecialchars($data);//limpiar caracteres especiales
    return $data;

}