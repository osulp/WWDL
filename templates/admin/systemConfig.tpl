{**
 * templates/admin/systemConfig.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to edit system configuration.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="admin.systemConfiguration"}
{assign var="helpTopicId" value="admin.systemConfiguration"}
{include file="common/header.tpl"}
{/strip}

<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">
				
<form method="post" action="{url op="saveSystemConfig"}">
<p>{translate key="admin.editSystemConfigInstructions"}</p>

{foreach from=$configData key=sectionName item=sectionData}
<div id="sectionData">
<h3>{$sectionName}</h3>
<table class="data" width="100%">
{foreach from=$sectionData key=settingName item=settingValue}
<tr valign="top">	
	<td width="20%" class="label">{$settingName|escape}</td>
	<td width="80%" class="value"><input type="text" name="{$sectionName|escape}[{$settingName|escape}]" value="{if $settingValue === true}On{elseif $settingValue === false}Off{else}{$settingValue|escape}{/if}" size="40" class="textField" /></td>
</tr>
{/foreach}
</table>

<br />
</div>
{/foreach}
</table>

<p><input type="submit" value="{translate key="admin.saveSystemConfig"}" class="button defaultButton" /> <input name="display" type="submit" value="{translate key="admin.displayNewSystemConfig"}" class="button" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="systemInfo"}'" /></p>

</form>

</div>
</div>
</div>
</div>
</div>

{include file="common/footer.tpl"}

