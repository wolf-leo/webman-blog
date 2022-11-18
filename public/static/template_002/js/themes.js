Config = {
    dark: 'true',
}
if (Config.dark === 'true') {
    function switchNightMode() {
        var night = document.cookie.replace(/(?:(?:^|.*;\s*)night\s*\=\s*([^;]*).*$)|^.*$/, "$1") || "0";
        if (night == "0") {
            document.body.classList.add("nice-dark-mode");
            document.cookie = "night=1;path=/";
            $('.logo-dark').removeClass('d-none')
            $('.logo-dark').addClass('d-inline-block')
            $('.logo-light').removeClass('d-inline-block')
            $('.logo-light').addClass('d-none')
        } else {
            document.body.classList.remove("nice-dark-mode");
            document.cookie = "night=0;path=/";
            $('.logo-dark').removeClass('d-inline-block')
            $('.logo-dark').addClass('d-none')
            $('.logo-light').removeClass('d-none')
            $('.logo-light').addClass('d-inline-block')
        }
    }

    (function () {
        if (document.cookie.replace(/(?:(?:^|.*;\s*)night\s*\=\s*([^;]*).*$)|^.*$/, "$1") === "") {
            if (new Date().getHours() > 21 || new Date().getHours() < 6) {
                document.body.classList.add("nice-dark-mode");
                document.cookie = "night=1;path=/";
                $('.logo-dark').removeClass('d-none')
                $('.logo-dark').addClass('d-inline-block')
                $('.logo-light').removeClass('d-inline-block')
                $('.logo-light').addClass('d-none')
            } else {
                document.body.classList.remove("nice-dark-mode");
                document.cookie = "night=0;path=/";
                $('.logo-dark').removeClass('d-inline-block')
                $('.logo-dark').addClass('d-none')
                $('.logo-light').removeClass('d-none')
                $('.logo-light').addClass('d-inline-block')
            }
        } else {
            var night = document.cookie.replace(/(?:(?:^|.*;\s*)night\s*\=\s*([^;]*).*$)|^.*$/, "$1") || "0";
            if (night == "0") {
                document.body.classList.remove("nice-dark-mode")
                $('.logo-dark').removeClass('d-inline-block')
                $('.logo-dark').addClass('d-none')
                $('.logo-light').removeClass('d-none')
                $('.logo-light').addClass('d-inline-block')
            } else {
                if (night == "1") {
                    document.body.classList.add("nice-dark-mode")
                    $('.logo-dark').removeClass('d-none')
                    $('.logo-dark').addClass('d-inline-block')
                    $('.logo-light').removeClass('d-inline-block')
                    $('.logo-light').addClass('d-none')
                }
            }
        }
    })();
}

function mobileShow() {
    $('.mobile_menu').toggleClass('open');
    $('.sap_mask').toggleClass('sap_open');
}
