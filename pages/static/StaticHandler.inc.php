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

class StaticHandler extends Handler {

	function index($args) {
		$templateMgr = &TemplateManager::getManager();
		$this->setupTemplate();
		$this->validate();
		
		$page = $this->_id;
		
		if($page == "guides") {
			if(isset($_GET['p'])) {
				$guide_page = "guides/" . $_GET['p'] . ".tpl";
				$templateMgr->assign('guide_page', $guide_page);
				$page = "guides/template";
			}
		}	
		if($page == "exhibits") {
			if(isset($_GET['p'])) {
				$exhibits_page = "exhibits/" . $_GET['p'] . ".tpl";
				$templateMgr->assign('exhibits_page', $exhibits_page);
				$page = "exhibits/template";
			}	
		  }
		
		
			
		$templateMgr->display("$page.tpl");
	}
	
	function guides($args) {
		$this->setupTemplate();
		$this->validate();
		
		$guidePage = "guides/index.tpl";
		$templateMgr =& TemplateManager::getManager();
		$templateMgr->display("guides.tpl");
	}
	
	function exhibits($args) {
		$this->setupTemplate();
		$this->validate();
		
		$exhibitsPage = "exhibits/index.tpl";
		$templateMgr =& TemplateManager::getManager();
		$templateMgr->display("exhibits.tpl");
	}
}

?>
