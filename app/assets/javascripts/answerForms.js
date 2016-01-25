$(document).ready(function() {
  loadCreateAnswer();
  loadEditAnswer();
  loadUpdateAnswer();
  loadDeleteAnswer();
});

var reloadBindings = function() {
  loadCreateAnswer();
  loadEditAnswer();
  loadUpdateAnswer();
  loadDeleteAnswer();
}

var clearInputs = function() {
  $('.answer-form').trigger("reset");
  $("#questions-error").empty();
};

var toggleCheckbox = function() {
  $(".answer-correctness-indicator").toggleClass("hidden");
};

var loadCreateAnswer = function() {
  $('.answer-form').on("ajax:success", function(e, data, status, xhr) {
    clearInputs();
    if(xhr.status === 200) {
      $("#questions-list").append(xhr.responseText);
      reloadBindings()
    } else if(xhr.status === 203) {
      $("#questions-error").append(xhr.responseText);
    }
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error adding an answer');
  });
};

var loadEditAnswer = function() {
  $('.answer-edit').on('click', function() {
    var listItem = $(this).closest('li.answer')
    $(".answer-edit").on('ajax:success', function(e, data, status, xhr) {
      listItem.empty()
      listItem.append(xhr.responseText)
      reloadBindings()
      $('.new-answer').toggleClass('hidden')
    });
  });
};

var loadUpdateAnswer = function() {
  $('.edit-answer-form').on("ajax:success", function(e, data, status, xhr) {
    var listItem = $('.edit-answer-form').closest('li.answer')
    if(xhr.status === 200) {
      listItem.empty()
      listItem.replaceWith(xhr.responseText)
      $('.new-answer').toggleClass('hidden')
      reloadBindings()
    } else if(xhr.status === 203) {
      console.log(xhr)
      $(".edit-answer-errors").empty();
      $(".edit-answer-errors").append(xhr.responseText);
    }
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error adding an answer');
  });
}

var loadDeleteAnswer = function() {
  $('.answer-delete').on("ajax:success", function(e, data, status, xhr) {
    $(this).closest('li.answer').remove()
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error deleting an answer');
  });

  $(".answer-checkbox").on('click', function(e) {
    // TODO: ToggleCheckbox()
  });
};
