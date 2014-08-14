function ApplicationController(votingController, formController) {
  this.votingController = votingController
  this.formController = formController
}

ApplicationController.prototype = {
  initialize: function() {
    this.votingController.initialize()
    this.formController.initialize()
    $('#add-response').on('ajax:success', this.updateSurvey.bind(this))
  },
  updateSurvey: function(e, response){
    $("#survey-responses").append("<li>" + response.key + " " + response.text + "</li>")
  }
}