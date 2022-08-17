// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "popper.js"
import 'semantic-ui'
import "channels"

$(document).on("turbo:load", () => {
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });
  $('.ui.dropdown').dropdown();
  $('.dimmable').dimmer('show');
});
