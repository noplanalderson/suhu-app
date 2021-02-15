
	<div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container mt-lg-5">
			<div class="row align-items-center">
				<div class="col-md-12 col-lg-12">
					<div class="login-box bg-dark box-shadow border-radius-10">
						<div class="login-title text-center">
							<?= show_image($this->app->app_logo_light, 'image', 'alt="Logo"')?>
							<div class="clearfix"></div>
							<small class="text-white"><?= $this->app->app_title ?></small>
							<hr/>
							<h4 class="text-white">Account Activation</h4>
						</div>
						<div id="msg_active" class="alert" style="display:none;">
	                        <small class="msg_active"></small>
	                    </div>
						<?= form_open('go', 'id="formActivation" method="post" accept-charset="utf-8"');?>
							
							<input type="hidden" id="user_token" name="user_token" value="<?= $token ?>">

							<div class="input-group custom">
								<label class="col-sm-12 col-md-12 col-form-label text-white">Password</label>
								<div class="col-sm-12 col-md-12">
									<input type="password" id="user_password" name="user_password" class="form-control form-control-lg" placeholder="**********" required="required" autocapitalize="none" autocorrect="off" autocomplete="off">
									<div class="input-group-append custom mr-3">
										<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
									</div>
								</div>
							</div>
							<div class="input-group custom">
								<label class="col-sm-12 col-md-12 col-form-label text-white">Retype Password</label>
								<div class="col-sm-12 col-md-12">
									<input type="password" id="user_password_repeat" name="user_password_repeat" class="form-control form-control-lg" placeholder="**********" required="required" autocapitalize="none" autocorrect="off" autocomplete="off">
									<div class="input-group-append custom mr-3">
										<span class="input-group-text"><i class="dw dw-padlock1"></i></span>
									</div>
								</div>
							</div>
							<div class="row text-center">
								<div class="col-sm-12">
									<div class="input-group mb-0">
										<input id="submitPassword" name="submit" class="btn btn-primary btn-lg btn-block" type="submit" value="Submit">
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