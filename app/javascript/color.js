function color() {
  const linksToRoot = document.querySelectorAll(".link_to_root");   //検索画面に戻るボタン
  const headButton = document.querySelectorAll(".head_btn");        //ヘッダーのボタン
  const submitButton = document.querySelectorAll(".submit_btn");    //検索・申請の送信ボタン

  linksToRoot.forEach(function(link) {
    link.addEventListener('mouseover', function() {
      link.setAttribute("style", "background-color:#f1c574;");
    });
    link.addEventListener('mouseout', function() {
      link.removeAttribute("style");
    });
  });

  headButton.forEach(function(btn) {
    btn.addEventListener('mouseover', function() {
      btn.setAttribute("style", "color:#d3a2a2;");
    });
    btn.addEventListener('mouseout', function() {
      btn.removeAttribute("style");
    });
  });

  submitButton.forEach(function(btn) {
    btn.addEventListener('mouseover', function() {
      btn.setAttribute("style", "background-color:#f1c574;");
    });
    btn.addEventListener('mouseout', function() {
      btn.removeAttribute("style");
    });
  });
}

// Turboと通常のDOMの読み込みイベントの両方でcolor関数を実行
document.addEventListener("DOMContentLoaded", color);
document.addEventListener("turbo:load", color);

