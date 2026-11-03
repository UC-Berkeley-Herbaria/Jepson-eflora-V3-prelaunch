<?php

date_default_timezone_set('America/Los_Angeles');

?>
<!DOCTYPE html
  PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <title>Summary of Taxa: Jepson eFlora, Jepson Herbarium </title>
  <meta charset="UTF-8">
  <meta name="description"
    content="For vascular plants occurring in wildlands or otherwise outside of cultivation in California, the Jepson eFlora contains taxonomic treatments, distribution maps, illustrations, photographs, and identification keys.">
  <meta name="keywords"
    content="California Flora, Jepson eFlora, Flora of California, Vascular Plants of California, Jepson Flora Project, ">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link href="/eflora/common/css/dropdowns.css" rel="stylesheet" type="text/css" />
  <link href="/eflora/common/css/jepson_eflora.css" rel="stylesheet" type="text/css" />
  <link rel="shortcut icon" href="/eflora/common/images/JepsonLogoSmall.png" type="image/x-icon" />
  <!--jquery script files-->
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
  <script src="/eflora/common/js/dh_custom.js"></script>

  <style type="text/css" media="screen">
    #ckboxes {
      /* pushes checkbox a little from sidebar left edge */
      padding-left: 10px;
    }
  </style>

  <!-- Google tag (gtag.js) -->
  <script async src="https://www.googletagmanager.com/gtag/js?id=G-T5YC99QF6Q"></script>
  <script>
    window.dataLayer = window.dataLayer || [];
    function gtag() { dataLayer.push(arguments); }
    gtag('js', new Date());

    gtag('config', 'G-T5YC99QF6Q');
  </script>
  <style>
    @media screen and (max-width: 767px) {
      .bodyText1{
        margin-top: 20px;
      }
		.custom-eflora-table table tr:first-child {
			display: none;
		}

		.custom-eflora-table table tr {
			border-bottom: 3px solid #c7d4e1;
			display: block;
		}

		.summary__data--table.custom-eflora-table table td {
			border-bottom: 1px solid #c7d4e1;
			display: block;
			font-size: 12px;
			text-align: right;
			background-color: transparent;
			background: none;
			padding: 8px;
		}

		.custom-eflora-table table td::before {
			/*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
			content: attr(data-label);
			float: left;
			font-weight: bold;
      text-align: left;
		}

		.custom-eflora-table table td:last-child {
			border-bottom: 0;
		}
	}
  </style>

</head>

<body>

  <!-- Beginning of banner -->
  <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/header_jeps.php'); ?>
  <!-- End of banner -->

  <!-- Beginning of horizontal menu -->
  <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/globalnav.php'); ?>
  <!-- End of horizontal menu -->
  <table style="vertical-align: top;width:100%;">
    <tr>
      <td
        style="vertical-align: top;width:200px;border-right-style: solid;border-right-color: #9090AA;border-left-style: solid;border-left-color: #9090AA;">
        <div style="border-bottom-style: solid;">

          <!-- Start of sidebar menu-->
          <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/localnav_media.php'); ?>
          <!-- End of sidebar -->

        </div>
      </td>
      <td style="padding: 5px;vertical-align: top; width:100%;">
        <p class="bodyText1">

          <!--eFlora index-->

          <?php include($_SERVER['DOCUMENT_ROOT'].'/eflora/common/php/front_page_index_bar.php'); ?>

          <!--end eFlora index-->
          <br />
        <h1 align="center">
          Jepson eFlora: Summary of Taxa
        </h1>
        <p class="bodyText1">
        <table cellpadding=15 class="summary__data">
          <tr>
            <td>
              <table class="summary__data--inner">
                <tr>
                  <td class="summary__data--table custom-eflora-table">
                    <table cellspacing="0" class="bodyText">
                      <!--<tr bgcolor="#ffffff">
                        <th colspan="11">&nbsp;</th>
                      </tr>-->
                      <tr bgcolor="#9FBFFF">
                        <th>family</th>
                        <th bgcolor="#ffffff">major clade</th>
                        <th>genera with<br>native or naturalized<br>species</th>
                        <th bgcolor="#ffffff">genera without<br>native or<br>naturalized<br>species*</th>
                        <th>native<br>species</th>
                        <th bgcolor="#ffffff">naturalized<br>species</th>
                        <th>species<br>not native or<br>naturalized*</th>
                        <th bgcolor="#ffffff">native <br>minimum-rank<br>taxa</th>
                        <th>naturalized<br>minimum-rank<br>taxa</th>
                        <th bgcolor="#ffffff">minimum-rank<br>taxa not native<br> or naturalized*</th>
                        <th>endemic<br>minimum-rank<br>taxa
                      </tr>
                      <tr>
                        <td data-label="family">ACANTHACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">AGAVACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">9</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">19</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">24</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">5</td>
                      </tr>
                      <tr>
                        <td data-label="family">AIZOACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">11</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">11</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">11</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ALISMATACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">9</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">9</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">ALLIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">50</td>
                        <td data-label="naturalized species" align="center">6</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">62</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">6</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">34</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">AMARANTHACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">11</td>
                        <td data-label="naturalized species" align="center">8</td>
                        <td data-label="species not native or naturalized*" align="center">7</td>
                        <td data-label="native minimum-rank taxa" align="center">11</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">8</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">7</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">AMARYLLIDACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ANACARDIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">6</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">5</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">5</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">APIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">37</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">137</td>
                        <td data-label="naturalized species" align="center">14</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">154</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">14</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">58</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">APOCYNACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">9</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">23</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">25</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">4</td>
                      </tr>
                      <tr>
                        <td data-label="family">APODANTHACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">APONOGETONACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">AQUIFOLIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ARACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">8</td>
                        <td data-label="genera without native or naturalized species*" align="center">2</td>
                        <td data-label="native species" align="center">16</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">3</td>
                        <td data-label="native minimum-rank taxa" align="center">16</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">3</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ARALIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ARECACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ARISTOLOCHIACEAE</td>
                        <td data-label="major clade" align="center">MAGNOLIIDS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ASPARAGACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ASPHODELACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ASPLENIACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ASTERACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">236</td>
                        <td data-label="genera without native or naturalized species*" align="center">7</td>
                        <td data-label="native species" align="center">760</td>
                        <td data-label="naturalized species" align="center">152</td>
                        <td data-label="species not native or naturalized*" align="center">21</td>
                        <td data-label="native minimum-rank taxa" align="center">961</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">157</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">22</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">341</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ATHYRIACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">AZOLLACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">BALSAMINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">BASELLACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">0</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">BATACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">BERBERIDACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">13</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">16</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">3</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">BETULACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">7</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">8</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">BIGNONIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">2</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">BLECHNACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">BORAGINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">26</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">163</td>
                        <td data-label="naturalized species" align="center">13</td>
                        <td data-label="species not native or naturalized*" align="center">4</td>
                        <td data-label="native minimum-rank taxa" align="center">191</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">13</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">4</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">61</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">BRASSICACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">65</td>
                        <td data-label="genera without native or naturalized species*" align="center">4</td>
                        <td data-label="native species" align="center">235</td>
                        <td data-label="naturalized species" align="center">66</td>
                        <td data-label="species not native or naturalized*" align="center">7</td>
                        <td data-label="native minimum-rank taxa" align="center">272</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">66</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">7</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">103</td>
                      </tr>
                      <tr>
                        <td data-label="family">BURSERACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CABOMBACEAE</td>
                        <td data-label="major clade" align="center">NYMPHAEALES</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">CACTACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">11</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">41</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">44</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">8</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CALYCANTHACEAE</td>
                        <td data-label="major clade" align="center">MAGNOLIIDS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">CAMPANULACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">11</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">54</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">67</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">33</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CANNABACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">CAPRIFOLIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">11</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">14</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CARYOPHYLLACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">31</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">75</td>
                        <td data-label="naturalized species" align="center">43</td>
                        <td data-label="species not native or naturalized*" align="center">5</td>
                        <td data-label="native minimum-rank taxa" align="center">88</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">44</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">5</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">21</td>
                      </tr>
                      <tr>
                        <td data-label="family">CELASTRACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">3</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CERATOPHYLLACEAE</td>
                        <td data-label="major clade" align="center">CERATOPHYLLALES</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">CHENOPODIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">21</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">71</td>
                        <td data-label="naturalized species" align="center">37</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">84</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">38</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">19</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CISTACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">5</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">5</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr>
                        <td data-label="family">CLEOMACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">15</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">17</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">COMANDRACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">COMMELINACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CONVOLVULACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">32</td>
                        <td data-label="naturalized species" align="center">5</td>
                        <td data-label="species not native or naturalized*" align="center">9</td>
                        <td data-label="native minimum-rank taxa" align="center">48</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">5</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">9</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">24</td>
                      </tr>
                      <tr>
                        <td data-label="family">CORNACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CRASSULACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">7</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">53</td>
                        <td data-label="naturalized species" align="center">8</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">73</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">8</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">46</td>
                      </tr>
                      <tr>
                        <td data-label="family">CROSSOSOMATACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CUCURBITACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">9</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">9</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">3</td>
                      </tr>
                      <tr>
                        <td data-label="family">CUPRESSACEAE</td>
                        <td data-label="major clade" align="center">GYMNOSPERMS</td>
                        <td data-label="native or naturalized species" align="center">8</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">21</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">24</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">6</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CYATHEACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">CYPERACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">20</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">204</td>
                        <td data-label="naturalized species" align="center">22</td>
                        <td data-label="species not native or naturalized*" align="center">3</td>
                        <td data-label="native minimum-rank taxa" align="center">214</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">22</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">3</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">19</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">CYSTOPTERIDACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">DATISCACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">DENNSTAEDTIACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">DIPSACACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">DROSERACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">DRYOPTERIDACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">11</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">12</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">EBENACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">EHRETIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ELAEAGNACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ELATINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">EPHEDRACEAE</td>
                        <td data-label="major clade" align="center">GYMNOSPERMS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">EQUISETACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ERICACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">26</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">105</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">143</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">83</td>
                      </tr>
                      <tr>
                        <td data-label="family">EUPHORBIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">10</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">39</td>
                        <td data-label="naturalized species" align="center">14</td>
                        <td data-label="species not native or naturalized*" align="center">5</td>
                        <td data-label="native minimum-rank taxa" align="center">43</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">14</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">5</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">7</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">FABACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">52</td>
                        <td data-label="genera without native or naturalized species*" align="center">5</td>
                        <td data-label="native species" align="center">308</td>
                        <td data-label="naturalized species" align="center">89</td>
                        <td data-label="species not native or naturalized*" align="center">25</td>
                        <td data-label="native minimum-rank taxa" align="center">432</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">92</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">25</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">176</td>
                      </tr>
                      <tr>
                        <td data-label="family">FAGACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">27</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">36</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">13</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">FOUQUIERIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">FRANKENIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">GARRYACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">GENTIANACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">10</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">30</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">33</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">4</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">GERANIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">8</td>
                        <td data-label="naturalized species" align="center">21</td>
                        <td data-label="species not native or naturalized*" align="center">8</td>
                        <td data-label="native minimum-rank taxa" align="center">8</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">21</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">8</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">GROSSULARIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">31</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">41</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">14</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">GUNNERACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">HALORAGACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">HELIOTROPIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">HYDRANGEACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">HYDROCHARITACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">HYDROPHYLLACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">11</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">122</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">143</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">56</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">HYPERICACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">3</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">3</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">IRIDACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">7</td>
                        <td data-label="genera without native or naturalized species*" align="center">4</td>
                        <td data-label="native species" align="center">23</td>
                        <td data-label="naturalized species" align="center">7</td>
                        <td data-label="species not native or naturalized*" align="center">6</td>
                        <td data-label="native minimum-rank taxa" align="center">28</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">7</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">6</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">13</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ISOETACEAE</td>
                        <td data-label="major clade" align="center">LYCOPHYTES</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">JUGLANDACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">JUNCACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">65</td>
                        <td data-label="naturalized species" align="center">12</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">74</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">14</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">9</td>
                      </tr>
                      <tr>
                        <td data-label="family">JUNCAGINACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">KOEBERLINIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">KRAMERIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">LAMIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">25</td>
                        <td data-label="genera without native or naturalized species*" align="center">2</td>
                        <td data-label="native species" align="center">111</td>
                        <td data-label="naturalized species" align="center">22</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">136</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">22</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">72</td>
                      </tr>
                      <tr>
                        <td data-label="family">LAURACEAE</td>
                        <td data-label="major clade" align="center">MAGNOLIIDS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">2</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">LAXMANNIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">LENNOACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">LENTIBULARIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">LILIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">9</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">98</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">113</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">66</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">LIMNANTHACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">7</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">15</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">10</td>
                      </tr>
                      <tr>
                        <td data-label="family">LINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">15</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">15</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">11</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">LINDERNIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">LINNAEACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">LOASACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">36</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">38</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">12</td>
                      </tr>
                      <tr>
                        <td data-label="family">LYCOPODIACEAE</td>
                        <td data-label="major clade" align="center">LYCOPHYTES</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">LYTHRACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">6</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">6</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">MALVACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">18</td>
                        <td data-label="genera without native or naturalized species*" align="center">4</td>
                        <td data-label="native species" align="center">70</td>
                        <td data-label="naturalized species" align="center">14</td>
                        <td data-label="species not native or naturalized*" align="center">8</td>
                        <td data-label="native minimum-rank taxa" align="center">98</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">14</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">8</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">58</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">MARSILEACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">3</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">3</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">MARTYNIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">MELANTHIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">6</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">18</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">19</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">6</td>
                      </tr>
                      <tr>
                        <td data-label="family">MELIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">MENYANTHACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">MOLLUGINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">MONTIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">6</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">51</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">64</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">18</td>
                      </tr>
                      <tr>
                        <td data-label="family">MORACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">MYRICACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">MYRSINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">MYRTACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">4</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">12</td>
                        <td data-label="species not native or naturalized*" align="center">5</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">12</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">5</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">NAMACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">21</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">27</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">11</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">NARTHECIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">NITRARIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">NYCTAGINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">7</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">25</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">32</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">4</td>
                      </tr>
                      <tr>
                        <td data-label="family">NYMPHAEACEAE</td>
                        <td data-label="major clade" align="center">NYMPHAEALES</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">OLEACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">8</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">10</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr>
                        <td data-label="family">ONAGRACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">16</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">136</td>
                        <td data-label="naturalized species" align="center">11</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">188</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">12</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">82</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">OPHIOGLOSSACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">16</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">17</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ORCHIDACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">11</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">36</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">38</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">6</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">OROBANCHACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">12</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">92</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">134</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">64</td>
                      </tr>
                      <tr>
                        <td data-label="family">OXALIDACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">5</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">5</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PAEONIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">PAPAVERACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">14</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">36</td>
                        <td data-label="naturalized species" align="center">5</td>
                        <td data-label="species not native or naturalized*" align="center">3</td>
                        <td data-label="native minimum-rank taxa" align="center">39</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">5</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">3</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">18</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PARNASSIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">PASSIFLORACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PHRYMACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">104</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">105</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">52</td>
                      </tr>
                      <tr>
                        <td data-label="family">PHYTOLACCACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PICRODENDRACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">3</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">3</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">PINACEAE</td>
                        <td data-label="major clade" align="center">GYMNOSPERMS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">32</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">40</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">8</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PITTOSPORACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">PLANTAGINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">24</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">128</td>
                        <td data-label="naturalized species" align="center">25</td>
                        <td data-label="species not native or naturalized*" align="center">5</td>
                        <td data-label="native minimum-rank taxa" align="center">164</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">25</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">5</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">58</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PLATANACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">PLUMBAGINACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">5</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">5</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">POACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">100</td>
                        <td data-label="genera without native or naturalized species*" align="center">3</td>
                        <td data-label="native species" align="center">266</td>
                        <td data-label="naturalized species" align="center">182</td>
                        <td data-label="species not native or naturalized*" align="center">12</td>
                        <td data-label="native minimum-rank taxa" align="center">300</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">185</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">13</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">45</td>
                      </tr>
                      <tr>
                        <td data-label="family">POLEMONIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">17</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">193</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">263</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">129</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">POLYGALACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">6</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">7</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">POLYGONACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">27</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">215</td>
                        <td data-label="naturalized species" align="center">22</td>
                        <td data-label="species not native or naturalized*" align="center">5</td>
                        <td data-label="native minimum-rank taxa" align="center">327</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">25</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">8</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">157</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">POLYPODIACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">PONTEDERIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PORTULACACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">POTAMOGETONACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">18</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">19</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PRIMULACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">13</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">16</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">4</td>
                      </tr>
                      <tr>
                        <td data-label="family">PROTEACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">PTERIDACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">10</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">35</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">36</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">5</td>
                      </tr>
                      <tr>
                        <td data-label="family">RANUNCULACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">15</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">81</td>
                        <td data-label="naturalized species" align="center">10</td>
                        <td data-label="species not native or naturalized*" align="center">3</td>
                        <td data-label="native minimum-rank taxa" align="center">116</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">10</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">3</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">38</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">RESEDACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">RHAMNACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">7</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">61</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">87</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">50</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ROSACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">45</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">149</td>
                        <td data-label="naturalized species" align="center">31</td>
                        <td data-label="species not native or naturalized*" align="center">5</td>
                        <td data-label="native minimum-rank taxa" align="center">196</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">32</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">5</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">64</td>
                      </tr>
                      <tr>
                        <td data-label="family">RUBIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">2</td>
                        <td data-label="native species" align="center">41</td>
                        <td data-label="naturalized species" align="center">7</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">70</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">7</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">44</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">RUPPIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">RUSCACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">7</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">7</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">RUTACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">3</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">3</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">SALICACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">31</td>
                        <td data-label="naturalized species" align="center">5</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">33</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">5</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">SALVINIACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">SAPINDACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">SARCOBATACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">SARRACENIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">SAURURACEAE</td>
                        <td data-label="major clade" align="center">MAGNOLIIDS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">SAXIFRAGACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">19</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">58</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">60</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">18</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">SCHEUCHZERIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">SCROPHULARIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">8</td>
                        <td data-label="naturalized species" align="center">10</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">8</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">10</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">SELAGINELLACEAE</td>
                        <td data-label="major clade" align="center">LYCOPHYTES</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">10</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">10</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">SIMAROUBACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">SIMMONDSIACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">SMILACACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">SOLANACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">11</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">29</td>
                        <td data-label="naturalized species" align="center">24</td>
                        <td data-label="species not native or naturalized*" align="center">7</td>
                        <td data-label="native minimum-rank taxa" align="center">31</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">25</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">7</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2</td>
                      </tr>
                      <tr>
                        <td data-label="family">STAPHYLEACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">STYRACACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">TAMARICACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">5</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">5</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">TAXACEAE</td>
                        <td data-label="major clade" align="center">GYMNOSPERMS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">TECOPHILAEACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">THELYPTERIDACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">THEMIDACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">7</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">45</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">55</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">31</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">THEOPHRASTACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">THYMELAEACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">TOFIELDIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">TROPAEOLACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">TYPHACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">7</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">8</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ULMACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">URTICACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">4</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">6</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">4</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">VALERIANACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">4</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">7</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">9</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">VERBENACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">10</td>
                        <td data-label="naturalized species" align="center">3</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">11</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">3</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">1</td>
                      </tr>
                      <tr>
                        <td data-label="family">VIBURNACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">3</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">VIOLACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">22</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">32</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">4</td>
                      </tr>
                      <tr>
                        <td data-label="family">VISCACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">3</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">7</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">8</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">VITACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">2</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">2</td>
                        <td data-label="native minimum-rank taxa" align="center">2</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">2</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">WOODSIACEAE</td>
                        <td data-label="major clade" align="center">FERNS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">3</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">3</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ZANNICHELLIACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">1</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">1</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">1</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ZINGIBERACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">0</td>
                        <td data-label="genera without native or naturalized species*" align="center">1</td>
                        <td data-label="native species" align="center">0</td>
                        <td data-label="naturalized species" align="center">0</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">0</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">0</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr bgcolor='FFFFFF'>
                        <td data-label="family">ZOSTERACEAE</td>
                        <td data-label="major clade" align="center">MONOCOTS</td>
                        <td data-label="native or naturalized species" align="center">2</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">4</td>
                        <td data-label="naturalized species" align="center">1</td>
                        <td data-label="species not native or naturalized*" align="center">0</td>
                        <td data-label="native minimum-rank taxa" align="center">4</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">0</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family">ZYGOPHYLLACEAE</td>
                        <td data-label="major clade" align="center">EUDICOTS</td>
                        <td data-label="native or naturalized species" align="center">5</td>
                        <td data-label="genera without native or naturalized species*" align="center">0</td>
                        <td data-label="native species" align="center">5</td>
                        <td data-label="naturalized species" align="center">2</td>
                        <td data-label="species not native or naturalized*" align="center">1</td>
                        <td data-label="native minimum-rank taxa" align="center">5</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">2</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">1</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">0</td>
                      </tr>
                      <tr>
                        <td data-label="family"></td>
                        <td data-label="major clade" align="center"></td>
                        <td data-label="native or naturalized species" align="center">1334</td>
                        <td data-label="genera without native or naturalized species*" align="center">58</td>
                        <td data-label="native species" align="center">5394</td>
                        <td data-label="naturalized species" align="center">1102</td>
                        <td data-label="species not native or naturalized*" align="center">226</td>
                        <td data-label="native minimum-rank taxa" align="center">6672</td>
                        <td data-label="naturalized minimum-rank taxa" align="center">1123</td>
                        <td data-label="minimum-rank taxa not native or naturalized*" align="center">231</td>
                        <td data-label="endemic minimum-rank taxaalign" align="center">2348</td>
                      </tr>
                    </table>
                  </td>
                </tr>
              </table>
              *Generally waifs, agricultural weeds, and eradicated exotics; names are enclosed in square brackets in
              keys; descriptions appear only online.
              <br>
              Minimum-rank taxa uncertain as to nativity: Typha angustifolia (TYPHACEAE), Xanthium spinosum
              (ASTERACEAE), Trichocoronis wrightii var. wrightii (ASTERACEAE) <br>
              <table class="bodyText">
                <tr>
                  <th>Families:</th>
                  <td>197</td>
                </tr>
                <tr>
                  <th>Genera:</th>
                  <td>1392</td>
                </tr>
                <tr>
                  <th>Species:</th>
                  <td>5394 (1102) [226]</td>
                </tr>
                <tr>
                  <th>Minimum-rank taxa:</th>
                  <td>6672 (1123) [231]</td>
                </tr>
              </table>
              <p>
                <b>NOTE</b>: The counts for native and naturalized species are higher here than in the print manual
                because of species for which there are multiple infraspecific taxa, but only one has a California
                range.
                In these cases, <em>The Jepson Manual</em>/Jepson eFlora only has a treatment at the infra level and
                not
                at the species level (For example, see <a
                  href="https://ucjeps.berkeley.edu/eflora/eflora_display.php?tid=54615"><em>Astragalus
                    allochrousa</em>
                  var. <em>playanus</em></a>). These cases were not counted in the species totals in the print manual
                but are included here.
              </p>

            </td>
          </tr>
        </table>


        <!-- Begin footer -->
        <?php include($_SERVER['DOCUMENT_ROOT'].'/common/php/footer.php'); ?>
        <!-- End footer -->


</body>

</html>