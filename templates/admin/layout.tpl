{**
 * templates/admin/layout.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Layout page for setup.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="admin.layout"}
{assign var="pageCrumbTitle" value="admin.layout"}
{assign var="helpTopicId" value="admin.layout"}
{url|assign:"currentUrl" op="layout"}
{include file="common/header.tpl"}
{/strip}
<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">

<script type="text/javascript">
{literal}
<!--

// Swap the given entries in the select field.
function swapEntries(field, i, j) {
	var tmpLabel = field.options[j].label;
	var tmpVal = field.options[j].value;
	var tmpText = field.options[j].text;
	var tmpSel = field.options[j].selected;
	field.options[j].label = field.options[i].label;
	field.options[j].value = field.options[i].value;
	field.options[j].text = field.options[i].text;
	field.options[j].selected = field.options[i].selected;
	field.options[i].label = tmpLabel;
	field.options[i].value = tmpVal;
	field.options[i].text = tmpText;
	field.options[i].selected = tmpSel;
}

// Move selected items up in the given select list.
function moveUp(field) {
	var i;
	for (i=0; i<field.length; i++) {
		if (field.options[i].selected == true && i>0) {
			swapEntries(field, i-1, i);
		}
	}
 }

// Move selected items down in the given select list.
function moveDown(field) {
	var i;
	var max = field.length - 1;
	for (i = max; i >= 0; i=i-1) {
		if(field.options[i].selected == true && i < max) {
			swapEntries(field, i+1, i);
		}
	}
}

// Move selected items from select list a to select list b.
function jumpList(a, b) {
	var i;
	for (i=0; i<a.options.length; i++) {
		if (a.options[i].selected == true) {
			bMax = b.options.length;
			b.options[bMax] = new Option(a.options[i].text);
			b.options[bMax].value = a.options[i].value;
			a.options[i] = null;
			i=i-1;
		}
	}
 }

function prepBlockFields() {
	var i;
	var theForm = document.getElementById('setupForm');

	theForm.elements["blockSelectLeft"].value = "";
	for (i=0; i<theForm.blockSelectLeftWidget.options.length; i++) {
		theForm.blockSelectLeft.value += theForm.blockSelectLeftWidget.options[i].value + " ";
	}

	theForm.blockSelectRight.value = "";
	for (i=0; i<theForm.blockSelectRightWidget.options.length; i++) {
		theForm.blockSelectRight.value += theForm.blockSelectRightWidget.options[i].value + " ";
	}

	theForm.blockUnselected.value = "";
	for (i=0; i<theForm.blockUnselectedWidget.options.length; i++) {
		theForm.blockUnselected.value += theForm.blockUnselectedWidget.options[i].value + " ";
	}
	return true;
}

// -->
{/literal}
</script>

<form id="setupForm" method="post" action="{url op="saveLayout"}">
{include file="common/formErrors.tpl"}

{* There are no localized settings on this page.
{if count($formLocales) > 1}
<div id="locales">
<table width="100%" class="data">
	<tr valign="top">
		<td width="20%" class="label">{fieldLabel name="formLocale" key="form.formLanguage"}</td>
		<td width="80%" class="value">
			{url|assign:"setupFormUrl" op="setup" path="4" escape=false}
			{form_language_chooser form="setupForm" url=$setupFormUrl}
			<span class="instruct">{translate key="form.formLanguage.description"}</span>
		</td>
	</tr>
</table>
</div>
{/if}
*}

<table border="0" align="center">
	<tr align="center">
		<td rowspan="2">
			{translate key="admin.setup.layout.leftSidebar"}<br/>
			<input class="button defaultButton" style="width: 130px;" type="button" value="&uarr;" onclick="moveUp(this.form.elements['blockSelectLeftWidget']);" /><br/>
			<select name="blockSelectLeftWidget" multiple="multiple" size="10" class="selectMenu" style="width: 130px; height:200px" >
				{foreach from=$leftBlockPlugins item=block}
					<option value="{$block->getName()|escape}">{$block->getDisplayName()|escape}</option>
				{/foreach}
			</select><br/>
			<input class="button defaultButton" style="width: 130px;" type="button" value="&darr;" onclick="moveDown(this.form.elements['blockSelectLeftWidget']);" />
		</td>
		<td>
			<input class="button defaultButton" style="width: 30px;" type="button" value="&larr;" onclick="jumpList(this.form.elements['blockUnselectedWidget'],this.form.elements['blockSelectLeftWidget']);" /><br/>
			<input class="button defaultButton" style="width: 30px;" type="button" value="&rarr;" onclick="jumpList(this.form.elements['blockSelectLeftWidget'],this.form.elements['blockUnselectedWidget']);" />

		</td>
		<td valign="top">
			{translate key="admin.setup.layout.unselected"}<br/>
			<select name="blockUnselectedWidget" multiple="multiple" size="10" class="selectMenu" style="width: 120px; height:180px;" >
				{foreach from=$disabledBlockPlugins item=block}
					<option value="{$block->getName()|escape}">{$block->getDisplayName()|escape}</option>
				{/foreach}
			</select>
		</td>
		<td>
			<input class="button defaultButton" style="width: 30px;" type="button" value="&larr;" onclick="jumpList(this.form.elements['blockSelectRightWidget'],this.form.elements['blockUnselectedWidget']);" /><br/>
			<input class="button defaultButton" style="width: 30px;" type="button" value="&rarr;" onclick="jumpList(this.form.elements['blockUnselectedWidget'],this.form.elements['blockSelectRightWidget']);" />
		</td>
		<td rowspan="2">
			{translate key="admin.setup.layout.rightSidebar"}<br/>
			<input class="button defaultButton" style="width: 130px;" type="button" value="&uarr;" onclick="moveUp(this.form.elements['blockSelectRightWidget']);" /><br/>
			<select name="blockSelectRightWidget" multiple="multiple" size="10" class="selectMenu" style="width: 130px; height:200px" >
				{foreach from=$rightBlockPlugins item=block}
					<option value="{$block->getName()|escape}">{$block->getDisplayName()|escape}</option>
				{/foreach}
			</select><br/>
			<input class="button defaultButton" style="width: 130px;" type="button" value="&darr;" onclick="moveDown(this.form.elements['blockSelectRightWidget']);" />
		</td>
	</tr>
	<tr align="center">
		<td colspan="3" valign="top" height="60px">
			<input class="button defaultButton" style="width: 190px;" type="button" value="&larr;" onclick="jumpList(this.form.elements['blockSelectRightWidget'],this.form.elements['blockSelectLeftWidget']);" /><br/>
			<input class="button defaultButton" style="width: 190px;" type="button" value="&rarr;" onclick="jumpList(this.form.elements['blockSelectLeftWidget'],this.form.elements['blockSelectRightWidget']);" />
		</td>
	</tr>
</table>
<input type="hidden" name="blockSelectLeft" value="" />
<input type="hidden" name="blockSelectRight" value="" />
<input type="hidden" name="blockUnselected" value="" />

<div class="separator"></div>

<p><input type="submit" onclick="prepBlockFields()" value="{translate key="common.save"}" class="button defaultButton" /> <input type="button" value="{translate key="common.cancel"}" class="button" onclick="document.location.href='{url op="setup" escape=false}'" /></p>

<p><span class="formRequired">{translate key="common.requiredField"}</span></p>

</form>

</div>
</div>
</div>
</div>
</div>

{include file="common/footer.tpl"}

