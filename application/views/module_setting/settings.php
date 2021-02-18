
<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>Application Setting</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<?= base_url() ?>">SIMONSTER</a></li>
								<li class="breadcrumb-item active">Application Setting</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="card-box mb-30 pd-20">
				<div id="setting_msg" class="alert" style="display:none;">
                    <small class="setting_msg"></small>
                </div>
				<?= form_open_multipart('app-settings/submit', 'id="appForm" method="post" data-parsley-validate');?>

                <div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Application Title *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="text" id="app_title" name="app_title" class="form-control" placeholder="Application Title" value="<?= $setting->app_title ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Application Title Alt *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="text" id="app_title_alt" name="app_title_alt" class="form-control" placeholder="Application Title (Alt)" value="<?= $setting->app_title_alt ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Company Name *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="text" id="company_name" name="company_name" class="form-control" placeholder="Company Name" value="<?= $setting->company_name ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Footer Text *</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="text" id="footer_text" name="footer_text" class="form-control" placeholder="Footer Text" value="<?= $setting->footer_text ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Fetch Data Time (in seconds)*</label>
					<div class="col-sm-12 col-md-10">
                    	<input type="number" min="60" max="7200" id="fetch_data_time" name="fetch_data_time" class="form-control" placeholder="Range 60-7200" value="<?= $setting->fetch_data_time/1000; ?>" required="required">
					</div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Application Icon</label>
					<div class="col-sm-12 col-md-10">
						<input type="hidden" id="old_app_icon" name="old_app_icon" value="<?= $setting->app_icon ?>">
                    	<input type="file" id="app_icon" name="app_icon" class="form-control">
					</div>
					<div id="icon_msg" class="alert" style="display:none;">
	                    <small class="icon_msg"></small>
	                </div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Application Logo Dark</label>
					<div class="col-sm-12 col-md-10">
						<input type="hidden" id="old_app_logo_dark" name="old_app_logo_dark" value="<?= $setting->app_logo_dark ?>">
                    	<input type="file" id="app_logo_dark" name="app_logo_dark" class="form-control">
					</div>
					<div id="logo_dark_msg" class="alert" style="display:none;">
	                    <small class="logo_dark_msg"></small>
	                </div>
				</div>

				<div class="form-group row">
					<label class="col-sm-12 col-md-2 col-form-label">Application Logo Light</label>
					<div class="col-sm-12 col-md-10">
						<input type="hidden" id="old_app_logo_light" name="old_app_logo_light" value="<?= $setting->app_logo_light ?>">
                    	<input type="file" id="app_logo_light" name="app_logo_light" class="form-control">
					</div>
					<div id="logo_light_msg" class="alert" style="display:none;">
	                    <small class="logo_light_msg"></small>
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
				<?= $setting->footer_text ?> &copy; <?= date('Y') ?>
			</div>
		</div>
	</div>