$(function () {

    $.validator.setDefaults({
        errorClass: 'help-block',
        highlight: function (element) {
            $(element)
            .closest('.form-group')
            .addClass('has-error');
        },
        unhighlight: function (element) {
            $(element)
            .closest('.form-group')
                .removeClass('has-error')
        }
    });

    $.validator.addMethod('phoneNum', function (value, element) {
        isPhone = (this.optional(element) || /^\d+$/.test(value)) && this.getLength($.trim(value), element) <= 12 && this.getLength($.trim(value), element) >= 11;

        return isPhone;

    }, "Please enter either phone or e-mail");


    $("#masterForm").validate({
        rules: {
            ctl00$ContentPlaceHolder1$Email: {
                required: true,
                email: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$FirstName: {
                required: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$LastName: {
                required: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$Phone: {
                required: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$EventType: {
                required: true,
                maxLength: 50
            },
            ctl00$ContentPlaceHolder1$EventLocation: {
                required: true,
                maxLength: 50
            }
        },
        messages: {
            ctl00$ContentPlaceHolder1$Email: {
                required: "Please enter an email address.",
                email: "Please enter a <em>valid</em> email address.",
                maxlength: "Email can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$FirstName: {
                required: "Please enter a first name.",
                maxlength: "First name can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$LastName: {
                required: "Please enter a last name.",
                maxlength: "Last name can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$Phone: {
                required: "Please enter a phone number.",
                maxlength: "Phone number can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$EventType: {
                required: "Please enter an event type.",
                maxlength: "Event type can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$EventLocation: {
                required: "Please enter an event location.",
                maxlength: "Event location can not be longer than 50 characters."
            }
        }
    });
});