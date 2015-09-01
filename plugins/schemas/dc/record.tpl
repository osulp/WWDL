{**
 * plugins/schemas/dc/record.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View a Dublin Core record.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value=$record->getTitle()|escape}
{assign var="full_page" value="true"}
{include file="common/header.tpl"}
{/strip}
<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">
				
				
<p>Record Details</p>
{literal}
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style addButtons pull-right">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript">var addthis_config = {"data_track_addressbar":false};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5106afc40803fac0"></script>
<!-- AddThis Button End -->
{/literal}
<h3>{$record->getTitle()|escape}</h3>
<h4>{$archive->getTitle()|escape}</h4>
<div class="row-fluid">
<div class="span3">
<div class="well text-center">
{if $record->getThumbnailUrl() != ""}
<img src="{$record->getThumbnailUrl()}"> <br />
{/if}

<a href="{$record->getUrl()}" class="action" target="_blank">View Original Item</a>
</div>
</div>
<div class="span9">


<table class="table table-bordered">
	<thead>
	<tr>
		<th>{translate key="record.field"}</th>
		<th>{translate key="record.value"}</th>
	</tr>
	</thead>
	<tbody>
	
	{foreach from=$record->getParsedContents() item=entry key=name name=entries}
		<tr>
			<td><strong>{translate key="plugins.schemas.dc.fields.$name.name"}</strong></td>
			<td>
				{foreach from=$entry item=value}
					{if $name == 'identifier'}
						{$value|escape|default:"&mdash;"}
					{elseif $name == 'description'}
						{$value|mb_truncate:500}
					{else}
						{$value|trim|nl2br|strip_unsafe_html|default:"&mdash;"}
					{/if}
				{/foreach}
			</td>
		</tr>
		
	{/foreach}
	</tbody>
</table>
</div>
</div>

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

</div>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}
