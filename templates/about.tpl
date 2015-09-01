{assign var="pageTitle" value="About"}
{assign var="small_page" value="true"}
{assign var="rightcol_on" value="true"}
{assign var="rightcol_image" value="blacksmith.jpg"}
{include file="common/header.tpl"}
<div id="subpage" class="item">

</div>
<div class="white">
	<div class="container">
		<div class="mainContent">
			<div class="row-fluid">
				<div class="span8">
					<h3><span>About</span> Western Waters Digital Library</h3>
					<p>The Western Waters Digital Library (WWDL) provides free public access to a wide range of significant resources on water in the Western United States. Available resources include classic water literature, legal transcripts, maps, reports, personal papers, water project records, photographs, audio recordings, videos, and other material. The WWDL also includes selected collection guides. These guides, also known as finding aids, describe a collection’s content, significance, and relevance to a particular research topic. Visit our <a href="/faq">FAQ page</a> for more information. </p>
					<h3><span>History</span> of the Western Waters Digital Library</h3>
					<p>The WWDL began as a collaborative regional project created by twelve research libraries from eight western states under the auspices of the Greater Western Library Alliance (GWLA). Funding for the WWDL has been provided by the National Endowment for the Humanities (NEH) and the Institute of Museum and Library Services (IMLS).</p>
					<h3><span>Link</span> to the Western Waters Digital Library</h3>
					<p>If you wish to link to the Western Waters Digital Library on your web site, you can use this button:
	<br />
	<img src="http://westernwaters.org/img/wwdl-btn.jpg" width="262" height="81" alt="WWDL" longdesc="http://westernwaters.org">
<br />
	Or, copy and paste this code into your web page:<br />
	<pre>&lt;a href="http://westernwaters.org"&gt;&lt;img src="http://westernwaters.org/img/wwdl-btn.jpg" width="262" height="81" alt="Western Waters Digital Llibrary"&gt;&lt;/a&gt;</pre>
	</p>
	<h3>Add a <span>WWDL Search Widget</span> to your own web site</h3>
	<div style="block; background: #244B74; padding: 8px; margin: 3px; -moz-border-radius: 5px; border-radius: 5px; color: #dfebf2; font-family: Arial, Helvetica, sans-serif; border: solid 3px #81a7df; width: 90%; ">
<img src="http://westernwaters.org/img/wwdlMiniLogo.png" alt="Western Waters Digital Library">
<form id="searchForm" action="http://westernwaters.org/misearch/results" method="get" name="searchForm" class="form-inline">
    <strong>Search:</strong>
    <input id="query" type="text" value="" name="query" size="25">
    <select name="crosswalk-5">
        <option value="">All</option>
        <option value="text">Text</option>
        <option value="image">Images</option>
        <option value="(sound OR audio)">Audio</option>
        <option value="ead">EAD</option>
    </select>
    <input id="submitBtn" class="btn" type="submit" value="Go">
	<br>
    <a href="http://westernwaters.org/browse" style="color: #d7f2fb; font-size: 12px; float: left; padding: 0 0 0 66px;">Browse by Institution</a>
    <a style="color: #d7f2fb; font-size: 12px; float: left; padding: 0 0 0 55px;" href="http://westernwaters.org/misearch">Advanced Search</a>
</form>
<div style="clear: both;"></div>

</div>
<hr />
<p>Here is the search widget code to copy and paste into your own site. Feel free to adjust the style to fit in with your own templates:</p>
<pre>&lt;div style="block; background: #244B74; padding: 8px; margin: 3px; -moz-border-radius: 5px; border-radius: 5px; color: #dfebf2; font-family: Arial, Helvetica, sans-serif; border: solid 3px #81a7df; width: 350px; "&gt;
&lt;img src="http://westernwaters.org/img/wwdlMiniLogo.png" alt="Western Waters Digital Library" /&gt;
&lt;form id="searchForm" action="http://westernwaters.org/misearch/results" method="get" name="searchForm"&gt;
&lt;strong&gt;Search:&lt;/strong&gt;
&lt;input id="query" type="text" value="" name="query" size="25"&gt;
&lt;select name="crosswalk-5"&gt;
&lt;option value=""&gt;All&lt;/option&gt;
&lt;option value="text"&gt;Text&lt;/option&gt;
&lt;option value="image"&gt;Images&lt;/option&gt;
&lt;option value="(sound OR audio)"&gt;Audio&lt;/option&gt;
&lt;option value="ead"&gt;EAD&lt;/option&gt;
&lt;/select&gt;
&lt;input id="submitBtn" class="submitBtn" type="submit" value="Go"&gt;
&lt;br /&gt;
&lt;a href="http://westernwaters.org/browse" style="color: #d7f2fb; font-size: 12px; float: left; padding: 0 0 0 66px;"&gt;Browse by Institution&lt;/a&gt;
&lt;a style="color: #d7f2fb; font-size: 12px; float: left; padding: 0 0 0 55px;" href="http://westernwaters.org/misearch"&gt;Advanced Search&lt;/a&gt;
&lt;/form&gt;
&lt;div style="clear: both;"&gt;&lt;/div&gt;
&lt;/div&gt;
</pre>
	
					</div>
		
				<div class="span4">
					<h3>Exhibits</h3>
				
					<ul class="unstyled-list">
						<li><a href="/exhibits">All Exhibits</a></li>
					
					</ul>	
					<hr  />
					<h4>Featured Exhibits</h4>
						<p><a href="/exhibits?p=EdwardCFritz"><img src="/img/exhibitThumb1.jpg" alt="Edward C. Fritz Papers" /></a></p>
						<p><a href="/exhibits?p=salmon"><img src="/img/exhibitThumbSalmon.jpg" alt="Salmon in the Norhtwest" /></a></p>
						<p><a href="/exhibits?p=maps"><img src="/img/mapsThumb.jpg" alt="Maps" /></a></p>
				</div>
			</div>
		</div>
	</div>
</div>


 {include file="common/footer.tpl"}
