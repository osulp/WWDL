{**
 * header.tpl
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site header.
 *
 *}

{strip}
{if $pageCrumbTitle}
	{translate|assign:"pageCrumbTitleTranslated" key=$pageCrumbTitle}
{elseif !$pageCrumbTitleTranslated}
	{assign var="pageCrumbTitleTranslated" value=$pageTitleTranslated}
{/if}
{/strip}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset={$defaultCharset|escape}" />
	<title>{$pageTitle} - Western Waters Digital Library</title>
	 <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<meta name="description" content="{$metaSearchDescription|escape}" />
	<meta name="keywords" content="{$metaSearchKeywords|escape}" />
	<meta name="generator" content="{$applicationName} {$currentVersionString|escape}" />
	{$metaCustomHeaders}
	{if $displayFavicon}<link rel="icon" href="{$faviconDir}/{$displayFavicon.uploadName|escape:"url"}" />{/if}
	<link rel="stylesheet" href="{$baseUrl}/styles/bootstrap.min.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/font-awesome.min.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/prettyPhoto.css" type="text/css" />
	<link rel="stylesheet" href="{$baseUrl}/styles/main.css" type="text/css" />
	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="{$baseUrl}/js/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>

	
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/general.js"></script>
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/tag-it.js"></script>
	<!-- Add javascript required for font sizer -->
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/jquery.cookie.js"></script>	
	<script type="text/javascript" src="{$baseUrl}/lib/pkp/js/fontController.js" ></script>
	<script type="text/javascript">{literal}
		$(function(){
			fontSize("#sizer", "body", 9, 16, 32, "{/literal}{$baseUrl}{literal}"); // Initialize the font sizer
		});
	{/literal}</script>
	<script src="{$baseUrl}/js/init.js" type="text/javascript"></script>
	{ if $pageTitle == 'Participants'}
		<script type="text/javascript" src="{$baseUrl}/js/tabs.js"></script>
	{/if}
	{ if $pageTitle == 'Home'}
		<script type="text/javascript" src="{$baseUrl}/js/search.js"></script>
	{/if}
	
	<script type="text/javascript">
        // initialise plugins
		{literal}
        $(function(){
        	{/literal}{if $validateId}{literal}
			jqueryValidatorI18n("{/literal}{$baseUrl}{literal}", "{/literal}{$currentLocale}{literal}"); // include the appropriate validation localization
			$("form[name={/literal}{$validateId}{literal}]").validate({
				errorClass: "error",
				highlight: function(element, errorClass) {
					$(element).parent().parent().addClass(errorClass);
				},
				unhighlight: function(element, errorClass) {
					$(element).parent().parent().removeClass(errorClass);
				}
			});
			{/literal}{/if}{literal}
		});
		{/literal}
    </script>

	{literal}
	<script>
		(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
					(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
				m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

		ga('create', 'UA-35760875-12', 'auto');
		ga('send', 'pageview');

	</script>
	{/literal}
	
	{$additionalHeadData}
</head>
<body id="totop">

<div id="page-wrapper">
<header id="header">
	<div class="container">
		<h1 id="logo"><a href="/"><img src="/img/wwdl-logo.png" alt="Western Waters Digital Library - Logo" /></a></h1>
		<nav class="main-menu">
	<a href="#" data-toggle="collapse" data-target=".nav-collapse" class="hidden-desktop menu-btn"><i class="icon-reorder"></i> Menu</a>
		<ul class="nav nav-pills nav-collapse collapse">
			<li><a href="/about">About</a></li>
			<li><a href="/collections">Collections</a> </li>
			<li><a href="/participants">Participants</a></li>
			<li><a href="/exhibits" >Exhibits</a></li>
			{*<li><a href="/blog" >News</a></li>*}
			<li><a href="/guides" >Research Guides</a></li>
			<li><a href="/contact" >Contact</a></li>
		</ul>
	</nav>
	</div>
</header>
	<div class="main-search">
	<div class="container">
		<h2 class="pull-left">Search the Collection</h2>
		<form class="form-inline pull-left" action="/misearch/results" method="get" name="searchForm">
				<input id="query" type="text" value="{php} if(isset($_GET['query'])) echo $_GET['query'] {/php}" name="query" />
			<select name="crosswalk-5">
					<option value="">All</option>
					<option value="text">Text</option>
					<option value="image">Images</option>
					<option value="(sound OR audio)">Audio</option>
					<option value="ead">EAD</option>
				</select>
			<button type="submit" class="btn" id="submitBtn">Search</button>
		</form>
		<a href="/misearch" class="pull-left" style="padding-right: 15px;">Advanced Search</a><br />
		<a href="/browse" class="pull-left" style="padding-right: 15px;">Browse by Institution</a>
		<div class="clearfix"></div>
	</div>
</div>
	

