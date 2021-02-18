
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
						<div id="msg_forgot" class="alert" style="display:none;">
	                        <small class="msg_forgot"></small>
	                    </div>
						<?= form_open('forgot-password/submit', 'id="formForgot" method="post" accept-charset="utf-8"');?>

							<div class="input-group custom">
								<input type="email" id="user_email" name="user_email" class="form-control form-control-lg" placeholder="youremail@somewhere.domain" autofocus autocomplete="off" autocapitalize="none" autocorrect="off" required="required">
								<div class="input-group-append custom">
									<span class="input-group-text"><i class="icon-copy dw dw-email"></i></span>
								</div>
							</div>
							<div class="row text-center">
								<div class="col-sm-6">
									<div class="input-group mb-0">
										<a href="<?= base_url('login')?>" class="btn btn-secondary btn-lg btn-block">Try Login</a>
									</div>
								</div>
								<div class="clearfix"></div>
								<div class="col-sm-6">
									<div class="input-group mb-0">
										<input id="submitEmail" name="submit" class="btn btn-primary btn-lg btn-block" type="submit" value="Submit">
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