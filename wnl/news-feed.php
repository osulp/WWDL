<?php
$rss = simplexml_load_file("http://westernwaters.org/blog/?feed=rss2");
$items = $rss->channel->item;


$max_count = count($items);
if(!isset($max_show))
	$max_show = 5;
if(!isset($max_chars))
	$max_chars = 620;	

for($i = 0; $i < $max_count; $i++){
	if($i >= $max_show)
		break;
		
		echo("
<div class=\"post\"> 
		<div class=\"row-fluid\">
			<div class=\"details span12\">");
		echo("
<h4 class=\"post-title\"><a href=\"".$items[$i]->link. "\" target=\"_blank\">".$items[$i]->title."</a></h4>
<ul class=\"unstyled inline\">
									<li class=\"date\"><i class=\"icon-calendar\"></i> ".date("F d, o", strtotime($items[$i]->pubDate))."</li>
									<li class=\"author\"><i class=\"icon-user\"></i> By: ".$items[$i]->children('dc', true)->creator."</li>
									
								</ul>

");
		echo("
		<p class=\"post-description\">".substr($items[$i]->description, 0, $max_chars) . "... 
		<div class=\"fadeout\"></div>
							</div>
							<a class=\"btn pull-right\" href='".$items[$i]->link."'>Full Post</a>
						</div>
		
		");
		echo("</div>
");
	}


?>