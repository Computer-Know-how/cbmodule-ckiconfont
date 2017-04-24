<cfoutput>
	<div class="row">
		<div class="col-md-12">
			<h1 class="h1">
				<i class="fa fa-fa"></i> CK IconFonts
			</h1>
		</div>
	</div>
	<div class="row">
		<div class="col-md-9">
			<div class="panel panel-default">
				<div class="panel-body">
					#getInstance("MessageBox@cbmessagebox").renderit()#

					#html.startForm(action="#cb.buildModuleLink('CKIconFont','home.saveSettings')#",name="settingsForm")#
					#html.startFieldset(legend="<i class='fa fa-magic'></i> Integration")#

					<div class="form-group">
						#html.label(field="label", content="Label:")#
						#html.inputField(name="label", value=prc.settings.label, class="form-control", type="text")#
					</div>

					<div class="form-group">
						#html.label(field="stylesheet", content="Stylesheet:")#
						#html.inputField(name="stylesheet", value=prc.settings.stylesheet, class="form-control", type="text")#
					</div>
					#html.endFieldSet()#

					<!--- Button Bar --->
					<div class="form-actions">
						#html.submitButton(value="Save Settings", class="btn btn-danger")#
					</div>
					#html.endForm()#
				</div>
			</div>
		</div>

		<!--============================ Sidebar ============================-->
		<div class="col-md-3">
			<div class="panel panel-primary">
				<!--- Info Box --->
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-medkit"></i> Need Assistance?
					</h3>
				</div>
				<div class="panel-body">
					<a href="http://www.CompKnowHow.com" target="_blank" title="Your ColdBox and ContentBox specialists.">
						<div class="center">
							<img src="#event.getModuleRoot('CKIconFont')#/includes/images/logo.png" alt="Computer Know How" border="0" />
						</div>
					</a>
					<p>
						<strong>Computer Know How</strong>
						has a team of talented ColdFusion developers that can be your specialists when it comes to anything ColdBox and ContentBox.
						<a href="mailto:info@compknowhow.com">Contact us</a>, we are here to help!
					</p>
				</div>
			</div>
		</div>
	</div>
</cfoutput>