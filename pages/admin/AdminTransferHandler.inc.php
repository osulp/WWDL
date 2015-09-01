<?php

// $Id$

import('pages.admin.AdminHandler');

class AdminTransferHandler extends AdminHandler {

	function transfer() {
		$this->validate();
		$this->setupTemplate(true);

		$templateMgr =& TemplateManager::getManager();
		$templateMgr->assign('test', "hey");
		$templateMgr->display('admin/transfer.tpl');
	}

	function commitChanges($args, &$request) {
		$this->validate();
		$desc = $_POST['description'];
		if(trim($desc) == "") {
			$request->redirect(null, 'transfer', null, array('m'=>'f'));
		}

		$desc = str_replace('"', '\"', $desc);
		exec("git add .", $output);
		exec("git commit -am \"$desc\"", $output);
		exec("git push 2>&1", $output);
		exec("umask 0002 && cd /home/sites/wwdl && git pull origin dev 2>&1", $output);
		exec("cd /home/sites/wwdl && git push 2>&1", $output);
		file_put_contents("/tmp/git.log", implode($output, "\n"));
		$request->redirect(null, 'transfer', null, array('m'=>'s'));
	}
}

?>
