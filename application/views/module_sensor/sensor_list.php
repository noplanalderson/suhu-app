
<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>Sensor Management</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<?= base_url() ?>">SIMONSTER</a></li>
								<li class="breadcrumb-item active">Sensor Management</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="card-box mb-30 pd-20">
				<div class="row pd-20">
                    <div class="col-md-10">
						<h2 class="h4">Sensor List</h2>
					</div>
                    <div class="col-md-2">
						<?= button($btn_add, TRUE, 'a', 'href="#" class="btn btn-sm add-sensor btn-primary" data-toggle="modal" data-target="#sensor"');?>
					</div>
				</div>
				<div id="delete_msg" class="alert" style="display:none;">
                    <small class="delete_msg"></small>
                </div>
				<div class="table-responsive">
					<table id="sensor_list" class="table table-striped table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Sensor URL</th>
								<th scope="col">Installed Date</th>
								<th scope="col">Sensor Location</th>
								<th scope="col">Cron Schedule</th>
								<th scope="col">Status</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($sensors as $sensor) :?>

							<tr>
								<td scope="col"><?= $sensor->thermo_url ?></td>
								<td scope="col"><?= date('d F Y', $sensor->installation_date) ?></td>
								<td scope="col"><?= $sensor->thermo_location ?></td>
								<td scope="col"><?= $sensor->cron_schedule ?></td>
								<td scope="col"><?= ($sensor->is_active == 'yes' ) ? 'Active' : 'Not Active'; ?></td>
								<td scope="col">
									<?= button($btn_edit, FALSE, 'a', 'href="#" class="btn btn-small btn-warning edit-sensor" data-toggle="modal" data-target="#sensor" data-id="'.$sensor->thermo_hash.'"');?>
                                    <?= button($btn_delete, FALSE, 'a', 'href="#" data-id="'.$sensor->thermo_hash.'" class="btn delete btn-small btn-danger"');?>
								</td>
							</tr>
							<?php endforeach;?>

						</tbody> 
					</table>
				</div>
			</div>
			<div class="footer-wrap pd-20 card-box" style="bottom: 0;">
				<?= $this->app->footer_text ?> &copy; <?= date('Y') ?>
			</div>
		</div>
	</div>

	<div class="modal fade" id="sensor" tabindex="-1" role="dialog" aria-labelledby="Sensor" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="sensorAction"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="sensor_msg" class="alert" style="display:none;">
	                    <small class="sensor_msg"></small>
	                </div>

                    <?= form_open('', 'id="sensorForm" method="post" data-parsley-validate');?>

                    <input type="hidden" id="thermo_hash" name="thermo_hash" value="">

                    <div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Sensor URL</label>
						<div class="col-sm-12 col-md-10">
	                    	<input type="url" id="thermo_url" name="thermo_url" class="form-control" placeholder="http://ip_address" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Sensor Location</label>
						<div class="col-sm-12 col-md-10">
	                    	<input type="text" id="thermo_location" name="thermo_location" class="form-control" placeholder="Location" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Cronjob Setting (min-hour-date-month-day of week)</label>
						<div class="col-sm-2 col-md-2">
	                    	<input type="text" id="minute" name="minute" class="form-control" placeholder="*" required="required">
						</div>
						<div class="col-sm-2 col-md-2">
	                    	<input type="text" id="hour" name="hour" class="form-control" placeholder="*" required="required">
						</div>
						<div class="col-sm-2 col-md-2">
	                    	<input type="text" id="date" name="date" class="form-control" placeholder="*" required="required">
						</div>
						<div class="col-sm-2 col-md-2">
	                    	<input type="text" id="month" name="month" class="form-control" placeholder="*" required="required">
						</div>
						<div class="col-sm-2 col-md-2">
	                    	<input type="text" id="day_of_week" name="day_of_week" class="form-control" placeholder="*" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Sensor Status</label>
						<div class="col-sm-12 col-md-10">
	                    	<select name="is_active" id="is_active" class="form-control">
	                    		<option value="yes">Active</option>
	                    		<option value="no">Not Active</option>
	                    	</select>
						</div>
					</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="reset" data-dismiss="modal">Reset</button>
                    <button id="submit" class="btn btn-success" type="submit" name="submit"></button>
                    </form>
           		</div>
            </div>
        </div>
    </div>