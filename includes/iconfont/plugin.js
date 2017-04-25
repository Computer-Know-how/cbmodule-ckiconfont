/**
 * Plugin for inserting Font Awesome icons into the CKEditor editing area.
 * @author Seth Engen <engens@compknowhow.com>
 */

// Register the plugin with the editor.
CKEDITOR.plugins.add( 'iconfont',
{
	init: function( editor )
	{
		// Define an editor command that inserts an icon.
		editor.addCommand( 'iconFontDialog',new CKEDITOR.dialogCommand( 'iconFontDialog' ) );

		// Create a toolbar button that executes the plugin command.
		editor.ui.addButton( 'IconFont',
		{
			// Toolbar button tooltip.
			label: 'Insert icon font',
			// Reference to the plugin command name.
			command: 'iconFontDialog',
			// Button's icon file path.
			icon: this.path + 'images/icon.png'
		} );

		// Includes the Font Awesome stylesheet from the config
		CKEDITOR.document.appendStyleSheet( editor.config.iconfont_stylesheet );

		// Load in the fonts
		var iconArray = ["glass","music","search","envelope-o","heart","star","star-o","user","film","th-large","th","th-list","check","times","search-plus","search-minus","power-off","signal","cog","trash-o","home","file-o","clock-o","road","download","arrow-circle-o-down","arrow-circle-o-up","inbox","play-circle-o","repeat","refresh","list-alt","lock","flag","headphones","volume-off","volume-down","volume-up","qrcode","barcode","tag","tags","book","bookmark","print","camera","font","bold","italic","text-height","text-width","align-left","align-center","align-right","align-justify","list","outdent","indent","video-camera","picture-o","pencil","map-marker","adjust","tint","pencil-square-o","share-square-o","check-square-o","arrows","step-backward","fast-backward","backward","play","pause","stop","forward","fast-forward","step-forward","eject","chevron-left","chevron-right","plus-circle","minus-circle","times-circle","check-circle","question-circle","info-circle","crosshairs","times-circle-o","check-circle-o","ban","arrow-left","arrow-right","arrow-up","arrow-down","share","expand","compress","plus","minus","asterisk","exclamation-circle","gift","leaf","fire","eye","eye-slash","exclamation-triangle","plane","calendar","random","comment","magnet","chevron-up","chevron-down","retweet","shopping-cart","folder","folder-open","arrows-v","arrows-h","bar-chart-o","twitter-square","facebook-square","camera-retro","key","cogs","comments","thumbs-o-up","thumbs-o-down","star-half","heart-o","sign-out","linkedin-square","thumb-tack","external-link","sign-in","trophy","github-square","upload","lemon-o","phone","square-o","bookmark-o","phone-square","twitter","facebook","github","unlock","credit-card","rss","hdd-o","bullhorn","bell","certificate","hand-o-right","hand-o-left","hand-o-up","hand-o-down","arrow-circle-left","arrow-circle-right","arrow-circle-up","arrow-circle-down","globe","wrench","tasks","filter","briefcase","arrows-alt","users","link","cloud","flask","scissors","files-o","paperclip","floppy-o","square","bars","list-ul","list-ol","strikethrough","underline","table","magic","truck","pinterest","pinterest-square","google-plus-square","google-plus","money","caret-down","caret-up","caret-left","caret-right","columns","sort","sort-asc","sort-desc","envelope","linkedin","undo","gavel","tachometer","comment-o","comments-o","bolt","sitemap","umbrella","clipboard","lightbulb-o","exchange","cloud-download","cloud-upload","user-md","stethoscope","suitcase","bell-o","coffee","cutlery","file-text-o","building-o","hospital-o","ambulance","medkit","fighter-jet","beer","h-square","plus-square","angle-double-left","angle-double-right","angle-double-up","angle-double-down","angle-left","angle-right","angle-up","angle-down","desktop","laptop","tablet","mobile","circle-o","quote-left","quote-right","spinner","circle","reply","github-alt","folder-o","folder-open-o","smile-o","frown-o","meh-o","gamepad","keyboard-o","flag-o","flag-checkered","terminal","code","reply-all","mail-reply-all","star-half-o","location-arrow","crop","code-fork","chain-broken","question","info","exclamation","superscript","subscript","eraser","puzzle-piece","microphone","microphone-slash","shield","calendar-o","fire-extinguisher","rocket","maxcdn","chevron-circle-left","chevron-circle-right","chevron-circle-up","chevron-circle-down","html5","css3","anchor","unlock-alt","bullseye","ellipsis-h","ellipsis-v","rss-square","play-circle","ticket","minus-square","minus-square-o","level-up","level-down","check-square","pencil-square","external-link-square","share-square","compass","caret-square-o-down","caret-square-o-up","caret-square-o-right","eur","gbp","usd","inr","jpy","rub","krw","btc","file","file-text","sort-alpha-asc","sort-alpha-desc","sort-amount-asc","sort-amount-desc","sort-numeric-asc","sort-numeric-desc","thumbs-up","thumbs-down","youtube-square","youtube","xing","xing-square","youtube-play","dropbox","stack-overflow","instagram","flickr","adn","bitbucket","bitbucket-square","tumblr","tumblr-square","long-arrow-down","long-arrow-up","long-arrow-left","long-arrow-right","apple","windows","android","linux","dribbble","skype","foursquare","trello","female","male","gittip","sun-o","moon-o","archive","bug","vk","weibo","renren","pagelines","stack-exchange","arrow-circle-o-right","arrow-circle-o-left","caret-square-o-left","dot-circle-o","wheelchair","vimeo-square","try","plus-square-o"];

		// Start the icon font selection table
		var fontsHTML = ['<table role="listbox" style="width:100%; border-collapse: separate; border-spacing: 2px;"><tbody><tr role="presentation">'];
		var iconArrayLength = iconArray.length;
		for (var i = 0; i < iconArrayLength; i++) {
			// Set the icon class name per iteration
			var iconClass = editor.config.iconfont_label + "-" + iconArray[i];

			// 31 (nice even number) icons per row then start again
			if ( i != 0 && i % 31 == 0) fontsHTML.push('</tr><tr>');

			// Start the icon cell and anchor
			fontsHTML.push('<td class="cke_dark_background cke_centered" style="vertical-align: middle; padding: 2px;" role="presentation"><a href="javascript:void(0)" role="option" class="cke_hand" tabindex="-1" style="overflow:hidden; display:block; text-align:center;">');

			// Build the icon selector (include the font label from config - icon,fa)
			fontsHTML.push('<i class="cke_hand ' + editor.config.iconfont_label + ' ' + iconClass  + '" title="' + iconClass + '" alt="' + iconClass + '" style="font-size:2.3em;"></i>');

			// End the icon cell and anchor
			fontsHTML.push('</a></td>');
		}

		// End the icon font selection table
		fontsHTML.push('</tr></tbody></table>');

		// Put it all together!
		fontsHTML = fontsHTML.join('');

		// Add the dialog definition containing all UI elements and listeners.
		CKEDITOR.dialog.add( 'iconFontDialog', function ( editor )
		{
			return {
				// Basic properties of the dialog: title, minimum size.
				title : 'Icon Font',
				minWidth : 800,
				minHeight : 365,

				// Dialog window contents.
				contents :
				[
					{
						// Definition of the icon selection dialog tab (page) with its id, label, and contents.
						id : 'tab1',
						label : 'Icon Options',
						elements :
						[
							{
								type: "html",
								id: "iconSelector",
								html: fontsHTML,
								onClick: function (clicked) {
									var clickedTarget = clicked.data.getTarget();
									var elementType = clickedTarget.getName();

									// If it is a link then get its child
									if (elementType == "a") clickedTarget = clickedTarget.getChild(0);

									// Insert the code
									editor.insertElement( CKEDITOR.dom.element.createFromHtml( '<i class="' + editor.config.iconfont_label + ' ' + clickedTarget.getAttribute("title") + '" aria-hidden="true"><!-- icon --></i>'));

									// Close out the dialog
									CKEDITOR.dialog.getCurrent().hide();
								}
							}
						]
					}
				],
				// Only show the cancel button
				buttons: [CKEDITOR.dialog.cancelButton]
			};
		});
	}
});