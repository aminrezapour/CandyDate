// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery-ui
//= require turbolinks
//= require_tree .

$(document).ready(function() {

  $("#invitation-suggestions").bind("mousedown", function(e) {
    e.metaKey = true;
  }).selectable({
    stop : function () {
      var results = "";
      $(".ui-selected.location").each(function () {
        results += $(this).attr('id') + " ";
      });
      $("#suggestion-result").html("<input type='hidden' name='suggestions_id' id='suggestions_id' value='"+results+"' />");
    }
  });

  $("#invitation-suggestion").selectable({
    stop : function () {
      var result = $(".ui-selected.location").attr('id');
      $("#suggestion-result").html("<input type='hidden' name='suggestion_id' id='suggestion_id' value='"+result+"' />");
    }
  });

  $("#available-days").bind("mousedown", function(e) {
    e.metaKey = true;
  }).selectable({
    stop : function () {
      var results = "";
      $(".ui-selected.day").each(function () {
        results += $(this).attr('id') + " ";
      });
      $("#days-result").html("<input type='hidden' name='availables_id' id='availables_id' value='"+results+"' />");
    }
  });

});

$(document).on('page:load', function() {
  $("#invitation-suggestion").selectable({
    stop : function () {
      var result = $(".ui-selected.location").attr('id');
      $("#suggestion-result").html("<input type='hidden' name='suggestion_id' id='suggestion_id' value='"+result+"' />");
    }
  });

  $("#available-days").bind("mousedown", function(e) {
    e.metaKey = true;
    }).selectable({
      stop : function () {
        var results = "";
        $(".ui-selected.day").each(function () {
          results += $(this).attr('id') + " ";
        });
        $("#days-result").html("<input type='hidden' name='availables_id' id='availables_id' value='"+results+"' />");
      }
    });
});
