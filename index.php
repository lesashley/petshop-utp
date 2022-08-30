     
    <?php require_once 'app/config.php';

//print_r(get_products());
//die;
    //renderizado de la vista
$data=[
    'title'=>'PetShop Proyecto',
    'products'=>get_products() 
] ;

//print_r(get_product_by_id(1));
//$_SESSION['prueba']=$data;
// get_cart();
// print_r($_SESSION);
// die;


// $_SESSION['cart']['products']=get_product_by_id(1);

//session_destroy(); //destruir la sesion

//$producto = get_product_by_id(4);
//print_r($producto); //para verificar que efectivamente se obtiene el producto que se quiere obtener

//add_to_cart(5);
//print_r(get_cart());
//print_r(calculate_cart_totals());

 render_view('carrito_view',$data);
 //require_once 'views/carrito_view.php'
 
 ?>


    