$('#btnModal').click(function () {
    $('#imgLoader').show();
    $('#ddlBrand').empty();
    $('#ddlModel').empty();
    $('#ddlPetrolType').empty();
    $('#ddlTransmissionType').empty();
    $('#ddlBodyName').empty();
    $('#ddlCondition').empty();

    $.ajax({
        type: 'GET',
        url: '/Home/GetBrands',
        success: function (result) {
            //console.log(result);
            $('#ddlBrand').append("<option value='-1'>--Select Car--</option>");
            $('#ddlModel').append("<option value='-1'>--------------</option>");
            $('#ddlModel').prop("disabled", true);
            $.each(result, function (index, optiondata) {
                $('#ddlBrand').append("<option value='" + optiondata.Id + "'>" + optiondata.BrandName + "</option>");
            });
        }
    });

    $('#ddlBrand').change(function () {
        $('#imgLoader').show();
        $('#ddlModel').empty();
        var brandId = $(this).val();
        if (brandId == -1) {
            $('#ddlModel').append("<option value='-1'>--------------</option>");
            $('#ddlModel').prop("disabled", true);
        } else {
            $.ajax({
                type: 'POST',
                url: '/Home/GetMarks?id=' + brandId,
                success: function (result) {
                    //console.log(result);
                    $('#ddlModel').prop("disabled", false);
                    $('#ddlModel').append("<option value='-1'>--Select Model--</option>");
                    $.each(result, function (index, optiondata) {
                        $('#ddlModel').append("<option value='" + optiondata.Id + "'>" + optiondata.ModelName + "</option>");
                    });
                    $('#imgLoader').hide();
                }
            });
        }
    });

    $.ajax({
        type: 'GET',
        url: '/Home/GetPetrolType',
        success: function (result) {
            //console.log(result);
            $('#ddlPetrolType').append("<option value='-1'>--Chose petrol--</option>");
            $.each(result, function (index, optiondata) {
                $('#ddlPetrolType').append("<option value='" + optiondata.Id + "'>" + optiondata.PetrolName + "</option>");
            });
        }
    });

    $.ajax({
        type: 'GET',
        url: '/Home/GetTransmissionType',
        success: function (result) {
            //console.log(result);
            $('#ddlTransmissionType').append("<option value='-1'>--Chose transmission--</option>");
            $.each(result, function (index, optiondata) {
                $('#ddlTransmissionType').append("<option value='" + optiondata.Id + "'>" + optiondata.TransmissionName + "</option>");
            });
        }
    });

    $.ajax({
        type: 'GET',
        url: '/Home/GetBodyType',
        success: function (result) {
            //console.log(result);
            $('#ddlBodyName').append("<option value='-1'>--Chose body--</option>");
            $.each(result, function (index, optiondata) {
                $('#ddlBodyName').append("<option value='" + optiondata.Id + "'>" + optiondata.BodyName + "</option>");
            });
        }
    });

    $.ajax({
        type: 'GET',
        url: '/Home/GetCondition',
        success: function (result) {
            //console.log(result);
            $('#ddlCondition').append("<option value='-1'>--Chose technical condition--</option>");
            $.each(result, function (index, optiondata) {
                $('#ddlCondition').append("<option value='" + optiondata.Id + "'>" + optiondata.ConditionName + "</option>");
            });
            $('#imgLoader').hide();
        }
    });
});

$('#btnSubmit').click(function () {
    //var myFormData = $('#myForm').serialize();
    var carAdvert = {
        BrandId: $('select[name=BrandId]').val(),
        ModelId: $('select[name=ModelId]').val(),
        Price: $('input[name=Price]').val(),
        City: $('input[name=City]').val(),
        ProductYear: $('input[name=ProductYear]').val(),
        Distance: $('input[name=Distance]').val(),
        Capacity: $('input[name=Capacity]').val(),
        PetrolTypeId: $('select[name=PetrolTypeId]').val(),
        TransmissionTypeId: $('select[name=TransmissionTypeId]').val(),
        BodyId: $('select[name=BodyId]').val(),
        ConditionId: $('select[name=ConditionId]').val(),
        Description: $('textarea[name=Description]').val(),
        Email: $('input[name=Email]').val(),
        Phone: $('input[name=Phone]').val(),
        UserName: $('input[name=UserName]').val()
    };
    //console.log(carAdvert);
    carAdvert.imgList = [];
    $('#uploadedImage').children('img').each(function () {
        //console.log($(this).attr('src'));
        var imgPath = $(this).attr('src');
        carAdvert.imgList.push(imgPath);
    });
    //console.log(carAdvert);

    $.ajax({
        type: 'POST',
        data: carAdvert,
        url: '/Home/Insert',
        success: function (result) {
            $('#modalAlert').removeClass();
            $('#modalAlert').text('');
            //console.log(myFormData);
            //console.log(result);
            if (result.Success === true) {
                //console.log("success true from json");
                $('#modalAlert').addClass("alert alert-success");
                $('#modalAlert').show();
                $('#modalAlert').text(result.Message);
                setTimeout(function () {
                    $('#myModal').modal('hide');
                    $('#myForm').trigger('reset');
                    location.reload();
                }, 1000);
            }
            else if (result.Success === false) {
                $('#modalAlert').addClass("alert alert-danger");
                $('#modalAlert').text(result.Message);
                $('#modalAlert').show();
            }
        }
    });
});

$('#imgBrowes').change(function () {
    var file = this.files;

    if (file && file[0]) {
        ReadImage(file[0]);

    }
});

var ReadImage = function (file) {
    var reader = new FileReader;
    var image = new Image;

    reader.readAsDataURL(file);
    reader.onload = function (_file) {
        image.src = _file.target.result;
        image.onload = function () {
            var height = this.height;
            var width = this.width;
            var type = file.type;
            var size = ~~(file.size / 1024) + 'KB';

            $('#targetImg').attr('src', _file.target.result);
            $('#descriptionImg').text('Size: ' + size + ',  ' + height + 'X' + width + '');
            $('#imgPreview').show();
        }
    }
}

var ClearPreview = function () {
    $('#imgBrowes').val('');
    $('#descriptionImg').text('');
    $('#imgPreview').hide();
}

var UploadImage = function () {
    var file = $('#imgBrowes').get(0).files;
    var data = new FormData;
    data.append('imgFile', file[0]);
    $.ajax({
        type: 'POST',
        url: '/Home/UploadImage',
        data: data,
        contentType: false,
        processData: false,
        success: function (response) {
            $('#uploadedImage').show();
            $('#uploadedImage').append('<img src="' + response.Message + '" class="img-responsive thumbnail col-md-4" />');
        }
    });
}

$("input").focus(function () {
    $('#modalAlert').fadeOut(1000, function () {
        $('#modalAlert').text('');
        $('#modalAlert').removeClass();
    });
});

$("select")
    .change(function () {
        $("select option:selected").each(function () {
            $('#modalAlert').fadeOut(1000, function () {
                $('#modalAlert').text('');
                $('#modalAlert').removeClass();
            });
        });
    })
    .trigger("change");