$(document).ready(function() {
  ApplicationController = new ApplicationController(new VotingController(), new FormController(new FormView(formViewSelectors)));
  ApplicationController.initialize();
})

var formViewSelectors = {
  addForm: '#add-form',
  cancelForm: '#cancel-form',
  form: '#response-form'
}

//add #open and #close selectors for VotingController 

