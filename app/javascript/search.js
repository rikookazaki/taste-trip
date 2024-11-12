function search() {
  const mainElements = document.querySelectorAll(".main");                          // .main クラスの要素を取得
  const initialSearchForm = document.getElementById("initial-search-form");         // 国名検索フィールド
  const initialSubmitBtn = document.getElementById("initial-submit-btn");           // 「次へ」ボタン
  const advancedSearchFields = document.getElementById("advanced-search-fields");   // 追加の検索フィールド
  const secondSubmitBtn = document.getElementById("second-submit-btn");             // 「検索」ボタン

  // main要素のアニメーションの関数
  function animateMainElements() {
    mainElements.forEach(element => {
      element.classList.remove("fade-in");
      setTimeout(() => {
        element.classList.add("fade-in");
      }, 10);
    });
  }

  // ページが最初に読み込まれたときのmain要素フェードイン
  animateMainElements();

  // 「次へ」ボタンをクリックしたとき
  initialSubmitBtn.addEventListener("click", function(event) {
    event.preventDefault(); // デフォルトの送信を防止

    // initial-search-form を非表示にし、advanced-search-fields を表示
    initialSearchForm.style.display = "none";
    advancedSearchFields.style.display = "block";

    // 国名の値を hidden フィールドに設定
    const countryInput = document.querySelector(".search-field").value;
    document.getElementById("hidden-country-field").value = countryInput;

    // main要素の状態を一度リセットし再びフェードイン
    animateMainElements();
  });

  // 「検索」ボタンをクリックしたとき
  secondSubmitBtn.addEventListener("click", function(event) {
    // advanced-search-fields を非表示にし、検索結果を表示
    advancedSearchFields.style.display = "none";

    // main 要素のアニメーションをリセット
    animateMainElements();
  });
}

document.addEventListener("DOMContentLoaded", search);
document.addEventListener("turbo:load", search);