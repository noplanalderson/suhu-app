	<div class="error-page d-flex align-items-center flex-wrap justify-content-center pd-20">
		<div class="pd-10">
			<div class="error-page-wrap text-center">
				<h1><?= $heading ?></h1>
				<h3>Error: <?= $title ?></h3>
				<p><?= $message ?></p>
				<div class="pt-20 mx-auto max-width-200">
					<a href="<?= base_url() ?>" class="btn btn-primary btn-block btn-lg">Main Page</a>
				</div>
			</div>
		</div>
	</div>