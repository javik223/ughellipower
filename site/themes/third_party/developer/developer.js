$(document).ready(function()
{
	var links = {
		'&C=design&M=manager': 'Template Manager',
		'&C=admin_content&M=field_group_management': 'Custom Fields',
		'&C=admin_content&M=channel_management': 'Channels',
		'&C=members&M=member_group_manager': 'Member Groups',
		'&C=admin_content&M=file_upload_preferences': 'File Upload Preferences',
		'&C=admin_system&M=general_configuration': 'General Configuration'
	};
	
	var developer = '<li class="parent"><a href="#" class="first_level" tabindex="-1">Developer</a><ul>';
	
	$.each(links, function(link, title)
	{
		developer += '<li><a href="' + EE.BASE + link + '" tabindex="-1">' + title + '</a></li>';
	});
	
	developer += '</ul></li>';
	
	$("div#mainMenu ul#navigationTabs li:last").before($(developer));
});