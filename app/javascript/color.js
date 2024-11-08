function color() {
  const submitButton = document.getElementById("initial-submit-btn")
  const secondSubmitButton = document.getElementById("second-submit-btn")
  
  submitButton.addEventListener('mouseover', function(){
    submitButton.setAttribute("style", "background-color:#f1c574;")
  })
  submitButton.addEventListener('mouseout', function(){
    submitButton.removeAttribute("style")
  })

  secondSubmitButton.addEventListener('mouseover', function(){
    secondSubmitButton.setAttribute("style", "background-color:#f1c574;")
  })
  secondSubmitButton.addEventListener('mouseout', function(){
    secondSubmitButton.removeAttribute("style")
  })

}

window.addEventListener('load', color)
window.addEventListener('turbo:render', color)