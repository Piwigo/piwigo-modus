<h2>Modus theme config</h2>

<form method="post" action="">


<fieldset><legend>Skin</legend>
<select name="skin">
		{html_options options=$available_skins selected=$SKIN}
</select>
</fieldset>

<fieldset><legend>Album thumbs size</legend>
Use square thumbs of <input type="text" size="4" name="album_thumb_size" value="{$ALBUM_THUMB_SIZE}"> pixels. (Leave 0 for default theme presentation)
</fieldset>

<fieldset><legend>Default photo sizes</legend>

<label>Index Photos : 
	<select name="index_photo_deriv">
		{html_options options=$available_derivatives selected=$INDEX_PHOTO_DERIV}
	</select>
</label>
<br>
<label>Index Photos large high density screens : 
	<select name="index_photo_deriv_hdpi">
		{html_options options=$available_derivatives selected=$INDEX_PHOTO_DERIV_HDPI}
	</select>
</label>
</fieldset>

<fieldset><legend>Full row thumbnail layout</legend>
Automatically applied for selected derivatives if max_width > max_height*1.5
<br>

<fieldset><legend>Horizontal crop or resize ?</legend>
If row overflow is > <input name="resize_threshold" value="{$RESIZE_THRESHOLD}" type=number min=1 step=any size=2> (range [1;Inf]) then 
use a factor of the overflow <input name="resize_factor" value="{$RESIZE_FACTOR}"type=number min=0 max=1 step=any size=2> (range [0;1]) for resizing.
</fieldset>
</fieldset>

<p>
<input type="submit" value="Submit" />
</p>
</form>

<div style="text-align:left;line-height:1em">
{$THEMECONF_SRC}
</div>