function showPlantFullImage(src) {

    var div = $('<div/>').addClass('modal fade').css('text-align', 'center').css('background-color', 'black');
    var img = $('<img/>').attr('src', src);
    div.append(img);

    div.modal();
}