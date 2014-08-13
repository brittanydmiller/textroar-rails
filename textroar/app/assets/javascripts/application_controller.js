function ApplicationController(formController) {
  this.formController = formController
}

ApplicationController.prototype = {
  initialize: function() {
    this.formController.initialize()
  }
}