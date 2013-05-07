$(function () {

    initMemberPriceSelects($('body'));
});

function initMemberPriceSelects(parent) {

    parent.find('.multiselect').multiselect({
        buttonClass: 'btn btn-link',
        buttonText: function (options, select) {

            var options = $('option[selected]', select);
            if (options.length == 0) {
                return 'Не выбран <b class="caret"></b>';
            }

            var selected = '';
            options.each(function () {
                selected += $(this).text().replace(' ', '') + '<br/>';
            });
            return selected.substr(0, selected.length - 2) + ' <b class="caret"></b>';
        },
        onChange: function (option, checked) {

            var plantPriceId = option.parents('.plant-price').find('.plant_price_id').val();
            var priceId = option.val();

            tooglePlantInPrice(plantPriceId, priceId)
        }
    });
}

function tooglePlantInPrice(plantPriceId, priceId) {

    if (plantPriceId == undefined || priceId == undefined)
        return;

    $.post('/profile/update_plant_price',
        {
            plant_price_id: plantPriceId,
            member_price_id: priceId
        },
        function (response) {

            console.log(response);
        });
}

function addNewPrice(newLink) {

    var sourceRow;
    if (newLink != undefined)
        sourceRow = $(newLink).parents('.plant-price');
    else
        sourceRow = $('#plants-price-list .plant-price').last();

    var row = sourceRow.clone(false);

    if (!newLink)
        row.find('input[type=text]').val('');
    row.show();

    row.insertAfter(sourceRow);
    initPlantPriceDialog(row, true);
}

function removePrice(removeLink) {

    var row = $(removeLink).parents('.plant-price');
    var plantPriceId = row.find('.plant_price_id').val();

    $.post('/profile/remove_plant_price', { plant_price_id: plantPriceId }, function (response) {

        console.log(response);
        row.remove();
    });
}

function initPlantPriceDialog(row, isNew) {

    var modal = row.find('#plant-price-info');
    modal.modal("show");

    initPlantField(modal.find('.plant'), modal.find('.plant_id'));

    modal.find('#cancel-btn').click(function () {

        modal.modal("hide");
        if (isNew)
            row.remove();
    });
    modal.find('#save-btn').click(function () {

        var plantPrice = {

            plant_id: modal.find('.plant_id').val(),
            packing: modal.find('.packing').val(),
            size: modal.find('.size').val(),
            count: modal.find('.count').val(),
            price: modal.find('.price').val(),
            note: modal.find('.note').val()
        };

        row.find('.plant-name').text(modal.find('.plant').val());
        row.find('.packing').text(plantPrice.packing);
        row.find('.size').text(plantPrice.size);
        row.find('.count').text(plantPrice.count);
        row.find('.price').text(plantPrice.price);
        row.find('.note').text(plantPrice.note);

        var memberPriceSelect = row.find('.price-select');
        row.find('.prices >').not('.price-select').remove();
        row.find('.price-select').removeData('multiselect');
        row.find('.price-select').removeData('blockRefresh');
        initMemberPriceSelects(row);
        row.find('.price-select').multiselect('refresh');
        $('option', memberPriceSelect).each(function (element) {
            memberPriceSelect.multiselect('deselect', $(this).val());
        });
        memberPriceSelect.multiselect('select', $('#member_price_id').val());

        modal.modal("hide");
        row.show();

        $.post('/profile/update_plant_price', { plant_price: plantPrice}, function (response) {

            console.log(response);
            row.find('.plant_price_id').val(response.plant_price_id);

            tooglePlantInPrice(response.plant_price_id, $('#member_price_id').val());
        });
    });
}

function initPlantField(plantField, plantIdField) {

    plantField.typeahead({

        property: 'name',

        updater: function (item) {
            var selectedId = plantsMap[item];
            plantIdField.val(selectedId);
            return item
        },

        source: function (query, process) {

            return $.ajax({
                url: '/plants.json',
                type: 'get',
                dataType: 'json',
                data: {  },
                success: function (json) {

                    console.log(json);

                    plantsMap = {};

                    var parents = $.map(json, function (data) {

                        plantsMap[data.name] = data.id;

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

function addImagesForPlantPrice(link, plantPriceId) {


}