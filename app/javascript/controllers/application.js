import { Application } from "@hotwired/stimulus"
import "jquery"; // this import first
import "script"; // then your other imports that use `$`

// NOTE: don't use relative imports: `import "./script"`
//       add `pin "script"` to `importmap.rb`




const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus = application


console.log($); // ok

$(document).on('turbolinks:load', function() {
    $('.ui.dropdown').dropdown();
    console.log("hello world")
});

export { application }