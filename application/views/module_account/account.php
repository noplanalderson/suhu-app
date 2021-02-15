
<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>Account Setting</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<?= base_url() ?>">SIMONSTER</a></li>
								<li class="breadcrumb-item active">Account Setting</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="card-box mb-30 pd-20">
				<div class="row pd-20">
                    <div class="col-md-12">
						<h2 class="h4">Your Account</h2>
					</div>
				</div>
				<div id="account_msg" class="alert" style="display:none;">
                    <small class="account_msg"></small>
                </div>
				<?= form_open_multipart('account-setting/submit', 'id="accountForm" method="post" data-parsley-validate');?>

                <div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Username *</label>
					<div class="col-sm-12 col-md-10">
						<input type="hidden" id="uid" name="uid" value="<?= encrypt($account->user_id)?>">
                    	<input type="text" id="user_name" name="user_name" class="form-control" placeholder="username" value="<?= $account->user_name ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Password *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="password" id="user_password" name="user_password" class="form-control" placeholder="********" required="required" autocomplete="off">
                    	<small class="text-danger">Password must contain Uppercase, Lowercase, Numeric, and Symbols min. 8 Characters</small>
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Repeat Password *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="password" id="user_password_repeat" name="user_password_repeat" class="form-control" placeholder="********" required="required" autocomplete="off">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Full Name *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="text" id="user_realname" name="user_realname" class="form-control" placeholder="Full Name" value="<?= $account->user_realname ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Email *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="email" id="user_email" name="user_email" class="form-control" placeholder="yourname@somewhere.domain" value="<?= $account->user_email ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Picture</label>
					<div class="col-sm-12 col-md-10">
						<input type="hidden" id="old_picture" name="old_picture" value="<?= $account->user_picture ?>">
                    	<input type="file" id="user_picture" name="user_picture" class="form-control">
					</div>
				</div>

				<div class="form-group row">
					<div class="col-sm-12 col-md-12">
                    	<button id="submit" class="btn btn-success pull-right ml-2" type="submit" name="submit">Submit</button>
                    	<button class="btn btn-secondary pull-right" type="reset" data-dismiss="modal">Reset</button>
					</div>
				</div>
				</form>
			</div>
			<div class="footer-wrap pd-20 card-box" style="bottom: 0;">
				<?= $this->app->footer_text ?> &copy; <?= date('Y') ?>
			</div>
		</div>
	</div>