// 画像を選択するとimg classをビューに追加
$(document).on('turbolinks:load', function() {
  var upload_image = $(".item__dropbox__items");
  var i_count = 1;
  function appendImage(image) {
    var html = `<li class='item__dropbox__items-container'>
                    <div class='item__dropbox__items-figure'>
                        <img class='itemimage' alt='商品画像' src='${image}' style=width:114px; >
                    </div>
                </li>`
    upload_image.append(html);
    ImageCount()
  }

// 画像表示機能 goods_imagesクラスに変更がある分、出品のビューに[goods_image + i_count（画像追加分）]を表示
  $('.goods_images').on("change",function(e) {
    for(var i = 0; i < this.files.length; i++){
      const reader = new FileReader();
      reader.onload = function (e) {
        appendImage(e.target.result,i_count);
      }
      reader.readAsDataURL(this.files[i]);
      i_count += 1;
      $("label.item__dropbox__uploader-container").attr('for','goods_image'+ i_count);
    }
  });
// ビュー側での画像削除(実際には削除されない)
  $(document).on("click",".delete",function(e) {
    var input_num = $(this).attr('id');
    $(this).parent().remove();
  });
});


