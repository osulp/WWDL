<?
	$db = mysql_connect("localhost", "wwdl", "water111");
	mysql_select_db("wwdl");

	$query = mysql_query("select a.title, a.url, aa.setting_value from archive_settings aa, archives a where aa.archive_id = a.archive_id and setting_name = 'defaultSets' order by a.title");
	while ($row = mysql_fetch_assoc($query)) {

		echo $row['title'] . " ({$row['url']})\n";
		
		$sets = unserialize($row['setting_value']);
		foreach($sets as $set) {
			echo "\t$set\n";
		}
	}

	mysql_free_result($query);
	mysql_close($db);

?>
