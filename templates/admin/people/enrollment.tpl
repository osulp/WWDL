{**
 * templates/admin/people/enrollment.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * List enrolled users.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="admin.people.enrollment"}
{include file="common/header.tpl"}
{/strip}
<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">
				
<form id="disableUser" method="post" action="{url op="disableUser"}">
	<input type="hidden" name="reason" value=""/>
	<input type="hidden" name="userId" value=""/>
</form>

<script type="text/javascript">
{literal}
<!--
function toggleChecked() {
	var elements = document.getElementById('people').elements;
	for (var i=0; i < elements.length; i++) {
		if (elements[i].name == 'bcc[]') {
			elements[i].checked = !elements[i].checked;
		}
	}
}

function confirmAndPrompt(userId) {
	var reason = prompt('{/literal}{translate|escape:"javascript" key="admin.people.confirmDisable"}{literal}');
	if (reason == null) return;
	var disableUserForm = document.getElementById('disableUser');
	disableUserForm.reason.value = reason;
	disableUserForm.userId.value = userId;

	disableUserForm.submit();
}

function sortSearch(heading, direction) {
	var submitForm = document.getElementById('submit');
	submitForm.sort.value = heading;
	submitForm.sortDirection.value = direction;
	submitForm.submit();
}
// -->
{/literal}
</script>

<h3>{translate key=$roleName}</h3>
<form id="submit" method="post" action="{url path=$roleSymbolic}" class="form-inline">
	<input type="hidden" name="sort" value="id"/>
	<input type="hidden" name="sortDirection" value="ASC"/>
	<select name="roleSymbolic" class="selectMenu">
		<option {if $roleSymbolic=='all'}selected="selected" {/if}value="all">{translate key="admin.people.allUsers"}</option>
		<option {if $roleSymbolic=='submitters'}selected="selected" {/if}value="submitters">{translate key="user.role.submitters"}</option>
	</select>
	<select name="searchField"  class="selectMenu">
		{html_options_translate options=$fieldOptions selected=$searchField}
	</select>
	<select name="searchMatch" class="selectMenu">
		<option value="contains"{if $searchMatch == 'contains'} selected="selected"{/if}>{translate key="form.contains"}</option>
		<option value="is"{if $searchMatch == 'is'} selected="selected"{/if}>{translate key="form.is"}</option>
		<option value="startsWith"{if $searchMatch == 'startsWith'} selected="selected"{/if}>{translate key="form.startsWith"}</option>
	</select>
	<input type="text"  name="search" class="textField" value="{$search|escape}" />&nbsp;<input type="submit" value="{translate key="common.search"}" class="btn" />
</form>

<p>{foreach from=$alphaList item=letter}<a href="{url path=$roleSymbolic searchInitial=$letter}">{if $letter == $searchInitial}<strong>{$letter|escape}</strong>{else}{$letter|escape}{/if}</a> {/foreach}<a href="{url path=$roleSymbolic}">{if $searchInitial==''}<strong>{translate key="common.all"}</strong>{else}{translate key="common.all"}{/if}</a></p>

{if not $roleId}
<ul>
	<li><a href="{url path="submitters"}">{translate key="user.role.submitters"}</a></li>
</ul>

<br />
{else}
<p><a href="{url path="all"}" class="action">{translate key="admin.people.allUsers"}</a></p>
{/if}

<form id="people" action="{url page="user" op="email"}" method="post">
<input type="hidden" name="redirectUrl" value="{url path=$roleSymbolic}"/>

<div id="users">
<table width="100%" class="listing">
	<tr>
		<td colspan="5" class="headseparator">&nbsp;</td>
	</tr>
	<tr class="heading" valign="bottom">
		<td width="5%">&nbsp;</td>
		<td width="12%">{sort_search key="user.username" sort="username"}</td>
		<td width="20%">{sort_search key="user.name" sort="name"}</td>
		<td width="23%">{sort_search key="user.email" sort="email"}</td>
		<td width="40%" align="right">{translate key="common.action"}</td>
	</tr>
	<tr>
		<td colspan="5" class="headseparator">&nbsp;</td>
	</tr>
	{iterate from=users item=user}
	{assign var=userExists value=1}
	<tr valign="top">
		<td><input type="checkbox" name="bcc[]" value="{$user->getEmail()|escape}"/></td>
		<td><a class="action" href="{url op="userProfile" path=$user->getId()}">{$user->getUsername()|escape|wordwrap:15:" ":true}</a></td>
		<td>{$user->getFullName()|escape}</td>
		<td class="nowrap">
			{assign var=emailString value=$user->getFullName()|concat:" <":$user->getEmail():">"}
			{url|assign:"redirectUrl" path=$roleSymbolic escape=false}
			{url|assign:"url" page="user" op="email" to=$emailString|to_array redirectUrl=$redirectUrl}
			{$user->getEmail()|truncate:15:"..."|escape}&nbsp;{icon name="mail" url=$url}
		</td>
		<td align="right">
			{if $roleId}
			<a href="{url op="unEnroll" path=$roleId userId=$user->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="admin.people.confirmUnenroll"}')" class="action">{translate key="admin.people.unenroll"}</a>&nbsp;|
			{/if}
			<a href="{url op="editUser" path=$user->getId()}" class="action">{translate key="common.edit"}</a>
			{if $thisUser->getId() != $user->getId()}
				|&nbsp;<a href="{url op="signInAsUser" path=$user->getId()}" class="action">{translate key="admin.people.signInAs"}</a>
				{if !$roleId}|&nbsp;<a href="{url op="removeUser" path=$user->getId()}" onclick="return confirm('{translate|escape:"jsparam" key="admin.people.confirmRemove"}')" class="action">{translate key="admin.people.remove"}</a>{/if}
				{if $user->getDisabled()}
					|&nbsp;<a href="{url op="enableUser" path=$user->getId()}" class="action">{translate key="admin.people.enable"}</a>
				{else}
					|&nbsp;<a href="javascript:confirmAndPrompt({$user->getId()})" class="action">{translate key="admin.people.disable"}</a>
				{/if}
			{/if}
		</td>
	</tr>
	<tr>
		<td colspan="5" class="{if $users->eof()}end{/if}separator">&nbsp;</td>
	</tr>
{/iterate}
{if $users->wasEmpty()}
	<tr>
		<td colspan="5" class="nodata">{translate key="admin.people.noneEnrolled"}</td>
	</tr>
	<tr>
		<td colspan="5" class="endseparator">&nbsp;</td>
	</tr>
{else}
	<tr>
		<td colspan="4" align="left">{page_info iterator=$users}</td>
		<td align="right">{page_links anchor="users" name="users" iterator=$users searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth roleSymbolic=$roleSymbolic searchInitial=$searchInitial sort=$sort sortDirection=$sortDirection}</td>
	</tr>
{/if}
</table>

{if $userExists}
	<p><input type="submit" value="{translate key="email.compose"}" class="button defaultButton"/>&nbsp;<input type="button" value="{translate key="common.selectAll"}" class="button" onclick="toggleChecked()" /></p>
{/if}
</form>

<a href="{url op="enrollSearch" path=$roleId}" class="action">{translate key="admin.people.enrollExistingUser"}</a> |
{url|assign:"enrollmentUrl" path=$roleSymbolic searchField=$searchField searchMatch=$searchMatch search=$search dateFromDay=$dateFromDay dateFromYear=$dateFromYear dateFromMonth=$dateFromMonth dateToDay=$dateToDay dateToYear=$dateToYear dateToMonth=$dateToMonth searchInitial=$searchInitial}
<a href="{if $roleId}{url op="createUser" roleId=$roleId source=$enrollmentUrl}{else}{url op="createUser" source=$enrollmentUrl}{/if}" class="action">{translate key="admin.people.createUser"}</a>
</div>

</div>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

