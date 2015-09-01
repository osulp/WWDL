{assign var="pageTitle" value="Home"}
{assign var="small_page" value="true"}
{assign var="rightcol_on" value="true"}
{assign var="rightcol_image" value="puebloDam.jpg"}
{include file="common/header.tpl"}
<div id="slideshow" >
<div id="myCarousel" class="carousel slide carousel-fade" >
  <!-- Carousel items -->
  <div class="carousel-inner">
    <div class="active item img1"><img src="/img/trans.png" alt="slide 1" style="width: 100%; height: 580px;" />
		<div class="carousel-caption">
                      <h4>Western Waters Digital Library</h4>
                      <p>Free public access to digital collections of significant primary and secondary resources on water in the western United States.</p>
					  <a class="btn pull-right" href="/about" >More about the Western Waters Digital Library</a> 
                    </div>
	</div>
    <div class="item img2"><img src="/img/trans.png" alt="slide 1" style="width: 100%; height: 580px;" />
	<div class="carousel-caption">
                      <h4>Edward C. Fritz Papers, 1950s - 2008</h4>
                      <p>Southern Methodist University (SMU) DeGolyer Library’s Edward C. Fritz Papers, 1950s-2008 digital collection contains 361 documents and photographs that record ...</p>
					  <a class="btn pull-right" href="/exhibits?p=EdwardCFritz">View Exhibit</a>
                    </div></div>
    <div class="item img3"><img src="/img/trans.png" alt="slide 1" style="width: 100%; height: 580px;" />
	<div class="carousel-caption">
                      <h4>Salmon in the Northwest</h4>
                      <p>The Salmon in the Northwest collection from University of Washington University Libraries contains documents, photographs and other original material describing...</p>
					  <a class="btn pull-right" href="/exhibits?p=salmon" >View Exhibit</a>
                    </div>
	</div>
  </div>
  <!-- Carousel nav -->
  <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>	
	</div>
<div class="grey">
	<div class="container">
		<div class="featured-items">
		<h3><span>Featured</span> Partners</h3>
			<div class="row-fluid">
			
				<div class="f-item span4">
				<a href="/index.php/browse/index/10"><img src="img/f-item1.jpg" alt="featured project example" /></a>
				<p class="f-title">University of Texas Digital Repository</p>
				<p class="f-descript">The Center for Research in Water Resources (CRWR) is a research component of the Bureau of Engineering Research at The University of Texas at Austin. CRWR carries out advanced research, education, design, and planning in water resources and waste management, primarily related to Texas but also involving...</p>
				</div>
				<div class="f-item span4">
				<a href="/index.php/browse/index/16"><img src="img/f-item2.jpg" alt="featured project example" /></a>
				<p class="f-title">Oregon Digital</p>
				<p class="f-descript">A collaboration between Oregon State University and the University of Oregon, Oregon Digital provides online access to the two university's unique digitized collections. Digital collections harvested in Western Waters include the Columbia River Basin Collection, Pacific Northwest Stream Survey Photograph...</p>
				</div>
				<div class="f-item span4">
				<a href="/index.php/browse/index/1"><img src="img/f-item3.jpg" alt="featured project example" /></a>
				<p class="f-title">J.W.Marriott Library Repository</p>
				<p class="f-descript">Search a variety of historical and contemporary material focused on western water issues. Collections include Arizona vs California Legal Records, the Colorado Riverbed Case Records, and papers on the Central Utah Project. Also included are photograph collections centered on water systems in the Salt Lake Valley...</p>
				</div>
			</div>
		</div>
	</div>
</div>	
<div class="white">
	<div class="container">
		<div class="mainContent home-news">
			<div class="row-fluid">
				<div class="span8">
					<h3><span>Recent</span> News</h3>
				{php}  include( $_SERVER["DOCUMENT_ROOT"] . "/wnl/news-feed.php"); {/php}
				
				</div>
				<div class="span4">
					<h3>Finding Aids</h3>
					<ul class="unstyled-list">
					<li><a href="http://findingaid.lib.byu.edu/viewItem/MSS%20146" target="_blank">Arthur V. Watkins Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,0" target="_blank">C. Gregory Crampton Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,7" target="_blank">Charles Eggert Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf7q2nb3b5/" target="_blank">Charles H. Lee Papers</a></li>
					<li><a href="http://content.wsulibs.wsu.edu/cdm-koester/wwdl_ead.html" target="_blank">Clifford Koester Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,3" target="_blank">Colorado Riverbed Case</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79245">Colorado Water Congress Collection</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79246">Delph E. Carpenter and Family </a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,4" target="_blank">Dorothy Harvey</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf958007kr/" target="_blank">Edward Hyatt Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,9" target="_blank">E. Richard Hart Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,6" target="_blank">Flaming Gorge Dam Collection</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,8" target="_blank">Floyd A. O’Neil</a></li>
					<li><a href="http://content.wsulibs.wsu.edu/cdm-banks/wwdl_ead.html" target="_blank">Frank A Banks Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf9489p11x/" target="_blank">Frank Adams Papers</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,5" target="_blank">Glen Canyon Archaeological Survey</a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,18" target="_blank">Institute of the North American West</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79247">Ival V. Goslin Water Resources Collection </a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf3v19n78q/" target="_blank">James D. Schuyler Papers</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79248">James L. Ogilvie </a></li>
					<li><a href="http://content.lib.utah.edu/u?/ww-EAD,13" target="_blank">John Boyden Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf4199n757/" target="_blank">John S. Eastwood Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf3h4nb0ks/" target="_blank">Joseph Barlow Lippincott Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/kt5w10324n/" target="_blank">Milton N. Nathanson Papers</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79249">National Water Resources Association </a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79250">Robert E. Glover </a></li>

					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79248">Stephen Boyden Papers</a></li>
					<li><a target="_blank" href="http://digitool.library.colostate.edu:80/R/?func=dbin-jump-full&amp;object_id=79249">Thomas H. Means Papers</a></li>
					<li><a target="_blank" href="http://findingaid.lib.byu.edu/viewItem/MSS%2020">Wallace Foster Bennett Papers</a></li>
					<li><a href="http://www.oac.cdlib.org/findaid/ark:/13030/tf32900395/" target="_blank">Walter L. Huber Photograph Collection</a></li>
				
					</ul>	
				</div>
			</div>
		</div>
	</div>
</div>


{include file="common/footer.tpl"}
