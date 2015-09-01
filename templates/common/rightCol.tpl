<div id="sidebar">

	<div class="custom-sidebar-block">
		<ul class="control">
			<li class="news active"><a href="#news-tabbed">News and Events</a></li>
			<li class="recent"><a href="#recent-tabbed">Featured</a></li>
			<li class="comments"><a href="#comments-tabbed" class="last">Finding Aids</a></li>
		</ul>
		<div class="content">
			<div id="news-tabbed">
{php} $max_chars = 38; $max_show = 4; include( $_SERVER["DOCUMENT_ROOT"] . "/templates/common/wwdlFeed.php") {/php}
			
			</div> <!-- end news -->
			
			<div id="recent-tabbed">
			{assign var=offset value=1|mt_rand:4}
			{if $offset eq 1}
				{include file="common/featuredCol1.tpl"}
			{elseif $offset eq 2}
				{include file="common/featuredCol2.tpl"}
			{elseif $offset eq 3}
				{include file="common/featuredCol3.tpl"}
			{else}
				{include file="common/featuredCol4.tpl"}
			{/if}
			
			</div> <!-- end recent -->
			<!-- end popular -->
			<div id="comments-tabbed">
				<ul>
					<li><a href="http://findingaid.lib.byu.edu/viewItem/MSS%20146" target="_blank">Arthur V. Watkins Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,0" target="_blank">C. Gregory Crampton Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,7" target="_blank">Charles Eggert Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf7q2nb3b5/" target="_blank">Charles H. Lee Papers</a></li>
					<li><a href="http://content.wsulibs.wsu.edu/cdm-koester/wwdl_ead.html" target="_blank">Clifford Koester Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,3" target="_blank">Colorado Riverbed Case</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&object_id=79245">Colorado Water Congress Collection</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&object_id=79246" >Delph E. Carpenter and Family </a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,4" target="_blank">Dorothy Harvey</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf958007kr/" target="_blank">Edward Hyatt Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,9" target="_blank">E. Richard Hart Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,6" target="_blank">Flaming Gorge Dam Collection</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,8" target="_blank">Floyd A. O&rsquo;Neil</a></li>
					<li><a href="http://content.wsulibs.wsu.edu/cdm-banks/wwdl_ead.html" target="_blank">Frank A Banks Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf9489p11x/" target="_blank">Frank Adams Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,5" target="_blank">Glen Canyon Archaeological Survey</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,18" target="_blank">Institute of the North American West</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79247" >Ival V. Goslin Water Resources Collection </a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf3v19n78q/" target="_blank">James D. Schuyler Papers</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79248" >James L. Ogilvie </a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,13" target="_blank">John Boyden Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf4199n757/" target="_blank">John S. Eastwood Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf3h4nb0ks/" target="_blank">Joseph Barlow Lippincott Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/kt5w10324n/" target="_blank">Milton N. Nathanson Papers</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79249" >National Water Resources Association </a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&object_id=79250" >Robert E. Glover </a></li>

					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&object_id=79248" >Stephen Boyden Papers</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&object_id=79249" >Thomas H. Means Papers</a></li>
					<li><a target="_blank" href="http://findingaid.lib.byu.edu/viewItem/MSS%2020" >Wallace Foster Bennett Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf32900395/" target="_blank">Walter L. Huber Photograph Collection</a></li>
				</ul>		
			</div> <!-- end comments -->
		</div>
	</div> <!-- end custom-sidebar-block-->

	<div class="clear">
	</div><!-- end sidebar block --><!-- end sidebar block --><!-- end sidebar block --><!-- end sidebar block -->
	<iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fwww.facebook.com%2FWesternWatersDigitalLibrary&amp;send=false&amp;layout=standard&amp;width=450&amp;show_faces=false&amp;font&amp;colorscheme=light&amp;action=like&amp;height=35" scrolling="no" frameborder="0" style="border:none; padding: 15px 0 0 15px; overflow:hidden; width:450px; height:35px;" allowTransparency="true"></iframe>
</div>
