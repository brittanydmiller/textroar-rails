function ApplicationController(votingController, formController) {
  this.votingController = votingController
  this.formController = formController
}

ApplicationController.prototype = {
  initialize: function() {
    this.votingController.initialize()
    this.formController.initialize()
  }
}