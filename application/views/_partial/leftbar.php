	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="index.html">
				<?= show_image('onelove-logo-dark.png', 'image', 'alt="logo" class="dark-logo"')?>
				<?= show_image('onelove-logo-light.png', 'image', 'alt="logo" class="light-logo"')?>
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
							if(!is_null($menu['menu_id'])) :?>

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
							<?php foreach(load_cache('main_menu', 'site_m', 'getSubMenu', NULL, 300) as $submenu) :?>
							
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
						<a href="<?= base_url('pengaturan-akun')?>" class="dropdown-toggle no-arrow">
							<span class="micon dw dw-settings"></span>
							<span class="mtext">Pengaturan Akun</span>
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