<?php
$root = 'E:\SOLUTION\Java\RECSYS\trunk\Code\WebScapper\Bot';
require_once $root . '\jobcron\scraping.php';
$page_count = 1;
define("MAX_WRONG_LINK", 0.1);
define("MAX_WRONG_DATA",0.1);
ws_init_system();
ws_login_to_webserver($xpathData);
global $jobLog;

foreach($xpathData as $row)
{
	$count_link=0;
	$count_wrong_link=0;
	$count_wrong_data=0;
	// for each page
	for($i = 0; $i < $page_count; $i ++) {
		// get all job urls in page
		$ret= ws_test_job_url ($row ['home_url'] . "$i", $row ['base_url'], $row ['xpath_code'] );
		if($ret==null){
			continue;
		}
		$count_link= count($ret);
		// test detai page
		foreach ( $ret as $url ) {
			$cookie = "";
			if ($row ['login_url'] != '') {
				$cookie = "cookie" . $row ['id'] . ".txt";
			}
			
			if(ws_test_detail_job ( $url, $row ['job_xpath'], $row ['company_xpath'], $row ['location_xpath'], $row ['description_xpath'], $row ['salary_xpath'], $row ['requirement_xpath'], $row ['benifit_xpath'], $row ['expired_xpath'], $row ['tags_xpath'], $cookie )==0){
				$count_wrong_link++;
			}
			if(ws_test_detail_job ( $url, $row ['job_xpath'], $row ['company_xpath'], $row ['location_xpath'], $row ['description_xpath'], $row ['salary_xpath'], $row ['requirement_xpath'], $row ['benifit_xpath'], $row ['expired_xpath'], $row ['tags_xpath'], $cookie )==1){
				$count_wrong_data++;
			}
		}
		//case 2: link haven't data (<10% data) =>wrong home page xpath
		if($count_wrong_link/$count_link>MAX_WRONG_LINK)
		{
			$jobLog->write_log($row['home_url'].$i, (($count_wrong_link/$count_link)*100)."% wrong link");
		}
		if($count_wrong_data/$count_link>MAX_WRONG_DATA){
			$jobLog->write_log(getUrl($url), (($count_wrong_data/$count_link)*100)."% wrong detail xpath");
		}
	}
}