function loadRegions(countrySelect, regionsSelectId) {

    var countryId = $(countrySelect).val();
    var url = '/control/regions.json?country_id=' + countryId;
    $.getJSON(url, function (regions) {

        var regionsDropDown = null;

        if(regionsSelectId == undefined)
            regionsDropDown = $(countrySelect).parents('.region').find('.regions-select');
        else
            regionsDropDown = $(regionsSelectId);

        regionsDropDown.find('option').remove();
        $.each(regions, function (index, region) {
            regionsDropDown.append($(new Option(region.name, region.id)));
        });
    });
}