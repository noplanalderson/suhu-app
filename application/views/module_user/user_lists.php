
	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>User Management</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<?= base_url() ?>">SIMONSTER</a></li>
								<li class="breadcrumb-item active">User Management</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="card-box mb-30 pd-20">
				<div class="row pd-20">
                    <div class="col-md-10">
						<h2 class="h4">User Lists</h2>
					</div>
                    <div class="col-md-2">
						<?= button($btn_add, TRUE, 'a', 'href="#" class="btn btn-sm add-user btn-primary" data-toggle="modal" data-target="#user"');?>
					</div>
				</div>
				<div id="delete_msg" class="alert" style="display:none;">
                    <small class="delete_msg"></small>
                </div>
				<div class="table-responsive">
					<table id="users" class="table table-striped table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th scope="col">Name</th>
								<th scope="col">Username</th>
								<th scope="col">Email</th>
								<th scope="col">User Type</th>
								<th scope="col">Status</th>
								<th scope="col" width="200px">Action</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($users as $user) :?>
							<tr>
								<td><?= $user->user_realname ?></td>
								<td><?= $user->user_name ?></td>
								<td><?= $user->user_email ?></td>
								<td><?= $user->type_name ?></td>
								<td><?= $user->is_active ?></td>
								<td>
									<?= button($btn_edit, FALSE, 'a', 'href="#" class="btn btn-small btn-warning edit-user" data-toggle="modal" data-target="#user" data-id="'.encrypt($user->user_id).'"');?>
                                    <?= button($btn_delete, FALSE, 'a', 'href="#" data-id="'.encrypt($user->user_id).'" class="btn delete btn-small btn-danger"');?>
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

	<div class="modal fade" id="user" tabindex="-1" role="dialog" aria-labelledby="User" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="userAction"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="user_msg" class="alert" style="display:none;">
	                    <small class="user_msg"></small>
	                </div>

                    <?= form_open('', 'id="userForm" method="post" data-parsley-validate');?>

                    <input type="hidden" id="user_id" name="user_id" value="">

                    <div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Username</label>
						<div class="col-sm-12 col-md-10">
	                    	<input type="text" id="user_name" name="user_name" class="form-control" placeholder="Username" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Full Name</label>
						<div class="col-sm-12 col-md-10">
	                    	<input type="text" id="user_realname" name="user_realname" class="form-control" placeholder="Full Name" required="required">
						</div>
					</div>

                    <div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Email Address</label>
						<div class="col-sm-12 col-md-10">
	                    	<input type="email" id="user_email" name="user_email" class="form-control" placeholder="user@somewhere.domain" required="required">
						</div>
					</div>

					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">User Type</label>
						<div class="col-sm-12 col-md-10">
							<select name="type_id" id="type_id" class="form-control" required="required">
								<option value="">Choose User Type</option>
								<?php foreach ($types as $type) :?>

									<option value="<?= $type->type_id ?>"><?= $type->type_name ?></option>
								<?php endforeach;?>

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