
	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>Notification Recipient</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<?= base_url() ?>">SIMONSTER</a></li>
								<li class="breadcrumb-item active">Notification Recipient</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="card-box mb-30 pd-20">
				<div class="row pd-20">
                    <div class="col-md-10">
						<h2 class="h4">Recipient Lists</h2>
					</div>
                    <div class="col-md-2">
						<?= button($btn_add, TRUE, 'a', 'href="#" class="btn btn-sm add-recipient btn-primary" data-toggle="modal" data-target="#recipient"');?>
					</div>
				</div>
				<div id="delete_msg" class="alert" style="display:none;">
                    <small class="delete_msg"></small>
                </div>
				<div class="table-responsive">
					<table id="recipients" class="table table-striped table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Email</th>
								<th scope="col" width="200px">Action</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($recipients as $recipient) :?>
							<tr>
								<td><?= $recipient->email_address ?></td>
								<td>
									<?= button($btn_edit, FALSE, 'a', 'href="#" class="btn btn-small btn-warning edit-recipient" data-toggle="modal" data-target="#recipient" data-id="'.encrypt($recipient->email_id).'"');?>
                                    <?= button($btn_delete, FALSE, 'a', 'href="#" data-id="'.encrypt($recipient->email_id).'" class="btn delete btn-small btn-danger"');?>
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

	<div class="modal fade" id="recipient" tabindex="-1" role="dialog" aria-labelledby="Recipient" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="recipientAction"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="recipient_msg" class="alert" style="display:none;">
	                    <small class="recipient_msg"></small>
	                </div>

                    <?= form_open('', 'id="recipientForm" method="post" data-parsley-validate');?>

                    <input type="hidden" id="email_id" name="email_id" value="">

                    <div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Email Address</label>
						<div class="col-sm-12 col-md-10">
	                    	<input type="email" id="email_address" name="email_address" class="form-control" placeholder="recipientname@somewhere.domain" required="required">
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