# Pin npm packages by running ./bin/importmap

pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js", preload: true
pin "popper.js", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.0/dist/esm/index.js", preload: true
pin "semantic-ui", to: "https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"

