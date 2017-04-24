/**
********************************************************************************
Copyright 2014 Computer Know How, www.compknowhow.com
********************************************************************************

Author: Seth Engen
Description: This module adds icon font support to the CKEditor window.

********************************************************************************
**/
component {

	// Module Properties
	this.title 				= "CKIconFont";
	this.author 			= "Computer Know How, LLC";
	this.webURL 			= "http://www.compknowhow.com";
	this.description 		= "Adds icon font support to CKEditor 4 in ContentBox";
	this.version			= "1.1";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "ckiconfont";

	function configure(){
		// Settings
		settings = {
			version = "1",
			stylesheet = "//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css",
			label = 'fa'
		};

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

		// Map objects
		binder.map("fileUtils@ckiconfont").to("coldbox.system.core.util.FileUtils");

	}

	/**
	* CKEditor Plugin Integrations
	*/
	function cbadmin_ckeditorExtraPlugins(event, interceptData){
		// Add the 'iconfont' plugin to the CKEditors extra plugins (note: will not show in settings)
		arrayAppend( arguments.interceptData.extraPlugins, "iconfont" );
	}

	/**
	* CKEditor Toolbar Integrations
	*/
	function cbadmin_ckeditorToolbar(event, interceptData){
		// Get the location of the CKEditor 'styles' toolbar section
		var dimensionNumber = 0;
		for (i=1; i LTE arrayLen(arguments.interceptData.toolbar); i++) {
			if (isStruct(arguments.interceptData.toolbar[i]) AND structFind(arguments.interceptData.toolbar[i],'name') IS 'styles') {
				dimensionNumber = i;
			}
		}

		// Add our 'IconFont' button to the toolbar (with a space)
		arrayAppend( arguments.interceptData.toolbar[dimensionNumber].items, "-" );
		arrayAppend( arguments.interceptData.toolbar[dimensionNumber].items, "IconFont" );
	}

	/**
	* CKEditor Config Integration
	*/
	function cbadmin_ckeditorExtraConfig(event, interceptData){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");

		// Get the IconFont settings
		var args = {name="cbox-ckiconfont"};
		var settings = deserializeJSON( settingService.findWhere(criteria=args).getValue() );

		// Add the settings to the CKEditor extra config
		arguments.interceptData.extraConfig &= "iconfont_stylesheet : '" & settings.stylesheet & "'";
		arguments.interceptData.extraConfig &= ", iconfont_label : '" & settings.label & "'";
		arguments.interceptData.extraConfig &= ", contentsCss : '" & settings.stylesheet &"'";
	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");

		// Add a 'CK IconFont' contribution to the modules menu
		menuService.addSubMenu(topMenu=menuService.MODULES,name="CKIconFont",label="CK IconFont",href="#menuService.buildModuleLink('cbmodule-ckiconfont','home.settings')#");
	}

	/**
	* Fired when the module is activated
	*/
	function onActivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");

		// Store default settings
		var findArgs = {name="cbox-ckiconfont"};
		var setting = settingService.findWhere(criteria=findArgs);
		if( isNull(setting) ){
			var args = {name="cbox-ckiconfont", value=serializeJSON( settings )};
			var ckIconFontSettings = settingService.new(properties=args);
			settingService.save( ckIconFontSettings );
		}

		// Flush the settings cache so our new settings are reflected
		settingService.flushSettingsCache();

		// Install the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting("modules")["contentbox-admin"].path & "/modules/contentbox-ckeditor/includes/ckeditor/plugins/iconfont";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@ckiconfont");
		var pluginPath = controller.getSetting("modules")["cbmodule-ckiconfont"].path & "/includes/iconfont";
		fileUtils.directoryCopy(source=pluginPath, destination=ckeditorPluginsPath);
	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");

		// Remove the 'CK IconFont' contribution from the modules menu
		menuService.removeSubMenu(topMenu=menuService.MODULES,name="CKIconFont");
	}

	/**
	* Fired when the module is deactivated by ContentBox Only
	*/
	function onDeactivate(){
		var settingService = controller.getWireBox().getInstance("SettingService@cb");

		// Remove the settings
		var args = {name="cbox-ckiconfont"};
		var setting = settingService.findWhere(criteria=args);
		if( !isNull(setting) ){
			settingService.delete( setting );
		}

		// Flush the settings cache so our new settings are reflected
		settingService.flushSettingsCache();

		// Uninstall the ckeditor plugin
		var ckeditorPluginsPath = controller.getSetting("modules")["contentbox-admin"].path & "/modules/contentbox-ckeditor/includes/ckeditor/plugins/iconfont";
		var fileUtils = controller.getWireBox().getInstance("fileUtils@ckiconfont");
		fileUtils.directoryRemove(path=ckeditorPluginsPath, recurse=true);
	}
}