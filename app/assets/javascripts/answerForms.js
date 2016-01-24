$(document).ready(function() {
  loadCreateAnswer();
  loadDeleteAnswer();
});

var clearInputs = function() {
  $('.answer-form').trigger("reset");
  $("#questions-error").empty();
};

var toggleCheckbox = function() {
  $(".answer-correctness-indicator").toggleClass("hidden");
}

var loadCreateAnswer = function() {
  $('.answer-form').on("ajax:success", function(e, data, status, xhr) {
    clearInputs();
    if(xhr.status === 200) {
      $("#questions-list").append(xhr.responseText);
      loadDeleteAnswer();
    } else if(xhr.status === 203) {
      $("#questions-error").append(xhr.responseText);
    }
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error adding an answer');
  });
}

var loadDeleteAnswer = function() {
  $('.question-delete').on("ajax:success", function(e, data, status, xhr) {
    $(this).closest('li.answer').remove()
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error deleting an answer');
  });

  $(".answer-checkbox").on('click', function(e) {
    // TODO: ToggleCheckbox()
  });
}
