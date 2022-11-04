<?php
headerTienda($data);
// getModal('modalCarrito',$data);

$arrSlider = $data['slider'];
$arrBanner = $data['banner'];
$arrProductos = $data['productos'];
//para obtener el contenido de la pagina de inicio de la bd paso 3
$contentPage = "";
if (!empty($data['page'])) {
	$contentPage = $data['page']['contenido'];
}

?>
<!-- El carrito esta en views/templates/modals/ -->
<!-- Slider -->
<section class="section-slide">
	<div class="wrap-slick1">
		<div class="slick1">
			<?php
			for ($i = 0; $i < count($arrSlider); $i++) {
				$ruta = $arrSlider[$i]['ruta'];
			?>
				<?php
				if ($i == 1) {
					$descripcion =  "descripcion-slider-gatos";
					$nombre = "nombre-slider-gatos";
				}
				if ($i == 2) {
					$descripcion = "descripcion-slider-perros";
					$nombre = "nombre-slider-perros";
				}
				if ($i == 0) {
					$descripcion = "descripcion-slider-otros";
					$nombre = "nombre-slider-otros";
				}
				?>
				<div class="item-slick1" style="background-image: url(<?= $arrSlider[$i]['portada'] ?>);">
					<div class="container h-full">
						<div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
							<div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
								<span class="ltext-101 cl2 respon2" data-section="pagina-inicio" data-value="<?= $descripcion ?>">
									<?= $arrSlider[$i]['descripcion'] ?>
								</span>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
								<h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1" data-section="pagina-inicio" data-value="<?= $nombre ?>">
									<?= $arrSlider[$i]['nombre'] ?>
								</h2>
							</div>

							<div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
							<a href="<?= base_url() . '/tienda/categoria/' . $arrSlider[$i]['idcategoria'] . '/' . $ruta; ?>" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04">
									Ver productos
								</a>
							</div>
						</div>
					</div>
				</div>
			<?php } ?>


		</div>
	</div>
</section>


<!-- Banner -->
<div class="sec-banner bg0 p-t-80 p-b-50">
	<div class="container">
		<div class="row">

			<?php

			for ($j = 0; $j < count($arrBanner); $j++) {
				$ruta = $arrBanner[$j]['ruta'];
				if ($j == 1) {
					$nombre2 =  "descripcion-slider-gatos";
					$descripcion2 = "nombre-slider-gatos";
				} else if ($j == 2) {
					$nombre2 = "descripcion-slider-perros";
					$descripcion2 = "nombre-slider-perros";
				} else if ($j == 0) {
					$nombre2 = "descripcion-slider-otros";
					$descripcion2 = "nombre-slider-otros";
				}
			?>
				<div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					<!-- Block1 -->
					<div class="block1 wrap-pic-w">
						<img src="<?= $arrBanner[$j]['portada'] ?>" alt="<?= $arrBanner[$j]['portada'] ?>">

						<a href="<?= base_url() . '/tienda/categoria/' . $arrBanner[$j]['idcategoria'] . '/' . $ruta; ?>" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
							<span class="block1-name ltext-102 trans-04 p-b-8" data-section="pagina-inicio" data-value="<?= $nombre2 ?>">
									<?= $arrSlider[$j]['nombre'] ?>
								</span>

								<span class="block1-info stext-102 trans-04" data-section="pagina-inicio" data-value="<?= $descripcion2 ?>>">
									<?= $arrSlider[$j]['descripcion'] ?>
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
							<div class="block1-link stext-101 cl0 trans-09" data-section="pagina-inicio" data-value="boton-compra">
									Compra ahora
								</div>
							</div>
						</a>
					</div>
				</div>
			<?php } ?>

			<!-- <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					
					<div class="block1 wrap-pic-w">
						<img src="<?= media() ?>/tienda/images/banner-02.jpg" alt="IMG-BANNER">

						<a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Perro
								</span>

								<span class="block1-info stext-102 trans-04">
									Todo para tu perro
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									Compra ahora
								</div>
							</div>
						</a>
					</div>
				</div> -->

			<!-- <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
					
					<div class="block1 wrap-pic-w">
						<img src="<?= media() ?>/tienda/images/banner-03.jpg" alt="IMG-BANNER">

						<a href="product.html" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
							<div class="block1-txt-child1 flex-col-l">
								<span class="block1-name ltext-102 trans-04 p-b-8">
									Otras mascotas
								</span>

								<span class="block1-info stext-102 trans-04">
									Alguna otra mascota en casa? No hay problema,revisa nuestros productos
								</span>
							</div>

							<div class="block1-txt-child2 p-b-4 trans-05">
								<div class="block1-link stext-101 cl0 trans-09">
									Compra ahora
								</div>
							</div>
						</a>
					</div>
				</div> -->
		</div>
	</div>
</div>


<!-- Product -->
<section class="bg0 p-t-23 p-b-140">
	<div class="container">
		<div class="p-b-10">
		<h3 class="ltext-103 cl5" data-section="pagina-inicio" data-value="txt-cupon">
				Productos para tus mascotas
			</h3>
		</div>
		<div>
			<?= $contentPage ?>
		</div>



		<hr>

		<div class="flex-w flex-sb-m p-b-52">
			<div class="flex-w flex-l-m filter-tope-group m-tb-10">
			<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*" data-section="pagina-inicio" data-value="filtrado-1">
					Todos los productos
				</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".women" data-section="pagina-inicio" data-value="filtrado-2">
					Productos para perros
				</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men" data-section="pagina-inicio" data-value="filtrado-3">
					Productos para gatos
				</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bag"data-section="pagina-inicio" data-value="filtrado-4">
					Productos para otras mascotas
				</button>

				<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".shoes"data-section="pagina-inicio" data-value="filtrado-5">
					Ofertas
				</button>
			</div>

			<div class="flex-w flex-c-m m-tb-10">
				<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
					<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
					<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Filtrar
				</div>

				<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
					<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
					<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
					Buscar
				</div>
			</div>

			<!-- Search product -->
			<div class="dis-none panel-search w-full p-t-10 p-b-15">
				<div class="bor8 dis-flex p-l-15">
					<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>

					<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
				</div>
			</div>

			<!-- Filter -->
			<div class="dis-none panel-filter w-full p-t-10">
				<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
					<div class="filter-col1 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">
							Ordenar por
						</div>

						<ul>
							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									Defecto
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									Agregados recientemente
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									Average rating
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
									Novedad
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									Precio: Menor a Mayor
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									Precio: Mayor a Menor
								</a>
							</li>
						</ul>
					</div>

					<div class="filter-col2 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">
							Precio
						</div>

						<ul>
							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
									Mostrar todos
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									$0.00 - $50.00
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									$50.00 - $100.00
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									$100.00 - $150.00
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									$150.00 - $200.00
								</a>
							</li>

							<li class="p-b-6">
								<a href="#" class="filter-link stext-106 trans-04">
									$200.00+
								</a>
							</li>
						</ul>
					</div>

					<div class="filter-col3 p-r-15 p-b-27">
						<div class="mtext-102 cl2 p-b-15">
							Color
						</div>

						<ul>
							<li class="p-b-6">
								<span class="fs-15 lh-12 m-r-6" style="color: #222;">
									<i class="zmdi zmdi-circle"></i>
								</span>

								<a href="#" class="filter-link stext-106 trans-04">
									Negro
								</a>
							</li>

							<li class="p-b-6">
								<span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
									<i class="zmdi zmdi-circle"></i>
								</span>

								<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
									Azul
								</a>
							</li>

							<li class="p-b-6">
								<span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
									<i class="zmdi zmdi-circle"></i>
								</span>

								<a href="#" class="filter-link stext-106 trans-04">
									Gris
								</a>
							</li>

							<li class="p-b-6">
								<span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
									<i class="zmdi zmdi-circle"></i>
								</span>

								<a href="#" class="filter-link stext-106 trans-04">
									Verde
								</a>
							</li>

							<li class="p-b-6">
								<span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
									<i class="zmdi zmdi-circle"></i>
								</span>

								<a href="#" class="filter-link stext-106 trans-04">
									Rojo
								</a>
							</li>

							<li class="p-b-6">
								<span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
									<i class="zmdi zmdi-circle-o"></i>
								</span>

								<a href="#" class="filter-link stext-106 trans-04">
									Blanco
								</a>
							</li>
						</ul>
					</div>

					<div class="filter-col4 p-b-27">
						<div class="mtext-102 cl2 p-b-15">
							Etiquetas
						</div>

						<div class="flex-w p-t-4 m-r--5">
							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Fashion
							</a>

							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Lifestyle
							</a>

							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Denim
							</a>

							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Streetstyle
							</a>

							<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
								Crafts
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row isotope-grid">
			<?php
			for ($p = 0; $p < count($arrProductos); $p++) {
				$ruta = $arrProductos[$p]['ruta'];
				if (count($arrProductos[$p]['images']) > 0) {
					$portada = $arrProductos[$p]['images'][0]['url_image'];
				} else {
					$portada = media() . '/images/uploads/product.png';
				}
			?>
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item women">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="<?= $portada ?>" alt="<?= $arrProductos[$p]['nombre'] ?>">
							<a href="<?= base_url() . '/tienda/producto/' . $arrProductos[$p]['idproducto'] . '/' . $ruta; ?>" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								Ver producto
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="<?= base_url() . '/tienda/producto/' . $arrProductos[$p]['idproducto'] . '/' . $ruta; ?>" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									<?= $arrProductos[$p]['nombre'] ?>
								</a>

								<span class="stext-105 cl3">
									<?= SMONEY . formatMoney($arrProductos[$p]['precio']); ?>
								</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<img class="icon-heart1 dis-block trans-04" src="<?= media() ?>/tienda/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="<?= media() ?>/tienda/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
						</div>
					</div>
				</div>
			<?php } ?>

		</div>
		<!-- Load more -->
		<div class="flex-c-m flex-w w-full p-t-45">
		<a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04" data-section="pagina-inicio" data-value="boton-ver-mas">
				Ver más
			</a>
		</div>
	</div>

	<!-- <div class="container text-center p-t-80">
			<hr>
					
		</div> -->
</section>



<?php footerTienda($data); ?>