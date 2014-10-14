<div id="slideshow">
  <div id="imageHeaderBar">
	<div class="imageNumber">{$PHOTO}</div>
	<div class="browsePath">
	  {if isset($U_SLIDESHOW_STOP) }
		[ <a href="{$U_SLIDESHOW_STOP}">{'stop the slideshow'|translate}</a> ]
	  {/if}
	  <h2 class="showtitle">{$current.TITLE}</h2>
	</div>
  </div>

  <div id="content">
	<div id="theImage">
      {include file=$FOTORAMA_CONTENT_PATH}
	</div>
  </div>
</div>
