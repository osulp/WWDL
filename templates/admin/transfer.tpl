{**
 * templates/admin/transfer.tpl
 *
 * $Id$
 *}
{strip}
{assign var="pageTitle" value="Transfer"}
{include file="common/header.tpl"}
{/strip}
<div id="subpage" class="item">
</div>
<div class="white">
<div class="container">
<div class="mainContent">
<div class="row-fluid">
<div class="span12">

{php}
if(@$_GET['m'] == 's') {
	echo '<p class="alert alert-success">Success</p>';
}
else if(@$_GET['m'] == 'f') {
	echo '<p class="alert alert-error">You need to enter a description of changes.</p>';
}

{/php}

<h3>Changes to be made</h3>
<pre>
{php}
system("git add .");
system("git status");
{/php}
</pre>

<h3>Full Diff</h3>
<pre class="prescroll">
{php}
unset($output);
exec("git diff HEAD", $output);
echo htmlentities(implode($output, "\n"));
{/php}
</pre>

<h3>Commit Changes</h3>
<form name="commit" method="post" action="{url op="commitChanges"}">
	<div>
		<label style="color: red">* Required</label>
		<textarea placeholder="Description of changes" name="description" style="width: 500px; height: 100px"></textarea>
	</div>
	<div>
		{php}
		unset($output);
		exec("cd /home/sites/wwdl && git status", $output);
		$prod_count = count($output);
		if($prod_count != 2) {
			echo '<button type="submit" name="submit" disabled="disabled">Production status is dirty!</button>';
			echo '<h3 style="color: red">Production Status</h3><pre>';
			echo htmlentities(implode($output, "\n"));
			echo '</pre>';
		}
		else
			echo '<button type="submit" name="submit" onclick="return confirm(\'Are you sure?\');">Commit changes</button>';
		{/php}
	</div>
</form>

<h3>Recent Updates</h3>
<pre class="prescroll">
{php}
unset($output);
exec("cd /home/sites/wwdltest && git log", $output);
echo htmlentities(implode($output, "\n"));
{/php}

</pre>
</div>
</div>
</div>
</div>
</div>
{include file="common/footer.tpl"}

