{**
 * templates/admin/archives.tpl
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Display list of archives in site administration.
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="admin.archives"}
{assign var="helpTopicId" value="management.archives"}
{include file="common/header.tpl"}
{/strip}

<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span12">
<table width="100%" class="listing">
	<tr>
		<td colspan="5" class="headseparator">&nbsp;</td>
	</tr>
	<tr valign="top" class="heading">
		<td width="">id</td>
		<td width="40%">{sort_heading key="archive.title" sort="title"}</td>
		<td width="30%">{sort_heading key="archive.url" sort="url"}</td>
		<td width="10%">{sort_heading key="user.role.submitter" sort="manager"}</td>
		<td width="5%">{translate key="archive.type"}</td>
		<td width="15%" align="right">{translate key="common.action"}</td>
	</tr>
	<tr>
		<td colspan="5" class="headseparator">&nbsp;</td>
	</tr>
	{iterate from=archives item=archive}
	<tr valign="top">
		<td>{$archive->getArchiveId()}</td>
		<td>{$archive->getTitle()|escape}</td>
		<td><a href="{$archive->getUrl()|escape}" target="_new">{$archive->getUrl()|escape|truncate:40}</a></td>
		<td>
			{assign var=submitUser value=$archive->getUser()}
			{if $submitUser}
				{$submitUser->getUsername()|escape}
			{else}
				&mdash;
			{/if}
		</td>
		<td>
			{assign var=pluginName value=$archive->getHarvesterPluginName()}
			{assign var=plugin value=$harvesters[$pluginName]}
			{if $plugin}
				{$plugin->getProtocolDisplayName()}
			{else}
				&mdash;
			{/if}
		</td>
		<td align="right"><a href="{url op="editArchive" path=$archive->getArchiveId()}" class="action">{translate key="common.edit"}</a>&nbsp;|&nbsp;<a href="{url op="manage" path=$archive->getArchiveId()}" class="action">{translate key="common.manage"}</a>&nbsp;|&nbsp;<a class="action" href="{url op="deleteArchive" path=$archive->getArchiveId() archivesPage=$archivesPage}" onclick="return confirm('{translate|escape:"jsparam" key="admin.archives.confirmDelete"}')">{translate key="common.delete"}</a></td>
	</tr>
	<tr>
		<td colspan="5" class="{if $archives->eof()}end{/if}separator">&nbsp;</td>
	</tr>
	{/iterate}
	{if $archives->wasEmpty()}
	<tr>
		<td colspan="5" class="nodata">{translate key="admin.archives.noneCreated"}</td>
	</tr>
	<tr>
		<td colspan="5" class="endseparator">&nbsp;</td>
	<tr>
	{else}
		<tr>
			<td colspan="2" align="left">{page_info iterator=$archives}</td>
			<td colspan="3" align="right">{page_links anchor="archives" name="archives" iterator=$archives sort=$sort sortDirection=$sortDirection}</td>
		</tr>
	{/if}
</table>

<p><a href="{url op="createArchive"}" class="action">{translate key="admin.archives.addArchive"}</a></p>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

