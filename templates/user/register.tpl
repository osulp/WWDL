{**
 * templates/user/register.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User registration form.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="user.register"}
{include file="common/header.tpl"}
{/strip}

<form id="register" method="post" action="{url op="registerUser"}">

<p>{translate key="user.register.completeForm"}</p>

	<h3>{translate key="user.profile"}</h3>

	{include file="common/formErrors.tpl"}

{if $source}
	<input type="hidden" name="source" value="{$source|escape}" />
{/if}

<table class="data" width="100%">
{if count($formLocales) > 1}
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
		<td width="80%" class="value">
			{url|assign:"userRegisterUrl" page="user" op="register" escape=false}
			{form_language_chooser form="register" url=$userRegisterUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</td>
	</tr>
{/if}{* count($formLocales) > 1 *}

	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="username" required="true" key="user.username"}</td>
		<td width="80%" class="value"><input type="text" name="username" value="{$username|escape}" id="username" size="20" maxlength="32" class="textField" /></td>
	</tr>
	<tr valign="top">
		<td></td>
		<td class="instruct">{translate key="user.register.usernameRestriction"}</td>
	</tr>

	<tr valign="top">
		<td class="label">{fieldLabel name="password" required="true" key="user.password"}</td>
		<td class="value"><input type="password" name="password" value="{$password|escape}" id="password" size="20" maxlength="32" class="textField" /></td>
	</tr>

		<tr valign="top">
			<td></td>
			<td class="instruct">{translate key="user.register.passwordLengthRestriction" length=$minPasswordLength}</td>
		</tr>
		<tr valign="top">
			<td class="label">{fieldLabel name="password2" required="true" key="user.register.repeatPassword"}</td>
			<td class="value"><input type="password" name="password2" id="password2" value="{$password2|escape}" size="20" maxlength="32" class="textField" /></td>
		</tr>

		{if $captchaEnabled}
			<tr>
				<td class="label" valign="top">{fieldLabel name="captcha" required="true" key="common.captchaField"}</td>
				<td class="value">
					<img src="{url page="user" op="viewCaptcha" path=$captchaId}" alt="{translate key="common.captchaField.altText"}" /><br />
					<span class="instruct">{translate key="common.captchaField.description"}</span><br />
					<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="textField" />
					<input type="hidden" name="captchaId" value="{$captchaId|escape:"quoted"}" />
				</td>
			</tr>
		{/if}{* $captchaEnabled *}

		<tr valign="top">
			<td class="label">{fieldLabel name="salutation" key="user.salutation"}</td>
			<td class="value"><input type="text" name="salutation" id="salutation" value="{$salutation|escape}" size="20" maxlength="40" class="textField" /></td>
		</tr>
		<tr valign="top">
			<td class="label">{fieldLabel name="firstName" required="true" key="user.firstName"}</td>
			<td class="value"><input type="text" id="firstName" name="firstName" value="{$firstName|escape}" size="20" maxlength="40" class="textField" /></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="middleName" key="user.middleName"}</td>
			<td class="value"><input type="text" id="middleName" name="middleName" value="{$middleName|escape}" size="20" maxlength="40" class="textField" /></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="lastName" required="true" key="user.lastName"}</td>
			<td class="value"><input type="text" id="lastName" name="lastName" value="{$lastName|escape}" size="20" maxlength="90" class="textField" /></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="initials" key="user.initials"}</td>
			<td class="value"><input type="text" id="initials" name="initials" value="{$initials|escape}" size="5" maxlength="5" class="textField" />&nbsp;&nbsp;{translate key="user.initialsExample"}</td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="gender-m" key="user.gender"}</td>
			<td class="value">
				<select name="gender" id="gender" size="1" class="selectMenu">
					{html_options_translate options=$genderOptions selected=$gender}
				</select>
			</td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="affiliation" key="user.affiliation"}</td>
			<td class="value"><textarea id="affiliation" name="affiliation[{$formLocale|escape}]" rows="5" cols="40" class="textField">{$affiliation[$formLocale]|escape}</textarea></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="signature" key="user.signature"}</td>
			<td class="value"><textarea name="signature[{$formLocale|escape}]" id="signature" rows="5" cols="40" class="textArea">{$signature[$formLocale]|escape}</textarea></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="email" required="true" key="user.email"}</td>
			<td class="value"><input type="text" id="email" name="email" value="{$email|escape}" size="30" maxlength="90" class="textField" /> {if $privacyStatement}<a class="action" href="#privacyStatement">{translate key="user.register.privacyStatement"}</a>{/if}</td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="userUrl" key="user.url"}</td>
			<td class="value"><input type="text" id="userUrl" name="userUrl" value="{$userUrl|escape}" size="30" maxlength="90" class="textField" /></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="phone" key="user.phone"}</td>
			<td class="value"><input type="text" name="phone" id="phone" value="{$phone|escape}" size="15" maxlength="24" class="textField" /></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="fax" key="user.fax"}</td>
			<td class="value"><input type="text" name="fax" id="fax" value="{$fax|escape}" size="15" maxlength="24" class="textField" /></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="mailingAddress" key="common.mailingAddress"}</td>
			<td class="value"><textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="textArea">{$mailingAddress|escape}</textarea></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="country" key="common.country"}</td>
			<td class="value">
				<select name="country" id="country" class="selectMenu">
					<option value=""></option>
					{html_options options=$countries selected=$country}
				</select>
			</td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="biography" key="user.biography"}<br />{translate key="user.biography.description"}</td>
			<td class="value"><textarea name="biography[{$formLocale|escape}]" id="biography" rows="5" cols="40" class="textArea">{$biography[$formLocale]|escape}</textarea></td>
		</tr>

		<tr valign="top">
			<td class="label">{fieldLabel name="sendPassword" key="user.sendPassword"}</td>
			<td class="value">
				<input type="checkbox" name="sendPassword" id="sendPassword" value="1"{if $sendPassword} checked="checked"{/if} /> <label for="sendPassword">{translate key="user.sendPassword.description"}</label>
			</td>
		</tr>

		{if count($availableLocales) > 1}
			<tr valign="top">
				<td class="label">{translate key="user.workingLanguages"}</td>
				<td class="value">{foreach from=$availableLocales key=localeKey item=localeName}
				<input type="checkbox" name="userLocales[]" id="userLocales-{$localeKey|escape}" value="{$localeKey|escape}"{if in_array($localeKey, $userLocales)} checked="checked"{/if} /> <label for="userLocales-{$localeKey|escape}">{$localeName|escape}</label><br />
				{/foreach}</td>
			</tr>
		{/if}{* count($availableLocales) > 1 *}

{if $allowRegSubmitter}
	<tr valign="top">
		<td class="label">{fieldLabel suppressId="true" name="registerAs" key="user.register.registerAs"}</td>
		<td class="value">{if $allowRegSubmitter}<input type="checkbox" name="registerAsSubmitter" id="registerAsSubmitter" value="1"{if $registerAsSubmitter} checked="checked"{/if} /> <label for="registerAsSubmitter">{translate key="user.role.submitter"}</label>: {translate key="user.register.submitterDescription"}<br />{/if}</td>
	</tr>
{/if}

</table>

<p><input type="submit" value="{translate key="user.register"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url page="index" escape=false}'" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>


{if $privacyStatement}
	<div id="privacyStatement">
	<h3>{translate key="user.register.privacyStatement"}</h3>
	<p>{$privacyStatement|nl2br}</p>
	</div>
{/if}
</form>
</div>

{include file="common/footer.tpl"}

