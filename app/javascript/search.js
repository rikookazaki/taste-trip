window.addEventListener("turbo:load", function () {
  const mainElements = document.querySelectorAll(".main"); // .main クラスの要素を取得
  const initialSearchForm = document.getElementById("initial-search-form");
  const initialSubmitBtn = document.getElementById("initial-submit-btn");
  const advancedSearchFields = document.getElementById("advanced-search-fields");
  const secondSubmitBtn = document.getElementById("second-submit-btn");

  // 初回読み込み時に main 要素のアニメーションを発動
  function animateMainElements() {
    mainElements.forEach(element => {
      element.classList.remove("fade-in");
      setTimeout(() => {
        element.classList.add("fade-in");
      }, 10);
    });
  }

  // ページが最初に読み込まれたときに main 要素をアニメーション
  animateMainElements();

  // 「次へ」ボタンをクリックしたときの処理
  initialSubmitBtn.addEventListener("click", function(event) {
    event.preventDefault(); // デフォルトの送信を防止

    // initial-search-form を非表示にし、advanced-search-fields を表示
    initialSearchForm.style.display = "none";
    advancedSearchFields.style.display = "block";

    // 国名の値を hidden フィールドに設定
    const countryInput = document.querySelector(".search-field").value;
    document.getElementById("hidden-country-field").value = countryInput;

    // main 要素のアニメーションをリセット
    animateMainElements();
  });

  // 「検索」ボタンをクリックしたときの処理
  secondSubmitBtn.addEventListener("click", function(event) {
    // advanced-search-fields を非表示にし、検索結果を表示
    advancedSearchFields.style.display = "none";

    // main 要素のアニメーションをリセット
    animateMainElements();
  });
});
