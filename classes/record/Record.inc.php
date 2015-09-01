<?php

/**
 * @file Record.inc.php
 *
 * Copyright (c) 2005-2012 Alec Smecher and John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @package record
 * @class Record
 *
 * Record class.
 * Describes basic record properties.
 *
 * $Id$
 */

class Record extends DataObject {
	/**
	 * Constructor.
	 */
	function Record() {
		parent::DataObject();
	}

	//
	// Get/set methods
	//

	/**
	 * Get identifier for record
	 * @return string
	 */
	function getIdentifier() {
	 	return $this->getData('identifier');
	}

	/**
	 * Set identifier for record
	 * @param $identifier string
	 */
	function setIdentifier($identifier) {
		return $this->setData('identifier',$identifier);
	}

	/**
	 * Get contents for record
	 * @return string
	 */
	function getContents() {
	 	return $this->getData('contents');
	}

	/**
	 * Set contents for record
	 * @param $contents string
	 */
	function setContents($contents) {
		return $this->setData('contents',$contents);
	}

	/**
	 * Get parsed contents for record
	 * @return object
	 */
	function getParsedContents() {
	 	return $this->getData('parsedContents');
	}

	/**
	 * Set parsed for record
	 * @param $parsedContents object
	 */
	function setParsedContents($parsedContents) {
		return $this->setData('parsedContents',$parsedContents);
	}

	/**
	 * Get datestamp of record
	 * @return string
	 */
	function getDatestamp() {
	 	return $this->getData('datestamp');
	}

	/**
	 * Set datestamp of record
	 * @param $datestamp string
	 */
	function setDatestamp($datestamp) {
		return $this->setData('datestamp',$datestamp);
	}

	/**
	 * Get ID of record.
	 * @return int
	 */
	function getRecordId() {
		return $this->getData('recordId');
	}

	/**
	 * Set ID of record.
	 * @param $recordId int
	 */
	function setRecordId($recordId) {
		return $this->setData('recordId', $recordId);
	}

	/**
	 * Get ID of this record's schema.
	 * @return int
	 */
	function getSchemaId() {
		return $this->getData('schemaId');
	}

	/**
	 * Set ID of this record's schema.
	 * @param $recordId int
	 */
	function setSchemaId($schemaId) {
		return $this->setData('schemaId', $schemaId);
	}

	/**
	 * Get ID of archive.
	 * @return int
	 */
	function getArchiveId() {
		return $this->getData('archiveId');
	}

	/**
	 * Set ID of archive.
	 * @param $archiveId int
	 */
	function setArchiveId($archiveId) {
		return $this->setData('archiveId', $archiveId);
	}

	/**
	 * Get the archive for this record.
	 * @return object
	 */
	function &getArchive() {
		$archiveDao =& DAORegistry::getDAO('ArchiveDAO');
		return $archiveDao->getArchive($this->getArchiveId(), false);
	}

	function displaySummary() {
		$plugin =& $this->getSchemaPlugin();
		$plugin->displayRecordSummary($this);
	}

	function display() {
		$plugin =& $this->getSchemaPlugin();
		$plugin->displayRecord($this);
	}

	function getUrl() {
		$plugin =& $this->getSchemaPlugin();
		return $plugin->getUrl($this);
	}

	function &getSchemaPlugin() {
		$schemaDao =& DAORegistry::getDAO('SchemaDAO');
		$schema =& $schemaDao->getSchema($this->getSchemaId());
		return $schema->getPlugin();
	}

	function getTitle() {
		$plugin =& $this->getSchemaPlugin();
		return $plugin->getTitle($this);
	}

	function getAuthors() {
		$plugin =& $this->getSchemaPlugin();
		return $plugin->getAuthors($this);
	}

	function getAuthorString() {
		$plugin =& $this->getSchemaPlugin();
		return $plugin->getAuthorString($this);
	}
	
	
	// Nathan Pugh - MLIB Application Programming - University of Utah 
	// 2007-04-23
	// getThumbnailUrl:  Returns a thumbnail url for the record if available. 
	//							Currently selects identifiers with .jpg|.jp2|.gif|.png
	//							or returns thumbnail.exe links if Contentdm servers.
	function getThumbnailUrl()
	{
		$baseUrl = Request::getBaseUrl();
		
		$value = $this->getUrl();
		//var_dump($value); exit;
		//print_r($this);
		if ( preg_match('/digital\.lib\.uh\.edu/', $value) )
		{
			preg_match("/collection\/(.+)\/id\/(.+)/", $value, $match);
			return "http://digital.lib.uh.edu/contentdm/image/thumbnail/{$match[1]}/{$match[2]}" ;
		}
		else if( preg_match('/CISOPTR/', $value) || preg_match('/\/u\?/', $value) ) 
		{
			// CDM url, mash it up.
			// TODO: Cache the archive, so it doesn't have to be pulled for each record?  How?  Where?	
			$archive = $this->getArchive(); 
			$server = $archive->getUrl(); 
			// We're extracting the CISOROOT and the CISOPTR from the url, which is expected to be in 
			// one of two formats: 
			// 	1) http://server/viewer_page?CISOROOT=/{the cisoroot}&CISOPTR={numeric cisoptr}	// CDM long format
			// 	2) http://server/u?/{the cisoroot},{numeric cisoptr}										// CDM Short format
			
			// Trim server path and dirs to get us either {cisoroot}&CISOPTR={cisoptr} or {cisoroot},{cisoptr}
			$urlparams = basename($value);
			$parts = explode("&CISOPTR=", $urlparams); 
			if( $parts[0] == $urlparams )
				$parts = explode(",", $urlparams); 
				
			if( count($parts) != 2 ) 
				return ''; 
				
			$cisoroot = $parts[0]; 
			$cisoptr = intval($parts[1]); 

			$server = rtrim($server, "/");
			$port = "";
			//echo $server ."<br>"; echo $value; exit;
			if(strpos($value, ":81") !== false) {
				$port = ":81";
			}
			$url = $server . $port . "/cgi-bin/thumbnail.exe?CISOROOT=/$cisoroot&CISOPTR=$cisoptr";
			return $url; 
		}
		else if(preg_match('/cdm\/ref\/collection\/([^\/]+)\/id\/([0-9]+)/', $value, $matches)) {
			$url = str_replace("cdm/ref/", "utils/getthumbnail/", $value);
			return $url;
		}
		else if( preg_match('/^[a-z]+:\/\/.*(?=(jpg|jp2|gif|png)$)/', $value) ) 
		{
			// Image url, just return it
			return $value;
		}
		//Okay, so there's a number of places that DON'T use ContentDM so we need to handle them differently
		//Part of CSU is using DigiTools which holds things differently for thumbnails  -Curtis Mirci
		else if ( preg_match('/digitool\.library\.colostate\.edu/', $value) )
		{
			$data = $this->getParsedContents();

			// Return last identifier in the array
			return end($data['identifier']);
		}
		else if ( preg_match('/digilib\.ucr\.edu/', $value) )
		{
			$data = $this->getParsedContents();

			// Return last identifier in the array
			$last_link = end($data['identifier']);
			$last_slash = strrpos($last_link, "/");
			$token = substr($last_link, $last_slash);
			$token = str_replace("pdf", "jpg", $token);

			return "http://digilib.ucr.edu/files/square_thumbnails" . $token;
		}
		//Berkley has some with thumbnails and some without. (UC Berkeley - Water Resources Center Archives)
		else if ( preg_match('/.+ark\.cdlib\.org\/ark:\/13030.+$/', $value) )
		{
			//The ones that have thumbnails are located at the following url
			//http://ark.cdlib.org/ark:/13030/*********/thumbnails
			$value = $value . '/thumbnail';
			return $value;
		}
		else if ( preg_match('/.+ark\.cdlib\.org\/ark:\/28722.+$/', $value) )
		{
			//The ones that have thumbnails that are located at the following url
			//http://ark.cdlib.org/ark:/28722/*********/thumbnails
			//need to be changed before a thumbnail can be obtained
			$value = str_replace("ark.", "content.", $value);
			$value = $value . '/thumbnail';
			return $value;
		}
		else if (preg_match('/.+oac\.cdlib\.org\/findaid\/ark:.+$/', $value))
		{
			//These are the ones that don't have a thumbnail and should use the default
			//http://www.oac.cdlib.org/findaid/ark:/13030/kt8f59p171
			return "$baseUrl/img/default_thumbnails/WRCA_EAD.JPG";
		}
		//BYU OAI is also not on contentDM
		else if (preg_match('/.+findingaid\.lib\.byu\.edu\/viewItem.+/', $value))
		{
			//http://findingaid.lib.byu.edu/viewItem/MSS SC 1834
			return "$baseUrl/img/default_thumbnails/Brigham_EAD.JPG";
		}
			
		// If we've come this far, return an empty string.
		return ''; 
	}


}

?>
