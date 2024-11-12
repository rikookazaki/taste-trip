function color() {
  const linksToRoot = document.querySelectorAll(".link_to_root");          //検索画面に戻るボタン
  const headButton = document.querySelectorAll(".head_btn");               //ヘッダーのボタン
  const submitButton = document.querySelectorAll(".submit_btn");           //検索・申請の送信ボタン
  const favoriteButton = document.querySelectorAll(".favorite-btn");       //お気に入りボタン
  const restaurantName = document.querySelectorAll(".restaurant_name");    //店名

  //  戻るボタンの色の変化
  linksToRoot.forEach(function(link) {
    link.addEventListener('mouseover', function() {
      link.setAttribute("style", "background-color:#f1c574;");
    });
    link.addEventListener('mouseout', function() {
      link.removeAttribute("style");
    });
  });

  //  ヘッダーのボタンの色の変化
  headButton.forEach(function(btn) {
    btn.addEventListener('mouseover', function() {
      btn.setAttribute("style", "color:#d3a2a2;");
    });
    btn.addEventListener('mouseout', function() {
      btn.removeAttribute("style");
    });
  });

  //  送信ボタンの色の変化
  submitButton.forEach(function(btn) {
    btn.addEventListener('mouseover', function() {
      btn.setAttribute("style", "background-color:#f1c574;");
    });
    btn.addEventListener('mouseout', function() {
      btn.removeAttribute("style");
    });
  });

  //  お気に入りボタンの色の変化
  favoriteButton.forEach(function(btn) {
    btn.addEventListener('mouseover', function() {
      btn.setAttribute("style", "background-color:#96e296;");
    });
    btn.addEventListener('mouseout', function() {
      btn.removeAttribute("style");
    });
  });

  //  店名の色の変化
  restaurantName.forEach(function(name) {
    name.addEventListener('mouseover', function() {
      name.setAttribute("style", "color:#96e296;");
    });
    name.addEventListener('mouseout', function() {
      name.removeAttribute("style");
    });
  });
}

// Turboと通常のDOMの読み込みイベントの両方でcolor関数を実行
document.addEventListener("DOMContentLoaded", color);
document.addEventListener("turbo:load", color);