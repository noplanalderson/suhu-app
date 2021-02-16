
	<div class="main-container">
		<div class="xs-pd-20-10 pd-ltr-20">
			<div class="page-header">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="title">
							<h4>Access Management</h4>
						</div>
						<nav aria-label="breadcrumb" role="navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<?= base_url() ?>">SIMONSTER</a></li>
								<li class="breadcrumb-item active">Access Management</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="card-box mb-30 pd-20">
				<div class="row pd-20">
                    <div class="col-md-10">
						<h2 class="h4">Access Lists</h2>
					</div>
                    <div class="col-md-2">
						<?= button($btn_add, TRUE, 'a', 'href="#" class="btn btn-sm add-access btn-primary" data-toggle="modal" data-target="#accessModal"');?>
					</div>
				</div>
				<div id="delete_msg" class="alert" style="display:none;">
                    <small class="delete_msg"></small>
                </div>
				<div class="table-responsive">
					<table id="access_lists" class="table table-striped table-bordered table-hover">
						<thead class="thead-dark">
							<tr>
								<th width="200px" scope="col">Access Type</th>
								<th scope="col">Privileges</th>
								<th scope="col" width="200px">Action</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($access as $acl) :?>
							<tr>
								<td><?= ucwords($acl->type_name) ?></td>
								<td><?= $this->access_m->getPrivByID($acl->type_id); ?></td>
								<td>
									<?= button($btn_edit, FALSE, 'a', 'href="#" class="btn btn-small btn-warning edit-access" data-toggle="modal" data-target="#accessModal" data-id="'.encrypt($acl->type_id).'"');?>
                                    <?= button($btn_delete, FALSE, 'a', 'href="#" data-id="'.encrypt($acl->type_id).'" class="btn delete btn-small btn-danger"');?>
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

	<div class="modal fade" id="accessModal" tabindex="-1" role="dialog" aria-labelledby="Access Management" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="accessAction"></h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div id="access_msg" class="alert" style="display:none;">
	                    <small class="access_msg"></small>
	                </div>

                    <?= form_open('', 'id="accessForm" method="post" data-parsley-validate');?>

                    <input type="hidden" id="type_id" name="type_id" value="">

                    <div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Access Type</label>
						<div class="col-sm-12 col-md-10">
	                    	<input type="text" id="type_name" name="type_name" class="form-control" placeholder="Access Type" required="required">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-12 col-md-2 col-form-label">Privileges</label>
						<div class="col-sm-12 col-md-10">
							<select id="menu_id" name="menu_id[]" class="form-control select2-search" required="required" multiple="multiple" style="width:100%">
                                <?php foreach ($menus as $menu) :?>
                                    <option value="<?= $menu->menu_id ?>"><?= $menu->menu_label ?></option>
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