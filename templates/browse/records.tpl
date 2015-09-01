{**
 * templates/browse/records.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Browse page for a specific archive or all records in all archives.
 *
 * $Id$
 *}
{* Make the quick search form limit itself to this archive by default *}
{strip}
{if $archive}
{assign var="pageTitle" value=$archive->getTitle()}
{/if}
{assign var="helpTopicId" value="index.browse"}
{include file="common/header.tpl"}
{/strip}
<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">
				
<p class="headerLeft">Browse by Archive</p>
{if $archive}
	{assign var=archiveId value=$archive->getArchiveId()}
	<h3><a href="{$archive->getUrl()|escape}">{$archive->getTitle()|escape}</a></h3>
	<p><a class="action" href="/browse/archiveInfo/{$archive->getArchiveId()}">{translate key="browse.archiveInfo"}</a></p>
{else}
	{assign var=archiveId value="all"}
{/if}

{* Sort orders *}

{assign var=isFirst value=1}

{iterate from=sortOrders item=sortOrder}
	{if $isFirst}
		{assign var=isFirst value=0}
	{else}
		&nbsp;|&nbsp; 
	{/if}
	<a class="action" href="{url path=$archiveId sortOrderId=$sortOrder->getSortOrderId()}">{$sortOrder->getSortOrderName()|escape}</a>
{/iterate}

<table class="table table-striped table-bordered">
	
		{iterate from=records item=record}
		{$record->displaySummary()}
		{/iterate}
		

</table>
<div class="pagesNav">
	{page_info iterator=$records}&nbsp;&nbsp;&nbsp;&nbsp;{page_links anchor="records" name="records" sortOrderId=$sortOrderId iterator=$records}
</div>
</div>



</div>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

