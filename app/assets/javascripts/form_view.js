function FormView(selectors){
  this.addFormSelector = selectors["addForm"]
  this.cancelFormSelector = selectors["cancelForm"]
  this.formSelector = selectors["form"]
}

FormView.prototype = {
  getAddFormSelector: function(){
    return $(this.addFormSelector)
  },
  getCancelFormSelector: function(){
    return $(this.cancelFormSelector)
  }, 
  showForm: function(){
    $(this.addFormSelector).hide()
    $(this.cancelFormSelector).show()
    $(this.formSelector).slideDown()
  },
  hideForm: function(){
    $(this.addFormSelector).show()
    $(this.cancelFormSelector).hide()
    $(this.formSelector).slideUp()
  }
}
