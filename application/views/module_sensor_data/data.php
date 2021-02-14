
	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>Sensor Data</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<?= base_url() ?>">Sensor Data</a></li>
								<li class="breadcrumb-item active"><?= $sensor->thermo_location ?></li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="bg-white pd-20 card-box mb-30">
				<div id="sensorGraph"></div>
			</div>
			<div class="card-box mb-30 pd-20">
				<div class="row pd-20">
                    <div class="col-md-12">
						<h2 class="h4"><?= $sensor->thermo_location ?></h2>
					</div>
				</div>
				<div id="delete_msg" class="alert" style="display:none;">
                    <small class="delete_msg"></small>
                </div>
				<div class="table-responsive">
					<table id="sensor-data" class="table table-striped table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Date</th>
								<th scope="col">Temperature</th>
								<th scope="col">Humidity</th>
								<th scope="col">Dew Point</th>
							</tr>
						</thead>
						<tbody>
						</tbody> 
					</table>
				</div>
			</div>
			<div class="footer-wrap pd-20 card-box" style="bottom: 0;">
				<?= $this->app->footer_text ?> &copy; <?= date('Y') ?>
			</div>
		</div>
	</div>