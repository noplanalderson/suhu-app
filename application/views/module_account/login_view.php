
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container mt-lg-5">
			<div class="row align-items-center">
				<div class="col-md-12 col-lg-12">
					<div class="login-box bg-dark box-shadow border-radius-10">
						<div class="login-title text-center">
							<?= show_image('sites/'.$this->app->app_logo_light, 'image', 'alt="Logo"')?>
							<div class="clearfix"></div>
							<small class="text-white"><?= $this->app->app_title ?></small>
						</div>
						<div id="msg_login" class="alert" style="display:none;">
	                        <small class="msg_login"></small>
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
							<div class="row text-center">
								<div class="col-sm-6">
									<div class="input-group mb-0">
										<a href="<?= base_url('forgot-password') ?>" class="btn btn-secondary btn-md btn-block">Forgot Password</a>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="input-group mb-0">
										<input id="submitLogin" name="submit" class="btn btn-primary btn-md btn-block" type="submit" value="Login">
									</div>
								</div>
								<div class="col-sm-12 mt-5">
									<small class="text-white"><?= $this->app->footer_text ?><br/>
									Copyright &copy; <?= date('Y')?></small>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>