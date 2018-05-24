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

    // Add US Phone Validation
    jQuery.validator.addMethod('phoneUS', function (phone_number, element) {
        phone_number = phone_number.replace(/\s+/g, '');
        return this.optional(element) || phone_number.length > 9 &&
            phone_number.match(/^(1-?)?(\([2-9]\d{2}\)|[2-9]\d{2})-?[2-9]\d{2}-?\d{4}$/);
    }, 'Please enter a valid phone number.');

    // Add currency validation
    $.validator.addMethod("currency", function (value, element) {
        return this.optional(element) || /^\$?(\d{1,3}(\,\d{3})*|(\d+))(\.\d{2})?$/.test(value);
    }, "Please specify a valid amount");

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
            ctl00$ContentPlaceHolder1$BookedDate: {
                required: true
            },
            ctl00$ContentPlaceHolder1$StartTime: {
                required: true
            },
            ctl00$ContentPlaceHolder1$EndTime: {
                required: true
            },
            ctl00$ContentPlaceHolder1$Phone: {
                required: true,
                phoneUS: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$EventType: {
                required: true,
                maxlength: 10
            },
            ctl00$ContentPlaceHolder1$EventLocation: {
                required: true,
                maxlength: 50
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
            ctl00$ContentPlaceHolder1$BookedDate: {
                required: "Please select a date."
            },
            ctl00$ContentPlaceHolder1$StartTime: {
                required: "Please select a start time."
            },
            ctl00$ContentPlaceHolder1$EndTime: {
                required: "Please select an end time."
            },
            ctl00$ContentPlaceHolder1$Phone: {
                required: "Please enter a phone number.",
                phoneUS: "Please enter a valid phone number.",
                maxlength: "Phone number can not be longer than 50 characters.",
            },
            ctl00$ContentPlaceHolder1$EventType: {
                required: "Please enter an event.",
                maxlength: "Event can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$EventLocation: {
                required: "Please enter an event location.",
                maxlength: "Event location can not be longer than 50 characters."
            }
        }
    });


    //Validate AdminMaster forms
    $("#adminMasterForm").validate({
        rules: {
            ctl00$ContentPlaceHolder1$Email: {
                required: true,
                email: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$firstName: {
                required: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$lastName: {
                required: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$eventDate: {
                required: true
            },
            ctl00$ContentPlaceHolder1$StartTime: {
                required: true
            },
            ctl00$ContentPlaceHolder1$EndTime: {
                required: true
            },
            ctl00$ContentPlaceHolder1$eventPrice: {
                required: true,
                currency: true,
                maxlength: 50
            },
            ctl00$ContentPlaceHolder1$eventType: {
                required: true,
                maxlength: 10
            },
            ctl00$ContentPlaceHolder1$eventLocation: {
                required: true,
                maxlength: 50
            }
        },
        messages: {
            ctl00$ContentPlaceHolder1$Email: {
                required: "Please enter an email address.",
                email: "Please enter a <em>valid</em> email address.",
                maxlength: "Email can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$firstName: {
                required: "Please enter a first name.",
                maxlength: "First name can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$lastName: {
                required: "Please enter a last name.",
                maxlength: "Last name can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$eventDate: {
                required: "Please select a date."
            },
            ctl00$ContentPlaceHolder1$StartTime: {
                required: "Please select a start time."
            },
            ctl00$ContentPlaceHolder1$EndTime: {
                required: "Please select an end time."
            },
            ctl00$ContentPlaceHolder1$eventPrice: {
                required: "Please enter a price.",
                currency: "Please enter a valid price!",
                maxlength: "Phone number can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$eventType: {
                required: "Please enter an event.",
                maxlength: "Event can not be longer than 50 characters."
            },
            ctl00$ContentPlaceHolder1$eventLocation: {
                required: "Please enter an event location.",
                maxlength: "Event location can not be longer than 50 characters."
            }
        }
    });
});