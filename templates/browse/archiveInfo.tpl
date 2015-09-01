{**
 * templates/browse/archiveInfo.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Archive information page.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="browse.archiveInfo"}
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
				
<p class="headerLeft">Archive Details</p>
<h3>{$archive->getTitle()|escape}</h3>
<p style="margin-top: 6px"><a href="{$archive->getUrl()|escape}">{$archive->getUrl()|escape}</a></p>

{if $archive->getSetting('description') != ''}<p style="margin-top: 6px">{$archive->getSetting('description')|nl2br|strip_unsafe_html}</p>{/if}

{assign var=archiveImage value=$archive->getSetting('archiveImage')}
{if $archiveImage}
	{translate|assign:"defaultAlt" key="archive.image"}
	<img src="{$publicFilesDir}/{$archiveImage.uploadName|escape:"url"}" alt="{$archiveImage.altText|escape|default:$defaultAlt}"/><br />
{/if}

<p style="margin-top: 10px;">{call_hook name="Template::Browse::ArchiveInfo::DisplayExtendedArchiveInfo" archive=$archive}</p>

<br/>
<a href="/browse/index/{$archive->getArchiveId()}" class="action">{translate key="browse.browseRecords"}</a>



</div>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

