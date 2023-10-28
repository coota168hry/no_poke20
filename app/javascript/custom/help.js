
window.addEventListener('turbo:load', function() {
  /* オブジェクト取得 */
  /* ヘルプボタン */
  var $button = document.querySelector('.help-button');
  /* モーダル（ヘルプテキスト） */
  var $mordal = document.querySelector('.js-mordal');
  /* ×ボタン */
  var $back = document.querySelector('.back-button-icon');
  console.log('1');
  /* 【イベントリスナー】ヘルプボタンクリック */
  $button.addEventListener('click', function () {
    /* console.log('click-on'); */ 
    /* モーダルにis-showクラスを付与 */
    $mordal.classList.add('is-show');
    console.log('2');
    /* $back.classList.add('is-show'); */
  })
  /* 【イベントリスナー】×ボタンクリック */
  $back.addEventListener('click', function () {
    /* console.log('click-off'); */
    /* モーダルからis-showクラスを削除 */
    $mordal.classList.remove('is-show');
    console.log('3');
    /* $back.classList.remove('is-show'); */
  })
  ;
});
