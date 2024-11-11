function color() {
  const submitButton = document.getElementById("initial-submit-btn");
  const secondSubmitButton = document.getElementById("second-submit-btn");
  const linksToRoot = document.querySelectorAll(".link_to_root");

  if (submitButton) {
    submitButton.addEventListener('mouseover', function() {
      submitButton.setAttribute("style", "background-color:#f1c574;");
    });
    submitButton.addEventListener('mouseout', function() {
      submitButton.removeAttribute("style");
    });
  }

  if (secondSubmitButton) {
    secondSubmitButton.addEventListener('mouseover', function() {
      secondSubmitButton.setAttribute("style", "background-color:#f1c574;");
    });
    secondSubmitButton.addEventListener('mouseout', function() {
      secondSubmitButton.removeAttribute("style");
    });
  }

  linksToRoot.forEach(function(link) {
    link.addEventListener('mouseover', function() {
      link.setAttribute("style", "background-color:#f1c574;");
    });
    link.addEventListener('mouseout', function() {
      link.removeAttribute("style");
    });
  });
}

// Turboと通常のDOMの読み込みイベントの両方でcolor関数を実行
document.addEventListener("DOMContentLoaded", color);
document.addEventListener("turbo:load", color);

