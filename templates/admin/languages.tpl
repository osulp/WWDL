{**
 * templates/admin/languages.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Form to edit site language settings.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="common.languages"}
{assign var="helpTopicId" value="admin.languages"}
{include file="common/header.tpl"}
{/strip}
<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">
<form method="post" action="{url op="saveLanguageSettings"}">

<h3>{translate key="admin.languages.languageSettings"}</h3>

<table class="form">
<tr valign="top">
	<td width="20%"   >{translate key="locale.primary"}</td>
	<td width="80%" class="value">
		<select name="primaryLocale" id="primaryLocale" size="1" class="selectMenu">
		{foreach from=$installedLocales item=localeKey}
			<option value="{$localeKey}"{if $localeKey == $primaryLocale} selected="selected"{/if}>{$localeNames.$localeKey|escape}</option>
		{/foreach}
		</select>
		<br />
		<span class="instruct">{translate key="admin.languages.primaryLocaleInstructions"}</span>
	</td>
</tr>
<tr valign="top">
	<td   >{translate key="locale.supported"}</td>
	<td>
		<table width="100%">
		{foreach from=$installedLocales item=localeKey}
		<tr valign="top">
			<td width="5%"><input type="checkbox" name="supportedLocales[]" id="supportedLocales-{$localeKey}" value="{$localeKey}"{if in_array($localeKey, $supportedLocales)} checked="checked"{/if} /></td>
 			<td width="95%">
 				<label for="supportedLocales-{$localeKey|escape}">{$localeNames.$localeKey|escape}</label>
 				{if !$localesComplete[$localeKey]}
 					<span class="formError">*</span>
 					{assign var=incompleteLocaleFound value=1}
 				{/if}
 			</td>
		</tr>
		{/foreach}
		</table>
		<span class="instruct">{translate key="admin.languages.supportedLocalesInstructions"}</span>
 		{if $incompleteLocaleFound}
 			<br/>
 			<span class="formError">*</span>&nbsp;{translate key="admin.locale.maybeIncomplete"}
 		{/if}{* $incompleteLocaleFound *}
	</td>
</tr>
</table>

<p><input type="submit" value="{translate key="common.save"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="admin"}'" /></p>

</form>
</div>
<div class="separator"></div>
<div id="installLocale">
<form method="post" action="{url op="installLocale"}">

<h3>{translate key="admin.languages.installLanguages"}</h3>
<h4>{translate key="admin.languages.installedLocales"}</h4>
<ul>
<table class="data" width="100%">
{foreach from=$installedLocales item=localeKey}
<tr valign="top">
	<td width="20%"><li>{$localeNames.$localeKey|escape} ({$localeKey})</li></td>
	<td width="80%"><a href="{url op="reloadLocale" locale=$localeKey}" onclick="return confirm('{translate|escape:"jsparam" key="admin.languages.confirmReload"}')" class="action">{translate key="admin.languages.reload"}</a>{if $localeKey != $primaryLocale}&nbsp;|&nbsp;<a href="{url op="uninstallLocale" locale=$localeKey}" onclick="return confirm('{translate|escape:"jsparam" key="admin.languages.confirmUninstall"}')" class="action">{translate key="admin.languages.uninstall"}</a>{/if}</td>
</tr>
{/foreach}
</table>
</ul>

<h4>{translate key="admin.languages.installNewLocales"}</h4>
<p>{translate key="admin.languages.installNewLocalesInstructions"}</p>
{foreach from=$uninstalledLocales item=localeKey}
<input type="checkbox" name="installLocale[]" id="installLocale-{$localeKey}" value="{$localeKey}" /> <label for="installLocale-{$localeKey}">{$localeNames.$localeKey|escape} ({$localeKey})</label><br />
{foreachelse}
{assign var="noLocalesToInstall" value="1"}
<span class="nodata">{translate key="admin.languages.noLocalesAvailable"}</span>
{/foreach}

{if not $noLocalesToInstall}
<p><input type="submit" value="{translate key="admin.languages.installLocales"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="admin"}'" /></p>
{/if}

</form>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

