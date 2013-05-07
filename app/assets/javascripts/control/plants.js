$(function () {

    $('#plant_plant_type').change(function () {

        var type = $(this).val();
        $.getJSON('/control/plants.json', { filter: { type_id: type } }, function (plants) {

            console.log(plants);
            var plantsSelect = $('#plant_plant_id');
            plantsSelect.find('option').remove();
            for (var i = 0; i < plants.length; i++) {

                var option = $('<option/>').attr('value', plants[i].id).text(plants[i].name);
                plantsSelect.append(option);
            }
        });
    });

    // Uploading images.
    $('#plant-image-file').change(function () {

        uploadPlantImages($(this));
    });

    $('#plant_genu_id').change(function () {

        $('#parent-plant').val('');
        $('#plant_plant_id').val('');

    });

    loadImagesForPlant();
    initParentsField();
    initGenuField();
});

function initParentsField() {

    var plantParent = $('#parent-plant');
    plantParent.typeahead({

        property: 'name',

        updater: function (item) {
            var selectedParentId = plantParentsMap[item];
            $('#plant_plant_id').val(selectedParentId);
            return item
        },

        source: function (query, process) {

            var genuId = $('#plant_genu_id').val();
            if (genuId == undefined || genuId.length == 0)
                return;

            return $.ajax({
                url: '/control/plants.json',
                type: 'get',
                dataType: 'json',
                data: { genu_id: genuId },
                success: function (json) {

                    console.log(json);

                    plantParentsMap = {};

                    var parents = $.map(json, function (data) {

                        plantParentsMap[data.name] = data.id;

                        return {
                            id: data.id,
                            name: data.name,

                            toString: function () {
                                return this.name;
                            },
                            toLowerCase: function () {
                                return this.name.toLowerCase();
                            },
                            indexOf: function (string) {
                                return String.prototype.indexOf.apply(this.name, arguments);
                            },
                            replace: function (string) {
                                return String.prototype.replace.apply(this.name, arguments);
                            }
                        };
                    });
                    console.log(parents);
                    return process(parents);
                }
            });
        },

        matcher: function (item) {
            return true;
        }
    });
}

function initGenuField() {

    var plantGenu = $('#genu');
    plantGenu.typeahead({

        property: 'name',
        updater: function (item) {
            var selectedParentId = plantGenusMap[item];
            $('#plant_genu_id').val(selectedParentId);
            return item
        },

        source: function (query, process) {

            var categoryId = $('.plant_category_id').val();
            if (categoryId == undefined || categoryId.length == 0)
                return;

            return $.ajax({
                url: '/control/genus.json',
                data: { category_id: categoryId },
                type: 'get',
                dataType: 'json',
                success: function (json) {

                    console.log(json);

                    plantGenusMap = {};

                    var parents = $.map(json, function (data) {

                        plantGenusMap[data.name] = data.id;

                        return {
                            id: data.id,
                            name: data.name,

                            toString: function () {
                                return this.name;
                            },
                            toLowerCase: function () {
                                return this.name.toLowerCase();
                            },
                            indexOf: function (string) {
                                return String.prototype.indexOf.apply(this.name, arguments);
                            },
                            replace: function (string) {
                                return String.prototype.replace.apply(this.name, arguments);
                            }
                        };
                    });
                    console.log(parents);
                    return process(parents);
                }
            });
        },

        matcher: function (item) {
            return true;
        }
    });
}

function uploadPlantImages(fileInput) {

    $('#progress-dialog').modal();

    var countOfUploadedFiles = 0;
    var files = $(fileInput).get(0).files;
    $.each(files, function (index, file) {

        uploadImage(file, function (image) {

            addImageToPlant(image);

            countOfUploadedFiles++;
            var progress = parseFloat(countOfUploadedFiles) / files.length * 100;
            progress += '%';
            $('#progress-bar .bar').css('width', progress);

            if (countOfUploadedFiles == files.length)
                $('#progress-dialog').modal('hide');
        }, function () {

            countOfUploadedFiles++;
            if (files.length == 1)
                $('#progress-dialog').modal('hide');
        });
    });
}

function loadImagesForPlant() {

    var plantId = $('#plant_id').val();
    loadImages(plantId, function (images) {

        $.each(images, function (index, image) {

            addImageToPlant(image);
        });
    });
}

function addImageToPlant(image) {

    var container = $('#images-container');
    var imageContainer = $('<div/>').addClass('photo-container');

    var img = $('<img/>').addClass('photo');
    img.attr('src', image.thumb_url);
    imageContainer.append(img);

    // Full image, appears on click preview in modal dialog.
    var fullImageDivId = 'full-image-' + image.id;
    var fullImageDivIdSelector = '#' + fullImageDivId;
    var fullImageDiv = $('<div/>').attr('id', fullImageDivId).addClass('full-photo modal fade');
    fullImageDiv.append($('<img>').attr('src', image.medium_url));
    imageContainer.append(fullImageDiv);

    // Handle click on image for showing full image.
    img.click(function () {

        $(fullImageDivIdSelector).modal();
    });

    // Modal, delete image button.
    var deleteButton = $('<a/>').addClass('btn btn-danger').text('Удалить');
    deleteButton.click(function () {

        $(fullImageDivIdSelector).modal('hide');
        removeImage(image.id, function () {
            imageContainer.remove();
        });
    });

    // Modal, close button.
    var cancelButton = $('<a/>').addClass('btn').text('Закрыть');
    cancelButton.click(function () {

        $(fullImageDivIdSelector).modal('hide');
    });

    fullImageDiv.append($('<div/>').append(deleteButton).append(cancelButton));

    // Add image_id for sending to server when plant creating/updating.
    $('<input type="hidden"/>')
        .attr('id', 'image_id')
        .attr('name', 'images[' + image.id + ']')
        .val(image.id)
        .appendTo(imageContainer);

    container.append(imageContainer);
}