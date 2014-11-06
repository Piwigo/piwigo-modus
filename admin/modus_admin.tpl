{combine_script id='common' load='footer' path='admin/themes/default/js/common.js'}
{combine_script id='jquery.ui.slider' require='jquery.ui' load='footer' path='themes/default/js/ui/minified/jquery.ui.slider.min.js'}
{combine_css path="themes/default/js/ui/theme/jquery.ui.slider.css"}

{html_style}
.graphicalCheckbox {
  font-size:16px;
  line-height:16px;
}

.graphicalCheckbox + input {
  display:none;
}

#album_thumb_size {
  width:400px;
  display:inline-block;
  margin-right:10px;
}

#album_square_thumbs {
  margin-top:5px;
}
{/html_style}


{footer_script}
jQuery(document).ready(function() {
  jQuery('#modus-config input[type=checkbox]').change(function() {
    jQuery(this).prev().toggleClass('icon-check icon-check-empty');
  });

  jQuery('input[name=use_album_square_thumbs]').change(function() {
    jQuery('#album_square_thumbs').toggle();
  });

  jQuery("#album_thumb_size").slider({
    range: "min",
    min: 200,
    max: 400,
    value: {$ALBUM_THUMB_SIZE},
    slide: function( event, ui ) {
      jQuery("#album_thumb_size_info").html(sprintf("{'%d pixels'|translate}", ui.value));
    },
    stop: function( event, ui ) {
      jQuery("input[name=album_thumb_size]").val(ui.value);
    }
  });

});
{/footer_script}

<h2>{'Modus theme config'|translate}</h2>

<form method="post" action="" id="modus-config">


<fieldset><legend>{'Skin'|translate}</legend>
<select name="skin">
		{html_options options=$available_skins selected=$SKIN}
</select>
</fieldset>

<fieldset><legend>{'Album thumbnails'|translate}</legend>
  <label>
    <span class="graphicalCheckbox icon-check{if not $use_album_square_thumbs}-empty{/if}"></span>
    <input type="checkbox" name="use_album_square_thumbs"{if $use_album_square_thumbs} checked="checked"{/if}>
    <b>{'Use square thumbs'|translate}</b>
  </label>

  <div id="album_square_thumbs"{if not $use_album_square_thumbs} style="display:none"{/if}>
    <div id="album_thumb_size"></div>
    <span id="album_thumb_size_info">{'%d pixels'|translate|sprintf:$ALBUM_THUMB_SIZE}</span>
    <input type="hidden" name="album_thumb_size" value="{$ALBUM_THUMB_SIZE}">
  </div>

</fieldset>

<fieldset><legend>{'Default sizes'|translate}</legend>

<label>{'Default size for thumbnails'|translate}
	<select name="index_photo_deriv">
		{html_options options=$available_derivatives selected=$INDEX_PHOTO_DERIV}
	</select>
</label>
<br>
<label>{'Default size for thumbnails on high density display (retina)'|translate}
	<select name="index_photo_deriv_hdpi">
		{html_options options=$available_derivatives selected=$INDEX_PHOTO_DERIV_HDPI}
	</select>
</label>
</fieldset>

<fieldset><legend>{'Page banner'|translate}</legend>
  <label>
    <span class="graphicalCheckbox icon-check{if not $DISPLAY_PAGE_BANNER}-empty{/if}"></span>
    <input type="checkbox" name="display_page_banner"{if $DISPLAY_PAGE_BANNER} checked="checked"{/if}>
    <b>{'Display page banner'|translate}</b>
  </label>
</fieldset>


{*
<fieldset><legend>Full row thumbnail layout</legend>
Automatically applied for selected derivatives if max_width > max_height*1.5
</fieldset>
*}

<p class="formButtons">
<input type="submit" value="{'Save Settings'|translate}" />
</p>
</form>

