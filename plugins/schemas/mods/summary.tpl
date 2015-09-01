{**
 * plugins/schemas/mods/summary.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display a summary of a MODS record.
 *
 * $Id$
 *}
<!--{$record->getRecordId()}-->
{assign var=contents value=$record->getParsedContents()}

<tr>
	<td>
	<div class="row-fluid">

<div class="span2"><a href="/record/view/{$record->getRecordId()}" class="action">{if $record->getThumbnailUrl() != ""}<img src="{$record->getThumbnailUrl()}" />{/if}</a>

</div>
	<div class="span3">
		<a href="/record/view/{$record->getRecordId()}" class="action">
		<span class="title">{$record->getTitle()|strip_unsafe_html|truncate:90:"...":false:false:false|default:"&mdash"}</span><br />
		</a>
	
	</div>
	<div class="span5">
		{$contents.abstract|mb_truncate:250:"..."}
	</div>
	<div class="span2">
		{foreach from="dateIssued"|to_array:"dateCreated":"dateCaptured":"dateValid":"dateModified":"copyrightDate":"dateOther" item=nodeName}	
			{if $contents.originInfo.$nodeName}
				{$contents.originInfo.$nodeName.value|escape|nl2br} ({$contents.originInfo.$nodeName.encoding|escape|nl2br})
			{/if}
		{/foreach}
		</div>
	</div>
	</td>
</tr>
