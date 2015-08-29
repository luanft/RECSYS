<?php
$root = 'E:/RECSYS/trunk/Code/WebCrawler/Bot';
$_SERVER ["DOCUMENT_ROOT"] = $root;
require_once $root . '/lib/download.php';
require_once $root . '/model/Model.php';
require_once $root . '/model/config.php';
require_once $root . '/lib/download.php';
require_once $root . '/lib/xpath.php';
require_once $root . '/lib/simple_html_dom.php';

// global variable
$xpathModel = null;
$jobModel = null;
$xpathData = null;
$total_pages = 10;
function ws_init_system() {
	global $xpathModel;
	global $xpathData;
	global $jobModel;
	global $jobLog;
	$xpathModel = new XPathModel ();
	$xpathData = $xpathModel->getAll ();
	$jobModel = new JobModel ();
	$jobLog = new LogJobModel ();
}
function ws_init_system_for_multi_process($url) {
	global $xpathModel;
	global $xpathData;
	global $jobModel;
	global $jobLog;
	$xpathModel = new XPathModel ();
	$xpathData = $xpathModel->get ( $url );
	$jobModel = new JobModel ();
	$jobLog = new LogJobModel ();
}

// login to webserver
// param: xpath table
function ws_login_to_webserver($xpathData) {
	foreach ( $xpathData as $row ) {
		try {
			if ($row ['login_url'] != '') {				
				login ( $row ['login_url'], $row ['login_data'], $_SERVER ["DOCUMENT_ROOT"]."/cookie/"."cookie". $row ['id'] . ".txt" );
				echo "Successfully loged to: " . $row ['id'] . "\n";
			}
		} catch ( Exception $e ) {
		}
	}
	return true;
}
// param: xpath,url,base
function ws_get_job_url($home_url, $based_url, $xpath) {
	// return data
	$links = array ();
	try {
		// get web content
		$data = curl_download_old ( $home_url );
		if ($data != '') {
			// extract job url
			$html = new simple_html_dom ();
			$html->load ( $data );
			$xml_nodes = get_xpath_node ( $html, $xpath );
			if ($xml_nodes) {
				// lay url
				foreach ( $xml_nodes as $node ) {
					$links [] = $based_url . $node->href;
				}
			}
		}
	} catch ( Exception $ex ) {
	}
	return $links;
}
function ws_get_detail_job($url, $job, $company, $location, $description, $salary, $requirement, $benifit, $expired, $tag, $cookie, $category) {
	global $jobModel;
	$data = curl_download_old ( $url, $cookie );
	if ($data != '') {
		// dismiss warning!
		libxml_use_internal_errors ( true );
		$doc = new DOMDocument ();
		$doc->loadHTML ( $data );
		$domXpath = new DOMXPath ( $doc );
		// lay data
		$djob = trim ( lay_du_lieu ( $domXpath, $job ) );
		// in case of xpath query error
		if ($djob != '') {
			// get general data
			$dcompany = trim ( lay_du_lieu ( $domXpath, $company ) );
			$dlocation = trim ( lay_du_lieu ( $domXpath, $location ) );
			$ddes = trim ( lay_du_lieu ( $domXpath, $description ) );
			$dsalary = trim ( lay_du_lieu ( $domXpath, $salary ) );
			$drequirement = trim ( lay_du_lieu ( $domXpath, $requirement ) );
			$dbenifit = trim ( lay_du_lieu ( $domXpath, $benifit ) );
			$dexpired = trim ( lay_du_lieu ( $domXpath, $expired ) );
			if ($dexpired == '')
				$dexpired = date ( "m" ) + 1 . "-" . date ( "d" ) . "-" . date ( "Y" );
				// get tag
			$dtag = "";
			$tag_nodes = get_nodes_list ( $domXpath, $tag )->item ( 0 );
			if ($tag_nodes->hasChildNodes ()) {
				for($i = 0; $i < $tag_nodes->childNodes->length; $i ++) {
					$tg = $tag_nodes->childNodes->item ( $i )->nodeValue;
					if (trim ( $tg ) != "")
						$dtag .= $tg . "|";
				}
				// remove last separator
				$dtag = substr ( $dtag, 0, - 1 );
			}
			// save data
			if (! $jobModel->isExist ( $url )) {
				$jobModel->AddNewJob ( 1, $djob, $dlocation, $dsalary, $ddes, $dcompany, $dtag, $drequirement, $dbenifit, $dexpired, $url, $category );
			}
		}
	}
	return false;
}
function ws_save_job() {
}
function ws_test_job_url($home_url, $based_url, $xpath) {
	global $jobLog;
	$links = array ();
	try {
		// get web content
		$data = curl_download_old ( $home_url );
		if ($data != '') {
			// extract job url
			$html = new simple_html_dom ();
			$html->load ( $data );
			$xml_nodes = get_xpath_node ( $html, $xpath );
			if ($xml_nodes) {
				foreach ( $xml_nodes as $node ) {
					$links [] = $based_url . $node->href;
				}
			} else {
				// case 1:not have any links =>wrong home page xpath
				$jobLog->write_log ( $home_url, "page don't have links" );
			}
		}
	} catch ( Exception $ex ) {
	}
	return $links;
}
// test detail
function ws_test_detail_job($url, $job, $company, $location, $description, $salary, $requirement, $benifit, $expired, $tag, $cookie) {
	global $jobModel;
	$data = curl_download_old ( $url, $cookie );
	if ($data != '') {
		// dismiss warning!
		libxml_use_internal_errors ( true );
		$doc = new DOMDocument ();
		$doc->loadHTML ( $data );
		$domXpath = new DOMXPath ( $doc );
		// lay data
		$djob = trim ( lay_du_lieu ( $domXpath, $job ) );
		// in case of xpath query error
		// if ($djob != '') {
		// get general data
		$dcompany = trim ( lay_du_lieu ( $domXpath, $company ) );
		$dlocation = trim ( lay_du_lieu ( $domXpath, $location ) );
		$ddes = trim ( lay_du_lieu ( $domXpath, $description ) );
		$dsalary = trim ( lay_du_lieu ( $domXpath, $salary ) );
		$drequirement = trim ( lay_du_lieu ( $domXpath, $requirement ) );
		$dbenifit = trim ( lay_du_lieu ( $domXpath, $benifit ) );
		$dexpired = trim ( lay_du_lieu ( $domXpath, $expired ) );
		if ($dexpired == '')
			$dexpired = date ( "m" ) + 1 . "-" . date ( "d" ) . "-" . date ( "Y" );
			// get tag
		$dtag = "";
		$tag_nodes = get_nodes_list ( $domXpath, $tag )->item ( 0 );
		// if ($tag_nodes->hasChildNodes ()) {
		// for($i = 0; $i < $tag_nodes->childNodes->length; $i ++) {
		// $tg = $tag_nodes->childNodes->item ( $i )->nodeValue;
		// if (trim ( $tg ) != "")
		// $dtag .= $tg . "|";
		// }
		// // remove last separator
		// substr ( $dtag, 0, - 1 );
		// }
		// }
		$i = 0;
		// count data null
		if ($djob == '')
			$i ++;
		if ($dcompany == '')
			$i ++;
		if ($dlocation == '')
			$i ++;
		if ($ddes == '')
			$i ++;
		if ($dsalary == '')
			$i ++;
		if ($dbenifit == '')
			$i ++;
		if (! $tag_nodes)
			$i ++;
		if ($drequirement == '')
			$i ++;
		if ($dexpired == '')
			$i ++;
		if ($i >= 7) {
			
			return 0;
		}
		// 3-6/9 data null=> fail xpath
		if ($i > 2 && $i < 7) {
			// case 3: 30% data null =>wrong detail page xpath
			
			return 1;
		}
		// return
	} else {
		return 0;
	}
}
function getUrl($detail_url) {
	$end_pos = strpos ( $detail_url, '/', 8 );
	return substr ( $detail_url, 0, $end_pos );
}

?>