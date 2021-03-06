{**
 * plugins/schemas/etdms/record.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 * Edited and modified by Kennedy Onyancha - DoKS (KHK Kempen) (2007)
 * View Etdms record.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="record.viewRecord"}
{include file="common/header.tpl"}
{/strip}

<h3>{$record->getTitle()|escape}</h3>
<h4>{$archive->getTitle()|escape}</h4>

<a href="{url page="browse" op="archiveInfo" path=$archive->getArchiveId()}" class="action">{translate key="browse.archiveInfo"}</a><br/>&nbsp;

<table width="100%" class="listing">
	<tr>
		<td colspan="3" class="headseparator">&nbsp;</td>
	</tr>
	<tr valign="top" class="heading">
		<td width="25%">{translate key="record.field"}</td>
		<td width="75%">{translate key="record.value"}</td>
	</tr>
	<tr>
		<td colspan="3" class="headseparator">&nbsp;</td>
	</tr>
	{foreach from=$record->getParsedContents() item=entry key=name name=entries}
		<tr valign="top">
			<td>{translate key="plugins.schemas.etdms.fields.$name.name"}</td>
			<td>
				{foreach from=$entry item=value}
					{if $name == 'identifier'}
						<a href="{$value|escape}">{$value|escape|default:"&mdash;"}</a>
					{else}
						{$value|trim|nl2br|strip_unsafe_html|default:"&mdash;"}
					{/if}<br/>
				{/foreach}
			</td>
		</tr>
		<tr>
			<td colspan="3" class="{if $smarty.foreach.entries.last}end{/if}separator">&nbsp;</td>
		</tr>
	{/foreach}
</table>

{if $defineTermsContextId}
<script type="text/javascript">
{literal}
<!--
	// Open "Define Terms" context when double-clicking any text
	function openSearchTermWindow(url) {
		var term;
		if (window.getSelection) {
			term = window.getSelection();
		} else if (document.getSelection) {
			term = document.getSelection();
		} else if(document.selection && document.selection.createRange && document.selection.type.toLowerCase() == 'text') {
			var range = document.selection.createRange();
			term = range.text;
		}
		if (url.indexOf('?') > -1) openRTWindowWithToolbar(url + '&defineTerm=' + term);
		else openRTWindowWithToolbar(url + '?defineTerm=' + term);
	}

	if(document.captureEvents) {
		document.captureEvents(Event.DBLCLICK);
	}
	document.ondblclick = new Function("openSearchTermWindow('{/literal}{url page="rt" op="context" path=$record->getRecordId()|to_array:$defineTermsContextId}{literal}')");
// -->
{/literal}
</script>
{/if}

{include file="common/footer.tpl"}
