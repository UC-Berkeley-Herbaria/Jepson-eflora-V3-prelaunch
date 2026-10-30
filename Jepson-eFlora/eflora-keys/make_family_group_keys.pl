#<a name="Group1"></a><blockquote><h3><a name=Group1>Group 1</a>: Herbs; bulblets dispersed in place of seeds or frs; available specimens without fls</h3></blockquote>
open(OUT, ">output/IJM_fam_key.html") || die;

open(IN, "all_family_key.html") || die;
while(<IN>){
s!<a href="#Group(\d+)">!<a href="/IJM_keys/IJM_key_Group${1}.html">!g;
	if(m/<a name="Group(\d+)/){
		$gp=$1;
print OUT <<EOP;
</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
</tr></table>
<br />
<!-- Begin footer -->
<?php include('../common/php/eflora_footer.php'); ?>
<!-- End footer -->

</body>
</html>
EOP
		open(OUT, ">output/IJM_key_Group${gp}.html") || die;
#<P class="keyText" style="padding-left : 7 ;"><a href="#12'">2.</a><a name="12."> </a> Bulblets [small bulbs or corms that are dispersed in place of seeds or fruits] formed in place of flowers in inflorescence or inflorescence-like cluster <a href="#Group1">.....&nbsp;Group 1</a>

		print OUT<<EOP;
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>Jepson Herbarium: Jepson Flora Project: Jepson eFlora: Key to Group$gp</title> 
<link href="/common/styles/dropdowns.css" rel="stylesheet" type="text/css" />

<style type="text/css">

.large-image {
	box-shadow: 1px 1px 3px 3px rgba(127, 127, 127, 0.15);
	width: 140px;
	padding-left: 0px;
	padding-right: 0px;
}


.inline {
	display: inline-block;
	padding: 0px;
}


.dropdown {
	display: inline;
	position: relative;
	padding: 0px;
}

.dropdown-content {
	display: none;
  position: absolute;
	text-align: center;
  background-color: #FFFFFF;
	padding-left: 9px;
	padding-right: 0px;
  width: 140px;
  box-shadow: 1px 1px 3px 3px rgba(127, 127, 127, 0.15);
  z-index: 100;
}

.dropdown-content a {
  color: black;
  padding: 0px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: black;}

.dropdown:hover .dropdown-content {display: inline;}

.dropdown:hover .dropbtn {background-color: black;}

</style>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-43909100-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


</head>
<body>
<!-- Begin banner -->
<?php include('../common/php/header_jeps.php'); ?>  
<!-- End banner -->

<!-- Beginning of horizontal menu -->
<?php include('../common/php/globalnav.php'); ?> 
<!-- End of horizontal menu -->
 <table border="0">
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
     </tr>
   <tr>
       <td>&nbsp;</td>
       <td>&nbsp;</td>
       <td width="100%"><span class="pageName"><a href="/eflora/">Jepson eFlora</a></span><br /><br />
<br />
<script>
window.onload = setInterval(clock,1000);
function clock(){
	var d = new Date();
	var yr = d.getFullYear();
	var month = d.getMonth();
	var monthArr = ["January", "February","March", "April", "May", "June", "July", "August", "September", "October", "November","December"];
	month = monthArr[month];
	var date = d.getDate();
  document.getElementById("year").innerHTML = yr;
  document.getElementById("month").innerHTML = month+" "+yr;
  document.getElementById("day").innerHTML = date;
}
</script>
<br />
<p class="bodyText">Citation for the whole project: Jepson Flora Project (eds.) <span id="year"></span>. Jepson eFlora, https://ucjeps.berkeley.edu/eflora/ [accessed on <span id="day"></span> <span id="month"></span>]</p> 
<br />
<br />
<a href="/IJM_keys/IJM_fam_key.html">Key to groups</a>
       <br />

<h3>Family key to Group $gp</h3>
</br></br>
EOP
}
print OUT;
}
