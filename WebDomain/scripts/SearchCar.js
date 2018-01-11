var Search = function () {
    var search = $('#searchBox').val();
    if (search.length > 0) {
        $.ajax({
            type: 'POST',
            url: '/Home/SearchCar?search=' + search,
            success: function (result) {
                $('#carList').empty();
                $.each(result, function (index, optionData) {
                    if (optionData.HeaderPicture === '' || optionData.HeaderPicture == null) {
                        var img = "<img class=\"img-responsive\" src=\"Images/default-display-image-car.png\" alt=\"\" >";
                    }
                    else {
                        var img = "<img class=\"img-responsive\" src=\"" + optionData.HeaderPicture + "\" alt=\"\">";
                    }

                    $('#carList').append("<a href=\"/Home/Details/" + optionData.CarId + " \" "+
                        "<li><div class=\"row\" style=\"margin-top: 25px; box-shadow: 0 3px 30px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)\">" +
                        "<div class=\"col-md-3\" style=\"padding-left: 0; padding-right: 0\">" + img + "</div><div class=\"col-md-9\"><div class=\"row\"><div class=\"col-md-9\">" +
                        "<h3>" + optionData.Brand + " " + optionData.Model + "</h3></div><div class=\"col-md-3\" style=\"text-align: right\"><h3><strong>" + optionData.Price +
                        "</strong> <small>zł</small> </h3></div></div><div class=\"row\"><div class=\"col-md-9\"><ul class=\"list-inline\" style=\"font-size: 16px\">" +
                        "<li>" + optionData.ProductYear + "</li><li>" + optionData.Distance + " km</li><li>" + optionData.Capacity + " cm3</li><li>" + optionData.PetrolType +
                        "</li></ul></div><div class=\"col-md-3\" style=\"text-align: right; vertical-align: bottom\"><br /><br /><br /><br /><h4>" +
                        "<span class=\"glyphicon glyphicon-map-marker\"></span>" + optionData.City + "</h4></div></div></div></div></li></a>");
                });
            }
        });
    }
};
