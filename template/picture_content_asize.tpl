{combine_script id='photo.autosize' path="themes/`$themeconf.id`/js/photo.autosize.min.js" load='footer' require='jquery'}

{footer_script}RVAS = {
derivatives: [
{foreach from=$current.unique_derivatives item=derivative name=derivative_loop}{assign var='size' value=$derivative->get_size()}
{ldelim}w:{$size[0]},h:{$size[1]},url:'{$derivative->get_url()|@escape:'javascript'}',type:'{$derivative->get_type()}'}{if !$smarty.foreach.derivative_loop.last},{/if}
{/foreach}],
cp: '{$COOKIE_PATH|@escape:'javascript'}'
}{/footer_script}
{if $RVAS_PENDING}
<noscript><img src="{$current.selected_derivative->get_url()}" {$current.selected_derivative->get_size_htm()} alt="{$ALT_IMG}" id="theMainImage" usemap="#map{$current.selected_derivative->get_type()}" title="{if isset($COMMENT_IMG)}{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{else}{$current.TITLE_ESC} - {$ALT_IMG}{/if}" itemprop=contentURL></noscript>
{footer_script}rvas_choose();{/footer_script}
{else}
{footer_script}rvas_choose(1);{/footer_script}
{/if}
<img{if !$RVAS_PENDING} src="{$current.selected_derivative->get_url()}" {if isset($rvas_display_size)}width={$rvas_display_size[0]} height={$rvas_display_size[1]} data-natural-w={$rvas_natural_size[0]}{else}{$current.selected_derivative->get_size_htm()}{/if} itemprop=contentURL{/if} alt="{$ALT_IMG}" id="theMainImage"{if !isset($rvas_display_size)} usemap="#map{$current.selected_derivative->get_type()}"{/if} title="{if isset($COMMENT_IMG)}{$COMMENT_IMG|@strip_tags:false|@replace:'"':' '}{else}{$current.TITLE_ESC} - {$ALT_IMG}{/if}">

{foreach from=$current.unique_derivatives item=derivative key=derivative_type}{strip}
<map name="map{$derivative->get_type()}">
{assign var='size' value=$derivative->get_size()}
{if isset($previous)}
<area shape=rect coords="0,0,{($size[0]/4)|@intval},{$size[1]}" href="{$previous.U_IMG}" title="{'Previous'|@translate} : {$previous.TITLE_ESC}" alt="{$previous.TITLE_ESC}">
{/if}
<area shape=rect coords="{($size[0]/4)|@intval},0,{($size[0]/1.34)|@intval},{($size[1]/4)|@intval}" href="{$U_UP}" title="{'Thumbnails'|@translate}" alt="{'Thumbnails'|@translate}">
{if isset($next)}
<area shape=rect coords="{($size[0]/1.33)|@intval},0,{$size[0]},{$size[1]}" href="{$next.U_IMG}" title="{'Next'|@translate} : {$next.TITLE_ESC}" alt="{$next.TITLE_ESC}">
{/if}
</map>
{/strip}{/foreach}