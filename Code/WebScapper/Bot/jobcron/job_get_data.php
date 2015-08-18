<?php
$root = 'E:\SOLUTION\Java\RECSYS\trunk\Code\WebScapper\Bot';
require_once $root . '\jobcron\scraping.php';
$page_count = 60;
ws_init_system ();
ws_login_to_webserver ( $xpathData );

foreach ( $xpathData as $row ) {
	
	// for each page
	for($i = 0; $i < $page_count; $i ++) {
		// get all job urls in page
		$ret = ws_get_job_url ( $row ['home_url'] . "$i", $row ['base_url'], $row ['xpath_code'] );
		// if page is less than 60
		if ($ret == null)
			break;
		// get usage data & save
		foreach ( $ret as $url ) {
			$cookie = "";
			if ($row ['login_url'] != '') {
				$cookie = "cookie" . $row ['id'] . ".txt";
			}
			ws_get_detail_job ( $url, $row ['job_xpath'], $row ['company_xpath'], $row ['location_xpath'], $row ['description_xpath'], $row ['salary_xpath'], $row ['requirement_xpath'], $row ['benifit_xpath'], $row ['expired_xpath'], $row ['tags_xpath'], $cookie );
		}
	}
}
?>