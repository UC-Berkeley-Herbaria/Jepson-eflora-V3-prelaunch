


<?php
// 1. Database Connection
//connect to the database
require '../../../herbariadb_data/eflora/config/config_eflora_mysql.php';
$db = mysqli_connect($db_host, $db_user, $db_pw, $db_name);


// 2. Fetch all counts into a "Look-up Table"
$jfp_counts = [];
$sql = "SELECT JFP, COUNT(*) as TotalCount FROM icpn WHERE JFP IS NOT NULL GROUP BY JFP";
$result = mysqli_query($db, $sql);

		if(!mysqli_query($db, $sql)){
			die('Error: ' . mysqli_error($db));
		}


if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        // Store the count using the JFP code as the key
        $jfp_counts[$row['JFP']] = $row['TotalCount'];
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>ICPN JFP Status Categories</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Browse the Index to California Plant Names (ICPN) alphabetically by scientific name.">
    
    <!-- Standardized CSS Links -->
    <link href="/eflora/common/css/eflora-header.css" rel="stylesheet" type="text/css">
    <link href="/eflora/common/css/jepson-main.css" rel="stylesheet" type="text/css">
    <link href="common/css/icpn.css" rel="stylesheet" type="text/css" />

    <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />

    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-JCLW1NZYB5"></script>
    <script>
      window.dataLayer = window.dataLayer || [];
      function gtag(){dataLayer.push(arguments);}
      gtag('js', new Date());
      gtag('config', 'G-JCLW1NZYB5');
    </script>
</head>

<body>

<!-- Standardized Header -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-header.php'); ?>  

<main class="eflora-main">
    <header class="page-title-section">
        <h1>Index to California Plant Names (ICPN): List of Counts for Each JFP Status Categories</h1>
    </header>

    <!-- return home link -->
<div class="center-text" style="margin-top: 30px;">
    <a href="/eflora/icpn/" style="font-weight: bold;">&larr; Return to the <i>ICPN</i> Search Page</a>
</div>

<div class="center-text" style="margin-top: 30px;">

	<h2>Names Arranged Alphabetically under Current Status Categories</h2>
	<h3>(numbers in parentheses indicate number of names in each category)</h3>
</div>

    <!-- Results Section -->
    <section class="results-container">
<?php
// Helper function to get count or return 0 if JFP not in database
function getJFPCount($code, $count_array) {
    return isset($count_array[$code]) ? $count_array[$code] : 0;
}
?>

<ul>
    <!-- Line 1: 1 -->
    <?php 
      $code = "1"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 2: 1a -->
    <?php 
      $code = "1a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 3: 1b -->
    <?php 
      $code = "1b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 4: 1c -->
    <?php 
      $code = "1c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 5: 1d -->
    <?php 
      $code = "1d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 6: 1e -->
    <?php 
      $code = "1e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 7: 1f -->
    <?php 
      $code = "1f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 8: 1g -->
    <?php 
      $code = "1g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon native to CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 9: 2 -->
    <?php 
      $code = "2"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 10: 2a -->
    <?php 
      $code = "2a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 11: 2b -->
    <?php 
      $code = "2b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 12: 2c -->
    <?php 
      $code = "2c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 13: 2d -->
    <?php 
      $code = "2d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 14: 2e -->
    <?php 
      $code = "2e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 15: 2f -->
    <?php 
      $code = "2f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 16: 2g -->
    <?php 
      $code = "2g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon naturalized in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 17: 3 -->
    <?php 
      $code = "3"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 18: 3a -->
    <?php 
      $code = "3a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 19: 3b (Example of something that might be zero) -->
    <?php 
      $code = "3b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 20: 3c -->
    <?php 
      $code = "3c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 21: 3d -->
    <?php 
      $code = "3d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 22: 3e -->
    <?php 
      $code = "3e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 23: 3f -->
    <?php 
      $code = "3f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 24: 3g -->
    <?php 
      $code = "3g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon occurring in CA only as a waif and/or garden escape, not naturalized</a> (<?php echo $count; ?>)</li>

    <!-- Line 25: 4 -->
    <?php 
      $code = "4"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon occurring in CA only as agricultural or garden weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 26: 4a -->
    <?php 
      $code = "4a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon occurring in CA only as agricultural or garden weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 27: 4b (Example of something that might be zero) -->
    <?php 
      $code = "4b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as agricultural or garden weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 28: 4c -->
    <?php 
      $code = "4c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon occurring in CA only as an agricultural, garden, or urban weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 29: 4d -->
    <?php 
      $code = "4d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon occurring in CA only as an agricultural, garden, or urban weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 30: 4e -->
    <?php 
      $code = "4e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as an agricultural, garden, or urban weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 31: 4f -->
    <?php 
      $code = "4f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxon occurring in CA only as an agricultural, garden, or urban weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 32: 4g -->
    <?php 
      $code = "4g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon occurring in CA only as an agricultural, garden, or urban weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 33: 5 -->
    <?php 
      $code = "5"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 34: 5a -->
    <?php 
      $code = "5a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 35: 5b (Example of something that might be zero) -->
    <?php 
      $code = "5b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 36: 5c -->
    <?php 
      $code = "5c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 37: 5d -->
    <?php 
      $code = "5d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 38: 5e -->
    <?php 
      $code = "5e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 39: 5f -->
    <?php 
      $code = "5f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 40: 5g -->
    <?php 
      $code = "5g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon occurring in CA only as greenhouse weed</a> (<?php echo $count; ?>)</li>

    <!-- Line 41: 6 -->
    <?php 
      $code = "6"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 42: 6a -->
    <?php 
      $code = "6a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 43: 6b (Example of something that might be zero) -->
    <?php 
      $code = "6b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 44: 6c -->
    <?php 
      $code = "6c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 45: 6d -->
    <?php 
      $code = "6d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 46: 6e -->
    <?php 
      $code = "6e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 47: 6f -->
    <?php 
      $code = "6f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 48: 6g -->
    <?php 
      $code = "6g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon extirpated in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 49: 7 -->
    <?php 
      $code = "7"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 50: 7a -->
    <?php 
      $code = "7a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 51: 7b (Example of something that might be zero) -->
    <?php 
      $code = "7b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 52: 7c -->
    <?php 
      $code = "7c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon presumed extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 53: 7d -->
    <?php 
      $code = "7d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon presumed extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 54: 7e -->
    <?php 
      $code = "7e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon presumed extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 55: 7f -->
    <?php 
      $code = "7f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon presumed extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 56: 7g -->
    <?php 
      $code = "7g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 57: 8 -->
    <?php 
      $code = "8"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)</a> (<?php echo $count; ?>)</li>

    <!-- Line 58: 8a -->
    <?php 
      $code = "8a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)</a> (<?php echo $count; ?>)</li>

    <!-- Line 59: 8b -->
    <?php 
      $code = "8b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)</a> (<?php echo $count; ?>)</li>

    <!-- Line 60: 8c -->
    <?php 
      $code = "8c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)</a> (<?php echo $count; ?>)</li>

    <!-- Line 61: 8d -->
    <?php 
      $code = "8d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)</a> (<?php echo $count; ?>)</li>

    <!-- Line 62: 8e -->
    <?php 
      $code = "8e"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- unpublished, invalidly published, illegitimate, or rejected name for taxon presumed extinct in CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 63: 8f -->
    <?php 
      $code = "8f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)</a> (<?php echo $count; ?>)</li>

    <!-- Line 64: 8g -->
    <?php 
      $code = "8g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon not occurring in CA (erroneous reports, misapplication of names, misidentifications, other exclusions)</a> (<?php echo $count; ?>)</li>

    <!-- Line 65: 9 -->
    <?php 
      $code = "9"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)</a> (<?php echo $count; ?>)</li>

    <!-- Line 67: 9a -->
    <?php 
      $code = "9a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)</a> (<?php echo $count; ?>)</li>

    <!-- Line 68: 9b -->
    <?php 
      $code = "9b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)</a> (<?php echo $count; ?>)</li>

    <!-- Line 69: 9c -->
    <?php 
      $code = "9c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- accepted name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)</a> (<?php echo $count; ?>)</li>

    <!-- Line 70: 9d -->
    <?php 
      $code = "9d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, PENDING -- taxonomic or nomenclatural synonym for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)</a> (<?php echo $count; ?>)</li>

    <!-- Line 71: 9f -->
    <?php 
      $code = "9f"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)</a> (<?php echo $count; ?>)</li>

    <!-- Line 72: 9g -->
    <?php 
      $code = "9g"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- taxonomic or nomenclatural synonym for taxon for plant occurring in CA only under cultivation (e.g., as crop, ornamental, or experimental plant)</a> (<?php echo $count; ?>)</li>

    <!-- Line 73: 10 -->
    <?php 
      $code = "10"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxonomically recognized and/or fertile hybrid; hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 74: 10a -->
    <?php 
      $code = "10a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxonomically recognized and/or fertile hybrid; non-hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 75: 10b -->
    <?php 
      $code = "10b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 76: 10bb -->
    <?php 
      $code = "10bb"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxonomically recognized and/or fertile hybrid; hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 77: 10c -->
    <?php 
      $code = "10c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxonomically recognized and/or fertile hybrid; non-hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 78: 10d -->
    <?php 
      $code = "10d"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, TENTATIVE -- accepted name for taxonomically recognized and/or fertile hybrid; non-hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 73: 11 -->
    <?php 
      $code = "11"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxonomically not recognized and/or sterile hybrid; hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 74: 11a -->
    <?php 
      $code = "11a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, accepted name for taxonomically not recognized and/or sterile hybrid; non-hybrid form of name</a> (<?php echo $count; ?>)</li>

    <!-- Line 75: 11b -->
    <?php 
      $code = "11b"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxonomically not recognized and/or sterile hybrid (hybrid form of name)</a> (<?php echo $count; ?>)</li>

    <!-- Line 76: 11bb -->
    <?php 
      $code = "11bb"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxonomically not recognized and/or sterile hybrid (hybrid form of name)</a> (<?php echo $count; ?>)</li>

    <!-- Line 77: 11c -->
    <?php 
      $code = "11c"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, taxonomic or nomenclatural synonym for taxonomically not recognized and/or sterile hybrid (non-hybrid form of name)</a> (<?php echo $count; ?>)</li>

    <!-- Line 78: 14 -->
    <?php 
      $code = "14"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, orthographic variant of name treated elsewhere in this list</a> (<?php echo $count; ?>)</li>

    <!-- Line 79: 15 -->
    <?php 
      $code = "15"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, genus name</a> (<?php echo $count; ?>)</li>

    <!-- Line 80: 16 -->
    <?php 
      $code = "16"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, family name</a> (<?php echo $count; ?>)</li>

    <!-- Line 81: 17 -->
    <?php 
      $code = "17"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, unpublished, invalidly published, illegitimate, or rejected name for taxon of unknown or uncertain status with respect to the flora of CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 82: 18 -->
    <?php 
      $code = "18"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, validly published name for unplaced taxon of unknown synonymy or uncertain status with respect to the flora of CA</a> (<?php echo $count; ?>)</li>

    <!-- Line 83: 18a -->
    <?php 
      $code = "18a"; 
      $count = getJFPCount($code, $jfp_counts); 
    ?>
    <li><a href="/eflora/icpn/status_index.php?jfp=<?php echo urlencode($code); ?>">
        JFP-<?php echo $code; ?>, validly published synonym for taxon of unknown or uncertain status with respect to the flora of CA</a> (<?php echo $count; ?>)</li>

</ul>
	</section>

<!-- Search Section -->
        <div class="search-group" style="background: #f0f7ff; border: 1px solid var(--border-gray);">
            
			<div class="search-tip-box" role="note" aria-label="Search hint">
				<p>
				<strong class="tip-label">Note:</strong> 
				Partial name search ability (e.g., <em class="example-text">"Seq gig"</em>) is active. 
				Use the full family name (e.g., <em class="example-text">"Agavaceae"</em>) to search by family.
				</p>
			</div>
            <form action="/eflora/search_icpn.php" method="get" class="centered-form">
                <label for="icpn" class="search-label">Enter Scientific Name:</label>
                <div class="input-row">
                    <input type="text" id="icpn" name="icpn" placeholder="e.g., Quercus agrifolia" required>
                    <div class="button-group">
                        <button type="submit" class="btn btn-submit">Search ICPN</button>
                        <button type="reset" class="btn btn-reset">Clear</button>
                    </div>
                </div>
            </form>
        </div>
	

    <!-- Centered Feedback CTA -->
    <section class="feedback-area">
        <a class="googleForm" href="https://docs.google.com/forms/d/e/1FAIpQLSc_wrQXqB9gNPrOgUTZ9WN38Ub08JlmgaIha7Ua99sHGzMntA/viewform">
            Send us your feedback! Community input helps improve the Jepson eFlora.
        </a>
    </section>
</main>

<!-- Standardized Footer -->
<?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/eflora-footer.php'); ?>

</body>
</html>

