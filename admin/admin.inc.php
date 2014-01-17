<?php
if (!defined('PHPWG_ROOT_PATH')) die('Hacking attempt!');

global $template;

include_once( dirname(dirname(__FILE__)).'/functions.inc.php');
$default_conf = modus_get_default_config();

$my_conf = @$conf['modus_theme'];
if (!isset($my_conf))
  $my_conf = $default_conf;
elseif (!is_array($my_conf))
{
  $my_conf = unserialize($my_conf);
	$my_conf = array_merge($default_conf, $my_conf);
}

$text_values = array('skin', 'album_thumb_size', 'index_photo_deriv','index_photo_deriv_hdpi');
$bool_values = array();

// *************** POST management ********************
if (isset($_POST[$text_values[0]]))
{
	foreach ($text_values as $k )
		$my_conf[$k] = stripslashes($_POST[$k]);
	foreach ($bool_values as $k )
		$my_conf[$k] = isset($_POST[$k]) ? true:false;
	// int/double
	$my_conf['album_thumb_size'] = max(0, $my_conf['album_thumb_size']);
  $my_conf = array_intersect_key($my_conf, $default_conf);
  conf_update_param('modus_theme', addslashes(serialize($my_conf)) );

	global $page;
	$page['infos'][] = 'options saved !';
}


// *************** template init ********************


foreach ($text_values as $k )
  $template->assign( strtoupper($k), $my_conf[$k] );
foreach ($bool_values as $k )
  $template->assign( strtoupper($k), $my_conf[$k] );

$available_derivatives = array( ''=> 'Default');
foreach(array_keys(ImageStdParams::get_defined_type_map()) as $type)
	$available_derivatives[$type] = l10n($type);

$available_skins=array();
$skin_dir = dirname(dirname(__FILE__)).'/skins/';
$skin_suffix = '.inc.php';
foreach( glob($skin_dir.'*'.$skin_suffix) as $file)
{
	$skin = substr($file, strlen($skin_dir), -strlen($skin_suffix));
	$available_skins[$skin] = ucwords( str_replace('_', ' ',$skin));
}

$template->assign( array(
	'available_derivatives' => $available_derivatives,
	'available_skins' => $available_skins,
  'THEMECONF_SRC' => highlight_file( dirname(dirname(__FILE__)).'/themeconf.inc.php', true )
	) );

$template->set_filename( 'modus_content', dirname(__FILE__).'/modus_admin.tpl' );
$template->assign_var_from_handle( 'ADMIN_CONTENT', 'modus_content');
?>