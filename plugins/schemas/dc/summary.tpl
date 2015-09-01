{**
 * plugins/schemas/dc/summary.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display a summary of a Dublin Core record.
 *
 * $Id$
 *}

<tr>
<td>
<!--{$record->getRecordId()} test-->
{assign var=contents value=$record->getParsedContents()}
<div class="row-fluid">

<div class="span2"><a href="/record/view/{$record->getRecordId()}" class="action">{if $record->getThumbnailUrl() != ""}<img src="{$record->getThumbnailUrl()}" />{/if}</a></div>
	<div class="span3">
		<a href="/record/view/{$record->getRecordId()}" class="action">
		<span class="title">{$record->getTitle()|strip_unsafe_html|truncate:90:"...":false:false:false|default:"&mdash"}</span><br />
		</a>
	</div>
	<div class="span5">
		{$contents.description[0]|mb_truncate:250:"..."}
	</div>
	<div class="span2">
		{foreach from=$contents.date item=date}
			{$date|strtotime|date_format:$dateFormatShort}<br />
		{/foreach}
	</div>
</div>
</td>
</tr>
