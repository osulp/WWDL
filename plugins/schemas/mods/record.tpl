{**
 * plugins/schemas/mods/record.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * View a MODS record.
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
<p class="headerLeft">Record Details</p>
{literal}
<!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style addButtons">
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

{assign var=contents value=$record->getParsedContents()}

<!--<a href="{url page="browse" op="archiveInfo" path=$archive->getArchiveId()}" class="action">{translate key="browse.archiveInfo"}</a><br/>&nbsp;-->
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
	{foreach from="title"|to_array:"subTitle":"partNumber":"partName":"nonSort" item=nodeName}	
		{if $contents.$nodeName}
			<tr>
				<td>{translate key="plugins.schemas.mods.fields.$nodeName.name}</td>
				<td>{$contents.$nodeName|escape|nl2br}</td>
			</tr>
		{/if}
	{/foreach}
	
	<tr>
		<td>{translate key="plugins.schemas.mods.names"}</td>
		<td>
			{foreach from=$contents.names item=name name=names}
				{$name.namePart}
				{foreach from=$name.roles item=role name=roles}
					{if $smarty.foreach.roles.first}({/if}{$role.term}{if $smarty.foreach.roles.last}){else}, {/if}
				{/foreach}
				<br/>
			{/foreach}
		</td>
	</tr>

	{foreach from="typeOfResourceCollection"|to_array:"typeOfResourceManuscript" item=nodeName}	
		{if $contents.$nodeName}
			<tr>
				<td>{translate key="plugins.schemas.mods.fields.$nodeName.name}</td>
				<td>{$contents.$nodeName|escape|nl2br}</td>
			</tr>
			
		{/if}
	{/foreach}
	{foreach from="publisher"|to_array:"edition":"issuance":"frequency" item=nodeName}	
		{if $contents.originInfo.$nodeName}
			<tr>
				<td>{translate key="plugins.schemas.mods.fields.$nodeName.name}</td>
				<td>{$contents.originInfo.$nodeName|escape|nl2br}</td>
			</tr>
		
		{/if}
	{/foreach}
	{foreach from="dateIssued"|to_array:"dateCreated":"dateCaptured":"dateValid":"dateModified":"copyrightDate":"dateOther" item=nodeName}	
		{if $contents.originInfo.$nodeName}
			<tr>
				<td>{translate key="plugins.schemas.mods.fields.$nodeName.name}</td>
				<td>{$contents.originInfo.$nodeName.value|escape|nl2br} ({$contents.originInfo.$nodeName.encoding|escape|nl2br})</td>
			</tr>
			
		{/if}
	{/foreach}
	{foreach from=$contents.originInfo.places item=place}
		<tr>
			<td>{translate key="plugins.schemas.mods.fields.place.name"}</td>
			<td>{$place.term|escape|nl2br}</td>
		</tr>
		
	{/foreach}
	{foreach from=$contents.languages item=language}
		<tr>
			<td>{translate key="plugins.schemas.mods.fields.language.name"}</td>
			<td>{$language.term|escape|nl2br}</td>
		</tr>
		
	{/foreach}
	{foreach from="form"|to_array:"reformattingQuality":"internetMediaType":"extent":"digitalOrigin":"note":"abstract":"genre":"tableOfContents":"targetAudience":"classification":"accessCondition":"extension":"subjectTopic":"subjectGeographic":"subjectTemporal":"subjectGeographicCode":"subjectGenre":"subjectOccupation" item=nodeName}	
		{if $contents.$nodeName}
			<tr>
				<td>{translate key="plugins.schemas.mods.fields.$nodeName.name}</td>
				<td>{$contents.$nodeName|escape|nl2br}</td>
			</tr>
			
		{/if}
	{/foreach}
	{if $contents.identifier}
		<tr>
			<td>{translate key="plugins.schemas.mods.fields.identifier.name"}</td>
			<td>{$contents.identifier|escape}</td>
		</tr>
		
	{/if}
	{foreach from=$contents.locations item=location}
		{foreach from="physicalLocation"|to_array:"shelfLocator":"holdingExternal":"url" item=nodeName}
			{if $location.$nodeName}
				<tr>
					<td>{translate key="plugins.schemas.mods.fields.$nodeName.name"}</td>
					<td>{$location.$nodeName|escape|nl2br}</td>
				</tr>
				
			{/if}
		{/foreach}
	{/foreach}
	{**
    *
	*{foreach from=$contents.relatedItems item=relatedItem}
	*	<tr>
	*		<td>{translate key="plugins.schemas.mods.fields.relatedItem.name"}</td>
	*		<td>
	*			{$relatedItem.title|escape|nl2br}
	*		</td>
	*	</tr>
	*	
	*{/foreach} *}
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

