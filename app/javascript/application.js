// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "jquery"
import "popper.js"
import 'semantic-ui'

$(document).on("turbo:load", () => {
  $('.ui.dropdown').dropdown();
  $('.ui.dimmer').dimmer('show')
;
});
