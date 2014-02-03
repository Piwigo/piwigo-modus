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

</fieldset>

<p>
<input type="submit" value="Submit" />
</p>
</form>

