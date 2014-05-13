<?php
function modus_css_gradient($gradient) {
	if (!empty($gradient))
	{
		$std = implode(',',$gradient);
		$gs=trim($gradient[0],'#'); $ge=trim($gradient[1],'#');
		return "filter: progid:DXImageTransform.Microsoft.gradient(startColorStr=#FF$gs,endColorStr=#FF$ge); /* IE to 9*/
	background-image: -moz-linear-gradient(top,$std); /* FF 3.16 to 15 */
	background-image: -webkit-linear-gradient(top,$std); /* Chrome, Safari */
	background-image: -ms-linear-gradient(top,$std); /* IE ? to 9 */
	background-image: -o-linear-gradient(top,$std); /* Opera 11 to 12 */
	background-image: linear-gradient(to bottom,$std); /* Standard must be last */";
	}
}

function modus_get_default_config()
{
  return array(
	'skin' => 'dark',
	'album_thumb_size' => 250,
  'index_photo_deriv'=>'2small',
  'index_photo_deriv_hdpi'=>'xsmall',
);
}
?>