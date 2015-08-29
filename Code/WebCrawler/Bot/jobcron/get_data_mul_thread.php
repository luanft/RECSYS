<?php
$root = 'E:/RECSYS/trunk/Code/WebCrawler/Bot';

require_once $root . '/jobcron/scraping.php';
$max_thread = 2;
ws_init_system ();
class MultithreadDownload extends Thread {	
	public function __construct(array $data) {
		$this->arg = $data;
	}
	public function run() {
		
		// truong hop lo cong viec lon hon khong
		$max = count ( $this->arg );
		if (count ( $this->arg ) > 0) {
			for($x = 0; $x < $max; $x ++) {
				$row = $this->arg [$x];
				for($i = 0; $i < 60; $i ++) {
								
					// get all job urls in page
					$ret = ws_get_job_url ( $row ['home_url'] . "$i", $row ['base_url'], $row ['xpath_code'] );
					// get usage data & save
					
					foreach ( $ret as $url ) {
						$cookie = "";
						if ($row ['login_url'] != '') {
							$cookie = "cookie" . $row ['id'] . ".txt";
						}
						ws_get_detail_job ( $url, $row ['job_xpath'], $row ['company_xpath'], $row ['location_xpath'], $row ['description_xpath'], $row ['salary_xpath'], $row ['requirement_xpath'], $row ['benifit_xpath'], $row ['expired_xpath'], $row ['tags_xpath'], $cookie, $row ['category'] );
					}
				}
			}
		}
	}
}

ws_login_to_webserver ( $xpathData );
ws_init_system ();
$total = mysqli_num_rows ( $xpathData );
$job_per_thread = ( int ) ($total / $max_thread);
$i = 0;
$c = 0;
$batch = array ();
while ( $i < $total ) {
	if ($c < $job_per_thread) {
		$r = mysqli_fetch_assoc ( $xpathData );
		$batch [] = $r;
		$i ++;
		$c ++;
	} else {
		$t = new MultithreadDownload ($batch);
		$t->start();
		$batch = array ();
		$c = 0;
	}
}

?>
