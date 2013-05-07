$(function () {

    Members.init();
});

(function () {

    Members = new function () {

        var self = this;
        var regionsDivs;
        var logoImage;

        this.init = function () {

            regionsDivs = $('#member #regions');
            logoImage = $('#member-logo');

            self.initRegions();
            self.initLogo();
            self.initAddresses();
        };

        this.initRegions = function () {

            regionsDivs.find('select').change(function () {

                $(this).parents('.fields').find('input[id*=id]').val($(this).val());
            });

            regionsDivs.find('.remove-region-btn').click(function () {

                $(this).parent().remove();
            });
        };

        this.addRegion = function () {

            var regionsList = regionsDivs.find('.list');
            var lastRegion = regionsList.find('.region').last();
            var clonedLastRegion = lastRegion.clone(true);
            regionsList.append(clonedLastRegion);
        };

        this.initAddresses = function () {

            $(document).on("nested:fieldAdded", function () {

                var newAddressRow = $('#addresses .list .fields').last().find('.address');
                AddressDialog.showNew(newAddressRow);
            });
        };

        this.initLogo = function () {

            $('#member-logo-file').change(function () {

                var logoFile = $(this).get(0).files[0];
                uploadImage(logoFile, function (logo) {

                    logoImage.attr('src', logo.thumb_url);
                    logoImage.show();
                    $('#logo_id').val(logo.id);
                });
            });
        };
    };

})();