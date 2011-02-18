// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(function () {
	if ($('#missing_image').length > 0) {
		setTimeout(updateSubmissionImage, 5000);
	}
});

function updateSubmissionImage() {
  var submission_id = $('#missing_image').attr('data-id')
  $.getScript('/submissions/' + submission_id + '.js');
  setTimeout(updateSubmissionImage, 5000);
}
