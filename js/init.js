jQuery(function(){
	var pagemenuwidth = jQuery("ul#page-menu").width();
	var pagemleft = Math.round((950 - pagemenuwidth) / 2);
	jQuery("ul#page-menu").css('padding-left',pagemleft);
	
	var catmenuwidth = jQuery("ul#cats-menu").width();
	var catmleft = Math.round((950 - catmenuwidth) / 2);
	jQuery("ul#cats-menu").css('padding-left',catmleft);
	
	if (!((jQuery(".custom-sidebar-block").length) == 0)) jQuery(".custom-sidebar-block").tabs({ fx: { opacity: 'toggle' } });
	
	if (!(typeof document.body.style.maxHeight === "undefined")) {
		jQuery("div#mainposts.notop div.mainpost-wrap").eq(0).addClass("topbg");
		jQuery("div#mainposts.notop div.mainpost-wrap").eq(1).addClass("topbg");
		jQuery("div.blogstyle.indexpage").eq(0).removeClass("blogstyle");
	}
});
