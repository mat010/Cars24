$('#ddlBrand').change(function () {
    $('#imgLoader').show();
    $('#ddlModel').empty();
    var brandId = $(this).val();
    //console.log(brandId);
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
    var myFormData = $('#myForm').serialize();
    $.ajax({
        type: 'POST',
        data: myFormData,
        url: '/Home/Insert',
        success: function (result) {
            //console.log(myFormData);
            //console.log(result);
            if (result.Success === true) {
                //console.log("success true from json");
                $('#myModal').modal('hide');
                $('#myForm').trigger('reset');
                location.reload();
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
    //data.append('ProductName', 'Samsung');
    $.ajax({
        type: 'POST',
        url: '/Home/UploadImage',
        data: data,
        contentType: false,
        processData: false,
        success: function (response) {
            $('#uploadedImage').show();
            $('#uploadedImage').append('<img src="' + response.Message + '" class="img-responsive thumbnail" />');
        }
    })
}