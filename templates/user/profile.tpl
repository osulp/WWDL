{**
 * templates/user/profile.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User profile form.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="user.profile.editProfile"}
{assign var="helpTopicId" value="user.userHome"}
{url|assign:"url" op="profile"}
{include file="common/header.tpl"}
{/strip}
<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">
<form id="profile" method="post" action="{url op="saveProfile"}" enctype="multipart/form-data">

{include file="common/formErrors.tpl"}

<table class="data" width="100%">
{if count($formLocales) > 1}
	<tr valign="top">
		<td width="20%"  >{fieldLabel name="formLocale" required="true" key="common.language"}</td>
		<td width="80%" class="value">
			{url|assign:"userProfileUrl" page="user" op="profile" escape=false}
			{form_language_chooser form="profile" url=$userProfileUrl}
		</td>
	</tr>
{/if}
<tr valign="top">
	<td width="20%"  >{fieldLabel suppressId="true" name="username" key="user.username"}</td>
	<td width="80%" class="value">{$username|escape}</td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="salutation" key="user.salutation"}</td>
	<td class="value"><input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="firstName" required="true" key="user.firstName"}</td>
	<td class="value"><input type="text" name="firstName" id="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="middleName" key="user.middleName"}</td>
	<td class="value"><input type="text" name="middleName" id="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="lastName" required="true" key="user.lastName"}</td>
	<td class="value"><input type="text" name="lastName" id="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="initials" key="user.initials"}</td>
	<td class="value"><input type="text" name="initials" id="initials" value="{$initials|escape}" size="5" maxlength="5" class="textField" />&nbsp;&nbsp;{translate key="user.initialsExample"}</td>
</tr>
<tr valign="top">
	<td  >{fieldLabel suppressId="true" name="gender" key="user.gender"}</td>
	<td class="value">
		<select name="gender" id="gender" size="1" class="selectMenu">
			{html_options_translate options=$genderOptions selected=$gender}
		</select>
 	</td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="affiliation" key="user.affiliation"}</td>
	<td class="value"><textarea name="affiliation[{$formLocale|escape}]" id="affiliation" rows="5" cols="40" class="textArea">{$affiliation[$formLocale]|escape}</textarea></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="signature" key="user.signature"}</td>
	<td class="value"><textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="textArea">{$signature[$formLocale]|escape}</textarea></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="email" required="true" key="user.email"}</td>
	<td class="value"><input type="text" name="email" id="email" value="{$email|escape}" size="30" maxlength="90" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="userUrl" key="user.url"}</td>
	<td class="value"><input type="text" name="userUrl" id="userUrl" value="{$userUrl|escape}" size="30" maxlength="90" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="phone" key="user.phone"}</td>
	<td class="value"><input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="fax" key="user.fax"}</td>
	<td class="value"><input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="textField" /></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="mailingAddress" key="common.mailingAddress"}</td>
	<td class="value"><textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="textArea">{$mailingAddress|escape}</textarea></td>
</tr>
<tr valign="top">
	<td  >{fieldLabel name="country" key="common.country"}</td>
	<td class="value">
		<select name="country" id="country" class="selectMenu">
			<option value=""></option>
			{html_options options=$countries selected=$country}
		</select>
	</td>
</tr>

<tr valign="top">
	<td  >
		{fieldLabel name="profileImage" key="user.profile.form.profileImage"}
	</td>
	<td class="value">
		<input type="file" id="profileImage" name="profileImage" class="uploadField" /> <input type="submit" name="uploadProfileImage" value="{translate key="common.upload"}" class="button" />
		{if $profileImage}
			{translate key="common.fileName"}: {$profileImage.name|escape} {$profileImage.dateUploaded|date_format:$datetimeFormatShort} <input type="submit" name="deleteProfileImage" value="{translate key="common.delete"}" class="button" />
			<br />
			<img src="{$sitePublicFilesDir}/{$profileImage.uploadName|escape:"url"}" width="{$profileImage.width|escape}" height="{$profileImage.height|escape}" style="border: 0;" alt="{translate key="user.profile.form.profileImage"}" />
		{/if}
	</td>
</tr>
{if count($availableLocales) > 1}
<tr valign="top">
	<td  >{translate key="user.workingLanguages"}</td>
	<td>{foreach from=$availableLocales key=localeKey item=localeName}
		<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> <label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label><br />
	{/foreach}</td>
</tr>
{/if}

</table>
<p><input type="submit" value="{translate key="common.save"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="user"}'" /></p>
</form>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

