import { Application } from "@hotwired/stimulus"


const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application

export { application }

//= require semantic-ui

$(document).on('turbolinks:load', function() {
    $('.ui.dropdown').dropdown();
});