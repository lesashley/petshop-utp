<?php 
headerTienda($data);

$subtotal = 0;
$total = 0;
foreach ($_SESSION['arrCarrito'] as $producto) {
	$subtotal += $producto['precio'] * $producto['cantidad'];
}
$total = $subtotal + COSTOENVIO;

?>
<script src="https://www.paypal.com/sdk/js?client-id=<?=CLIENT_ID_PRUEBA?>&currency=<?=CURRENCY?>"></script>
 <br><br><br>
<hr>
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="<?= base_url() ?>" class="stext-109 cl8 hov-cl1 trans-04">
				Inicio
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4">
				<?= $data['page_title'] ?>
			</span>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
				<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-l-25 m-r--38 m-lr-0-xl">
					<div>
					<?php 
						if(isset($_SESSION['login'])){
					?>
						<div>
							<label for="tipopago">Dirección de envío</label>
							<div class="bor8 bg0 m-b-12">
								<input id="txtDireccion" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="state" placeholder="Dirección de envío">
							</div>
							<div class="bor8 bg0 m-b-22">
								<input id="txtCiudad" class="stext-111 cl8 plh3 size-111 p-lr-15" type="text" name="postcode" placeholder="Ciudad / Estado">
							</div>
						</div>
					<?php }else{ ?>

						<ul class="nav nav-tabs" id="myTab" role="tablist">
						  <li class="nav-item">
						    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#login" role="tab" aria-controls="home" aria-selected="true">Iniciar Sesión</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#registro" role="tab" aria-controls="profile" aria-selected="false">Crear cuenta</a>
						  </li>
						</ul>
						<div class="tab-content" id="myTabContent">
						  <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="home-tab">
						  	<br>
						  	<form id="formLogin">
							  <div class="form-group">
							    <label for="txtEmail">Usuario</label>
							    <input type="email" class="form-control" id="txtEmail" name="txtEmail">
							  </div>
							  <div class="form-group">
							    <label for="txtPassword">Contraseña</label>
							    <input type="password" class="form-control" id="txtPassword" name="txtPassword">
							  </div>
							  <button type="submit" class="btn btn-primary">Iniciar sesión</button>
							</form>

						  </div>
						  <div class="tab-pane fade" id="registro" role="tabpanel" aria-labelledby="profile-tab">
						  	<br>
						  	<form id="formRegister"> 
						 		<div class="row">
									<div class="col col-md-6 form-group">
										<label for="txtNombre">Nombres</label>
										<input type="text" class="form-control valid validText" id="txtNombre" name="txtNombre" required="">
									</div>
									<div class="col col-md-6 form-group">
										<label for="txtApellido">Apellidos</label>
										<input type="text" class="form-control valid validText" id="txtApellido" name="txtApellido" required="">
									</div>
						 		</div>
						 		<div class="row">
									<div class="col col-md-6 form-group">
										<label for="txtTelefono">Teléfono</label>
										<input type="text" class="form-control valid validNumber" id="txtTelefono" name="txtTelefono" required="" onkeypress="return controlTag(event);">
									</div>
									<div class="col col-md-6 form-group">
										<label for="txtEmailCliente">Email</label>
										<input type="email" class="form-control valid validEmail" id="txtEmailCliente" name="txtEmailCliente" required="">
									</div>
						 		</div>
								<button type="submit" class="btn btn-primary">Regístrate</button>
						 	</form>
						  </div>
						</div>

					<?php } ?>
					</div>
				</div>
			</div>

			<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
				<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
					<h4 class="mtext-109 cl2 p-b-30">
						Resumen
					</h4>

					<div class="flex-w flex-t bor12 p-b-13">
						<div class="size-208">
							<span class="stext-110 cl2">
								Subtotal:
							</span>
						</div>

						<div class="size-209">
							<span id="subTotalCompra" class="mtext-110 cl2">
								<?= SMONEY.formatMoney($subtotal) ?>
							</span>
						</div>

						<div class="size-208">
							<span class="stext-110 cl2">
								Envío:
							</span>
						</div>

						<div class="size-209">
							<span class="mtext-110 cl2">
								<?= SMONEY.formatMoney(COSTOENVIO) ?>
							</span>
						</div>
					</div>
					<div class="flex-w flex-t p-t-27 p-b-33">
						<div class="size-208">
							<span class="mtext-101 cl2">
								Total:
							</span>
						</div>

						<div class="size-209 p-t-1">
							<span id="totalCompra" class="mtext-110 cl2">
								<?= SMONEY.formatMoney($total) ?>
							</span>
						</div>
					</div>
					<hr>
<?php 
	if(isset($_SESSION['login'])){
?>
					<div id="divMetodoPago">
						<div id="divCondiciones">
							<input type="checkbox" id="condiciones">
							<label for="condiciones"> Aceptar </label>
							<a href="#" data-toggle="modal" data-target="#modalTerminos" data-backdrop="static" data-keyboard="false"> Términos y Condiciones </a>
						</div>
						<div id="optMetodoPago" class="notblock">
							<hr>
							<h4 class="mtext-109 cl2 p-b-30">
								Método de pago
						</h4>
							<div class="divmetodpago">
								<div>
								<label for="paypal">
								<input type="radio" id="paypal" class="methodpago" name="payment-method" checked="" value="Paypal">
								<img src="<?= media()?>/images/img-paypal.jpg" alt="Icono de PayPal" class="ml-space-sm" width="74" height="20">
									</label>
								</div>
								<div>
									<label for="contraentrega">
									<input type="radio" id="contraentrega" class="methodpago" name="payment-method" value="CT">
									<span>Contra Entrega</span>
									</label>
								</div>
								<div id="divtipopago" class="notblock" >
									<label for="listtipopago">Tipo de pago</label>
									<div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
									<select id="listtipopago" class="js-select2" name="listtipopago">
									<?php 
										if(count($data['tiposPago']) > 0){ 
											foreach ($data['tiposPago'] as $tipopago) {
												if($tipopago['idtipopago'] != 1){
									?>
										<option value="<?= $tipopago['idtipopago']?>"><?= $tipopago['tipopago']?></option>
									<?php
												}
											}
									} ?>
									</select>
									<div class="dropDownSelect2"></div>
								</div>
								</div>
								<div id="msgpaypal">
									<p>Para completar la transacción, te enviaremos a los servidores seguros de PayPal.</p>
									<div id="paypal-btn-container"></div>
									<script>
										let total = <?= $total ?>;
									</script>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<br>
					
					<button type="submit" id="btnComprar" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer notblock">Pagar</button>
<?php } ?>
				</div>
			</div>
		</div>
	</div>

<!-- Modal -->
<div class="modal fade" id="modalTerminos" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Términos y Condiciones</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<p style="text-align: justify;">Etiam lobortis suscipit pretium. Nulla dapibus massa justo, at pretium lectus malesuada eget. Ut hendrerit urna viverra leo consequat molestie. Sed aliquet elit at metus vehicula posuere. Donec hendrerit, est vitae tristique maximus, odio libero venenatis massa, id congue tellus lacus vitae velit. Curabitur condimentum eros et urna blandit, vel viverra eros ornare. Curabitur dapibus lorem dolor, nec pulvinar nisi rutrum at. Fusce consequat, magna in ullamcorper lobortis, quam augue malesuada tellus, sagittis pharetra erat diam ut sem. Quisque et consequat nunc, et laoreet est. Cras dictum diam cursus sem pellentesque, a faucibus urna malesuada. Etiam a orci diam. Phasellus at nibh sed augue cursus fringilla. Cras a egestas augue. In sit amet justo magna. In maximus varius consectetur.</p>
		<br>
		<p style="text-align: justify;">Phasellus eros metus, molestie et suscipit nec, varius non augue. Vestibulum maximus, mauris vitae iaculis faucibus, turpis dui finibus elit, elementum posuere nulla est quis leo. Donec ac nisl non sapien convallis posuere. Aliquam in lorem id ligula auctor tincidunt. Aenean aliquam lacinia ultricies. Pellentesque malesuada a leo sed pretium. Vivamus eu dictum arcu, ut vehicula ligula. Cras pulvinar metus augue. Fusce ultricies velit vitae nunc venenatis pretium. In mollis bibendum est.
		</p>
		<br>
		<p style="text-align: justify;">Nulla facilisi. Quisque blandit pretium ex eget ornare. Quisque hendrerit malesuada augue, id convallis arcu gravida at. Sed a erat id lectus suscipit molestie sit amet sed libero. Curabitur tincidunt vel ante in dignissim. In eget ornare purus, id suscipit libero. Donec eget venenatis lacus. Cras convallis libero metus, et venenatis felis porta a. Aenean sit amet est ut erat porta interdum. Integer vel mi consectetur, facilisis justo eget, posuere risus. Aliquam posuere augue non nulla molestie, eget imperdiet elit tincidunt. Suspendisse potenti. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aenean quis pulvinar libero, ultrices bibendum augue.
		</p>
		<br>
		<p style="text-align: justify;">Praesent ut risus tincidunt, eleifend quam ac, ornare ipsum. Nullam et tellus ut libero maximus lobortis. Donec nec placerat metus, a maximus urna. Suspendisse eu massa non nisl vulputate condimentum. Proin fringilla urna id congue aliquet. Proin vehicula dapibus neque, ac ullamcorper neque tempus et. Proin gravida egestas augue, ut dapibus elit sodales vitae. Morbi sed malesuada nulla, non ullamcorper metus. Donec urna diam, facilisis in rhoncus convallis, interdum non magna. Praesent arcu enim, congue nec porttitor ut, rhoncus ullamcorper lectus. Maecenas in purus in ex suscipit tincidunt sed sit amet tellus. Sed pellentesque mauris non pulvinar elementum.
		</p>
		<br>
      </div>
      <div class="modal-footer">
		<button type="button" id="btnComprar" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer w-25" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
	<script src="<?= media() ?>/js/functions_procesarpagos.js"></script>
<?php 
	footerTienda($data);
 ?>
	