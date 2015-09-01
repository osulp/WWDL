<?php

/**
 * @file classes/security/Role.inc.php
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class Role
 * @ingroup security
 * @see RoleDAO
 *
 * @brief Describes user roles within the system and the associated permissions.
 */

// $Id$


/** ID codes for all user roles */
define('ROLE_ID_SITE_ADMIN',		0x00000001);
define('ROLE_ID_SUBMITTER',		0x00000002);

class Role extends DataObject {
	/**
	 * Constructor.
	 */
	function Role() {
		parent::DataObject();
	}

	/**
	 * Get the i18n key name associated with this role.
	 * @return String the key
	 */
	function getRoleName() {
		return RoleDAO::getRoleName($this->getData('roleId'));
	}

	/**
	 * Get the URL path associated with this role's operations.
	 * @return String the path
	 */
	function getRolePath() {
		return RoleDAO::getRolePath($this->getData('roleId'));
	}

	//
	// Get/set methods
	//

	/**
	 * Get user ID associated with role.
	 * @return int
	 */
	function getUserId() {
		return $this->getData('userId');
	}

	/**
	 * Set user ID associated with role.
	 * @param $userId int
	 */
	function setUserId($userId) {
		return $this->setData('userId', $userId);
	}

	/**
	 * Get role ID of this role.
	 * @return int
	 */
	function getRoleId() {
		return $this->getData('roleId');
	}

	/**
	 * Set role ID of this role.
	 * @param $roleId int
	 */
	function setRoleId($roleId) {
		return $this->setData('roleId', $roleId);
	}
}

?>
