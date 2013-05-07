function showOnMap(owner) {

    var memberDiv = $(owner).parents('.member').first();
    var memberId = memberDiv.find('#id').val();

    $.get('/members/' + memberId + '?modal=true', function (response) {

        memberDiv.find('#details #details-content').html(response);
        memberDiv.find('#details .modal').modal();
    });
}