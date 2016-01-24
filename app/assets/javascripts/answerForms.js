$(document).ready(function() {
  $('.answer-form').on("ajax:success", function(e, data, status, xhr) {
    clearInputs();
    if(xhr.status === 200) {
      $("#questions-list").append(xhr.responseText);
    } else if(xhr.status === 203) {
      $("#questions-error").append(xhr.responseText);
    }
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error');
  });

  $(".answer-checkbox").on('click', function(e) {
    // toggleCheckbox()
  });
});

var clearInputs = function() {
  $('.answer-form').trigger("reset");
  $("#questions-error").empty();
};

var toggleCheckbox = function() {
  $(".answer-correctness-indicator").toggleClass("hidden");
}
