{**
 * templates/browse/index.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Browse page.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="Browse Archives"}
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

{iterate from=archives item=archive}
	{if !$notFirstArchive}
		{assign var=notFirstArchive value=1}
		<table class="table table-striped table-bordered">
	{/if}

	{assign var="archiveImage" value=$archive->getSetting('archiveImage')}
	{if $archiveImage}
		<div class="archiveImage">
			<a href="{url path=$archive->getArchiveId()}" class="action"><img src="{$publicFilesDir}/{$archiveImage.uploadName|escape:"url"}" {if $archiveImage.altText != ''}alt="{$archiveImage.altText|escape}"{else}alt="{translate key="archive.image"}"{/if} /></a>
		</div>
	{/if}

	
		<tr>
		<td>
		<p class="pull-right"><strong>{translate key="browse.recordCount" count=$archive->getRecordCount()}</strong></p>
		<h4><a href="{url path=$archive->getArchiveId()}">{$archive->getTitle()|escape}</a></h4>
	
		<p>
			{$archive->getSetting('description')|strip_unsafe_html|nl2br}			
		</p>
		</td>
		</tr>
	

{/iterate}

{if $notFirstArchive}
	</table>{* archives *}
{/if}


<div class="mainBrowse">
{if $archives->wasEmpty()}
	<p>{translate key="admin.archives.noneCreated"}</p>
{else}
	{page_info iterator=$archives}&nbsp;&nbsp;&nbsp;&nbsp;{page_links anchor="archives" name="archives" iterator=$archives}
{/if}
</div>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

