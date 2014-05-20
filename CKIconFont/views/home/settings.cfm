<cfoutput>
<!--============================Sidebar============================-->
<div class="sidebar">
	<!--- Info Box --->
	<div class="small_box expose">
		<div class="header">
			<i class="icon-medkit"></i> Need Assistance?
		</div>
		<div class="body">
			<a href="http://www.CompKnowHow.com" target="_blank" title="Your ColdBox and ContentBox specialists.">
			<div class="center"><img src="#event.getModuleRoot('CKIconFont')#/includes/images/logo.png" alt="Computer Know How" border="0" /></a><br/></div>

			<p>
				<strong>Computer Know How</strong>
				has a team of talented ColdFusion developers that can be your specialists when it comes to anything ColdBox and ContentBox.
				<a href="mailto:info@compknowhow.com">Contact us</a>, we are here to help!
			</p>
		</div>
	</div>
</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			<i class="icon-font"></i> CK IconFonts
		</div>
		<!--- Body --->
		<div class="body" id="mainBody">
			#getPlugin("MessageBox").renderit()#

			#html.startForm(action="#cb.buildModuleLink('CKIconFont','home.saveSettings')#",name="settingsForm")#
				#html.startFieldset(legend="<i class='icon-magic icon-large'></i> Integration")#

					#html.textField(name="label", label="Label:", value="#prc.settings.label#", class="textfield width98")#

					#html.textField(name="stylesheet", label="Stylesheet:", value="#prc.settings.stylesheet#", class="textfield width98")#

				#html.endFieldSet()#

					<!--- Button Bar --->
					<div class="form-actions">
						#html.submitButton(value="Save Settings", class="btn btn-danger")#
				</div>
			#html.endForm()#
		</div>
	</div>
</div>
</cfoutput>