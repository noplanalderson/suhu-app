	<div class="main-container">
		<div class="pd-ltr-20">
			<?php foreach ($sensors as $sensor) :?>
			<div class="card-box mb-30 pd-20">
				<h2 class="h4 mb-20"><?= $sensor->thermo_location ?></h2>
				<div class="row ml-5 text-center">
					<div class="col-xl-4">
						<div style="width: 250px; height: 250px; border-radius: 250px;">
						    <canvas id="temp_<?= $sensor->thermo_hash ?>" width="250" height="180">[No canvas support]</canvas>
						    <p style="margin-top:-1rem;font-size: 8pt">50°C<br/>Temperature (°C)</p>
						</div>
					</div>
					<div class="col-xl-4">
						<div style="width: 250px; height: 250px; border-radius: 250px;">
						    <canvas id="hum_<?= $sensor->thermo_hash ?>" width="250" height="180">[No canvas support]</canvas>
						    <p style="margin-top:-1rem;font-size: 8pt">50%<br/>Humidity (%)</p>
						</div>
					</div>
					<div class="col-xl-4">
						<div style="width: 250px; height: 250px; border-radius: 250px;">
						    <canvas id="dew_<?= $sensor->thermo_hash ?>" width="250" height="180">[No canvas support]</canvas>
						    <p style="margin-top:-1rem;font-size: 8pt">16°C<br/>Dew Point (°C)</p>
						</div>
					</div>
				</div>
			</div>
			<?php endforeach; ?>
			<div class="card-box mb-30 pd-20">
				<h2 class="h4 pd-20">Logs (Monthly)</h2>
				<div class="responsive ml-4">
					<table id="logs" style="width:97%" class="table display table-striped table-bordered table-responsive">
						<thead>
							<tr>
								<th>Time</th>
								<th>Message</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			<div class="footer-wrap pd-20 mb-20 card-box">
				<?= $this->app->footer_text ?> &copy; <?= date('Y') ?>
			</div>
		</div>
	</div>