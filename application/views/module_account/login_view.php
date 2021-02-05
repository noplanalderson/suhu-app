	<div class="login-header box-shadow" style="background:#031e23">
		<div class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="login.html">
					<?= show_image('onelove-logo-light.png', 'image', 'alt="Logo"')?>
				</a>
			</div>
			<div class="login-menu">
				<ul>
					<li><a class="text-white" href="register.html">Daftar</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7">
					<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<?= show_image('register-page-img.png', 'image', 'alt="Produk1" class="d-block w-100"') ?>
							</div>
							<div class="carousel-item">
								<?= show_image('login-page-img.png', 'image', 'alt="Produk2" class="d-block w-100"') ?>
							</div>
							<div class="carousel-item">
								<?= show_image('remedy-amico.svg', 'image', 'alt="Produk3" class="d-block w-100"') ?>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="col-md-6 col-lg-5">
					<div id="msg_login" class="alert" style="display:none;">
                        <small class="msg_login"></small>
                    </div>
					<div class="login-box bg-dark box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-white">Login Aplikasi One Love</h2>
						</div>
						<?= form_open('login/auth', 'id="formLogin" method="post" accept-charset="utf-8"');?>

							<div class="input-group custom">
								<input type="text" id="user_name" name="user_name" class="form-control form-control-lg" placeholder="Username" autofocus autocomplete="off" autocapitalize="none" autocorrect="off" required="required">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" id="user_password" name="user_password" class="form-control form-control-lg" placeholder="**********" required="required" autocapitalize="none" autocorrect="off" autocomplete="off">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="row pb-30">
								<div class="col-6">
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="ingat_aku" name="ingat_aku" style="margin-left:-2.2rem;" value="1">
										<label class="text-white" for="ingat_aku">Ingat Saya</label>
									</div>
								</div>
								<div class="col-6">
									<div class="forgot-password">
										<a class="text-white" href="forgot-password.html">Lupa Kata Sandi</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<div class="input-group mb-0">
										<a class="btn btn-secondary btn-lg btn-block" href="register.html">Daftar</a>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="input-group mb-0">
										<input id="submitLogin" name="submit" class="btn btn-primary btn-lg btn-block" type="submit" value="Masuk">
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>