function loadImages(ownerId, callBack) {

    if(ownerId == undefined)
        return;
    $.getJSON('/images.json', { owner_id: ownerId }, function (images) {

        console.log(images);
        if (callBack != undefined)
            callBack(images);
    });
}

function uploadImage(file, callBack, errorCallBack) {

    var fd = new FormData();
    fd.append("image", file);

    $.ajax({
        url: '/images.json',
        type: 'POST',
        data: fd,

        cache: false,
        processData: false,
        contentType: false,

        success: function (image) {

            console.log(image);
            if (callBack != undefined)
                callBack(image);
        },
        error: function () {

            if(errorCallBack != undefined)
                errorCallBack();
        }
    });
}

function removeImage(imageId, callBack) {

    $.ajax({
        url: '/images/' + imageId + '.json',
        type: 'DELETE',

        success: function (result) {

            if (callBack != undefined)
                callBack(result);
        },
        error: function () {

        }
    });
}