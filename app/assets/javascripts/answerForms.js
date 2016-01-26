$(document).ready(function() {
  loadBindings();
});

var loadBindings = function() {
  bindCreateAnswer();
  bindEditAnswer();
  bindUpdateAnswer();
  bindDeleteAnswer();
}

var clearInputs = function() {
  $('.answer-form').trigger("reset");
  $("#questions-error").empty();
};

var toggleCheckbox = function() {
  $(".answer-correctness-indicator").toggleClass("hidden");
};

var bindCreateAnswer = function() {
  $(document).on("ajax:success", '.answer-form', function(e, data, status, xhr) {
    clearInputs();
    if(xhr.status === 200) {
      $("#questions-list").append(xhr.responseText);
    } else if(xhr.status === 203) {
      $("#questions-error").append(xhr.responseText);
    }
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error adding an answer');
  });
};

var bindEditAnswer = function() {
  $(document).on('click', '.answer-edit',function() {
    var listItem = $(this).closest('li.answer')
    $(this).on('ajax:success', function(e, data, status, xhr) {
      listItem.empty()
      listItem.append(xhr.responseText)
      $('.new-answer').toggleClass('hidden')
    });
  });
};

var bindUpdateAnswer = function() {
  $(document).on("ajax:success", '.edit-answer-form', function(e, data, status, xhr) {
    var listItem = $('.edit-answer-form').closest('li.answer')
    if(xhr.status === 200) {
      listItem.empty()
      listItem.replaceWith(xhr.responseText)
      $('.new-answer').toggleClass('hidden')
    } else if(xhr.status === 203) {
      console.log(xhr)
      $(".edit-answer-errors").empty();
      $(".edit-answer-errors").append(xhr.responseText);
    }
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error adding an answer');
  });
}

var bindDeleteAnswer = function() {
  $(document).on("ajax:success", '.answer-delete', function(e, data, status, xhr) {
    $(this).closest('li.answer').remove()
  }).on("ajax:error", function(e, data, status, xhr) {
    console.log('There was an error deleting an answer');
  });

  $(".answer-checkbox").on('click', function(e) {
    // TODO: ToggleCheckbox()
  });
};
