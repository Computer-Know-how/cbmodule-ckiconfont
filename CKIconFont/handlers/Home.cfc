component{

	// DI
	property name="settingService" 	inject="settingService@cb";
	property name="cb" 				inject="cbHelper@cb";

	function settings(event,rc,prc){
		// Activate the module tab and 'CK IconFont' menu contribution
		prc.tabModules = true;
		prc.tabModules_CKIconFont = true;

		// Get the settings
		prc.settings = deserializeJSON(settingService.getSetting( "cbox-ckiconfont" ));

		// View
		event.setView("home/settings");
	}

	function saveSettings(event,rc,prc){
		var incomingSettings = "";
		var newSettings = {};

		var oSetting = settingService.findWhere( { name="cbox-ckiconfont" } );

		// Get settings from user input
		incomingSettings = serializeJSON(
			{
				"label" = rc.label,
				"stylesheet" = rc.stylesheet
			}
		);

		newSettings = deserializeJSON(incomingSettings);

		var existingSettings = deserializeJSON(oSetting.getValue());

		// Append the new settings sent in to the existing settings (overwrite)
		structAppend(existingSettings,newSettings);

		oSetting.setValue( serializeJSON(existingSettings) );
		settingService.save( oSetting );

		// Flush the settings cache so our new settings are reflected
		settingService.flushSettingsCache();

		getPlugin("MessageBox").info("Settings saved & updated!");
		cb.setNextModuleEvent("CKIconFont","home.settings");
	}

}