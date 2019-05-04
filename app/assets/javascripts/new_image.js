$(document).on('turbolinks:load', function() {
  var upload_image = $(".item-dropbox-items");
  function appendImage(image) {
    var html = `<li class='item-dropbox-items_container'>
                    <div class='item-dropbox-items-figure'>
                        <img class='itemimage' alt='商品画像' src='${image}' style=width:114px; >
                    </div>
                </li>`
    upload_image.append(html);
    ImageCount()
  }
});
