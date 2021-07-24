$(document).on('click', '.btn-buy-now', function (e) {
    e.preventDefault();
    var parent = $(this).parents('.im1');
    var src = 'image/favicon2.ico';
    //var parLeft = parentt.offset().left;
    //var parTop=parentt.offset().top
    $('<img/>', {
        class: 'img-fly',
        src: src
    }).appendTo('body').css({
        //'top': parTop,
        // 'left':parLeft

    });
    console.log(parent.width());

});
