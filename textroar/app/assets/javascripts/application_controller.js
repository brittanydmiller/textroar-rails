function ApplicationController() {
}

ApplicationController.prototype = {
  initialize: function() {
    $('#open').on('click', this.openVoting);
    $('#close').on('click', this.closeVoting);
  },

  openVoting: function(){
    var startDate = new Date();
  },
  
  closeVoting: function(e){
    e.preventDefault();
    var endDate = new Date();
    // var authRequest = $.ajax({
    //  url: '/get_auth',
    //  type: 'GET'
    // });
    // authRequest.done(this.parseMessages);


    // var ajaxRequest = $.ajax({
    //  url: 'https://api.twilio.com/2010-04-01/Accounts/' + session["id"] + '/Messages/',
    //  type: 'GET'
    // });
    // ajaxRequest.done(this.parseMessages);
  }, 
  parseMessages: function(e){
    console.log(e);
  }
}