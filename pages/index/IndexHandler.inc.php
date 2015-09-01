<?php

/**
 * @file pages/index/IndexHandler.inc.php
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package pages.index
 * @class IndexHandler
 *
 * Handle site index requests.
 *
 */

// $Id$


import('classes.handler.Handler');

class IndexHandler extends Handler {
	function index($args) {
		$this->setupTemplate();
		$this->validate();
		
		$page = "index";
		if(!empty($args))
			$page = $args[0];
			
		$templateMgr =& TemplateManager::getManager();
		$templateMgr->display("$page.tpl");
	}
	
	function guides($args) {
		$this->setupTemplate();
		$this->validate();
		
		$guidePage = "guides/index.tpl";
		$templateMgr =& TemplateManager::getManager();
		$templateMgr->display("guides.tpl");
	}
}

?>
