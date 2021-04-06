import Rails from "@rails/ujs"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
ActiveStorage.start()

$(function(){
  $('#ask-button').click(function(){
    $('#ask-form').slideToggle(300);
    return false;
  });
});
