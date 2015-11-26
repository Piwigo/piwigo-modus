@import "fontello/css/modus.css";

A:hover .pwg-icon:before{
	text-decoration: none !important; /* IE 8,9*/
}

.pwg-icon {
{if isset($loaded_plugins['language_switch']) || isset($loaded_plugins['BatchDownloader'])}
	display: inline-block;
{/if}
	font-size: 24px
}


.pwg-button-text{
	display:none;
}

.pwg-state-disabled .pwg-icon {
	opacity: .5;
	-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	filter: alpha(opacity=50);
}

.pwg-button {
	display: inline-block;
	vertical-align: top;
	cursor:pointer;
}

.pwg-icon-slideshow:before { content: '\25b6';}
.pwg-icon-favorite-del:before { content: '\2661\2d'; letter-spacing: -2px}

{if $conf.index_posted_date_icon}
{if $conf.index_created_date_icon}
.pwg-icon-calendar:before { content: '\f133'; }
.pwg-icon-camera-calendar:before { content: '\e70f'; }
{else}
.pwg-icon-calendar:before { content: '\f133'; }
{/if}
{/if}

{if  isset($loaded_plugins['BatchDownloader'])}
.batch-downloader-icon {
	width: 26px
}
{/if}

{if  isset($loaded_plugins['UserCollections'])}
.user-collections-icon, .user-collections-share-icon, .user-collections-clear-icon, .user-collections-delete-icon, .user-collections-mail-icon {
	display: inline-block;
	height: 26px;
	width: 26px;
}
{/if}