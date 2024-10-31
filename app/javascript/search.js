window.addEventListener("turbo:load", function () {
  const initialSubmitBtn = document.getElementById("initial-submit-btn");
  const advancedSearchFields = document.getElementById("advanced-search-fields");
  const initialSearchForm = document.getElementById("initial-search-form");

  initialSubmitBtn.addEventListener("click", function(event) {
    event.preventDefault();  // デフォルトのフォーム送信を防止
    advancedSearchFields.style.display = "block";
    initialSearchForm.style.display = "none";

    // 国名の値をhiddenフィールドに設定
    const countryInput = document.querySelector(".search-field").value;
    document.getElementById("hidden-country-field").value = countryInput;
  });
});