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

  function ImageCount() {
  var imagelist = $('li.item__dropbox__items_container');
  if(imagelist.length >= 5){
    $('.item__dropbox__uploader').addClass('hidden');
  }
  else if(imagelist.length < 4){
    $('.item__dropbox__uploader').removeClass('visibility:hidden');
  }
  return imagelist.length
  }

// 画像表示機能 goods_imagesクラスに変更がある分、ビューに[goods_image + i_count（画像追加分）]を表示
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
// 削除
  $(document).on("click",".sell-image_delete",function(e) {
    var input_num = $(this).attr('id');
    $(this).parent().remove();
    $('.sell-dropbox-items_tab').remove();
    document.getElementById('goods_image'+input_num).value = null
    $("label.sell-dropbox-uploader_container").attr('for','goods_image'+ input_num);
    $('.sell-dropbox-uploader').removeClass('hidden');
    i_count -= 1;
  });

// ドロップ
  var target = document.getElementById('drop');
  if (target) {
    target.addEventListener('dragover', function (e) {
      e.preventDefault();
      e.stopPropagation();
      e.dataTransfer.dropEffect = 'copy';
    });
    target.addEventListener('drop', function (e) {
      e.stopPropagation();
      e.preventDefault();
      document.getElementById('goods_image'+ i_count).files = e.dataTransfer.files;
    });
  };
});


