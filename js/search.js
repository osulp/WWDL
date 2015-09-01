var SearchTypes = new Array("text", "image", "audio", "all" );
var SearchTypeValue = new Array("text", "image", "(sound OR audio)", "" );
var ClassString;
if(document.all)
	ClassString = "className";
else
	ClassString = "class";

function Init(SearchType) {
	if(SearchType == undefined)
		SearchType = 3;	
	ChangeSearchType(SearchType);
	
	// Set the "Search tips:" link to toggle visibility on the div containing the tips
	toggle = document.getElementById('syntaxInstructionsToggle'); 
	div = document.getElementById('syntaxInstructionsDiv'); 
	if( toggle && div ) 
	{
		toggleElementVisibility(div); 
		toggle.onclick = function(ev) { toggleElementVisibility(div); } 
	}
}

function SubmitSearch() {

	// Get form values
	Type = document.forms["searchForm"].elements["field"];
	Search = document.forms["searchForm"].elements["sidebar-query"];
	
	// Check for search all with no search string
	if(Search.value == "" && Type.value == "all") {
		//Type.value = "";
		//alert(Type.value);
		alert("Please enter a search term.");
		return false;
	}
	
	return true;
}

function ChangeSearchType(Category) {

	for(var i = 0; i < SearchTypes.length; i++) {
		document.getElementById(SearchTypes[i]).removeAttribute(ClassString);
	}
	

	document.getElementById(SearchTypes[Category]).setAttribute(ClassString, "searchTypeSelected");
	
	Type = document.forms["searchForm"].elements["field"];
	Type.value = unescape(SearchTypeValue[Category]);
}
