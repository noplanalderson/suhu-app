	<div class="left-side-bar">
		<div class="brand-logo ml-4">
			<a href="<?= base_url('dashboard') ?>">
				<?= show_image($this->app->app_logo_dark, 'image', 'alt="logo" class="dark-logo"')?>
				<?= show_image($this->app->app_logo_light, 'image', 'alt="logo" class="light-logo"')?>
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<li>
					<div class="sidebar-small-cap">Menu Utama</div>
				</li>
				<ul id="accordion-menu">
					<?php 
						foreach ($this->menus as $menu) :
							$submenus = $this->app_m->getSubMenu($menu['menu_id']);
			            	if(empty($submenus)):
					?>

					<li>
						<a href="<?= base_url($menu['menu_link']) ?>" class="dropdown-toggle no-arrow">
							<span class="micon <?= $menu['menu_icon'] ?>"></span><span class="mtext"><?= $menu['menu_label'] ?></span>
						</a>
					</li>
					<?php else : ?>

					<li class="dropdown">
						<a href="javascript:;" class="dropdown-toggle">
							<span class="micon <?= $menu['menu_icon'] ?>"></span><span class="mtext"><?= $menu['menu_label'] ?></span>
						</a>
						<ul class="submenu">
							<?php foreach ($submenus as $submenu): ?>

							<li><a href="<?= base_url($submenu['menu_link']) ?>"><?= $submenu['menu_label'] ?></a></li>
							<?php endforeach;?>

						</ul>
					</li>
					<?php endif; endforeach; ?>

					<li>
						<div class="dropdown-divider"></div>
					</li>
					<li>
						<div class="sidebar-small-cap">Akun Anda</div>
					</li>
					<li>
						<a href="<?= base_url('account-setting')?>" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-settings"></span>
							<span class="mtext">Account Setting</span>
						</a>
					</li>
					<li>
						<a href="<?= base_url('logout') ?>" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-logout"></span>
							<span class="mtext">Logout</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>