$(function () {

    new LazyLoad();

    $('.menu_li_a').hover(function () {
            $(this).parents('.menu_li').find('.sub-menu').show()
        }
    )

    $('.sub-menu').on('mouseleave', '', function () {
            $(this).hide()
        }
    )

    $("#top_to").hide();
    $(window).scroll(function () {
        if ($(this).scrollTop() > 200) {
            $("#top_to").fadeIn(100)
        } else {
            $("#top_to").fadeOut(200)
        }
    });
    $("#top_to").click(function () {
        $("body,html").animate({scrollTop: 0}, 400);
        return false
    })

    let mySwiper = new Swiper('.swiper', {
        loop: true, autoplay: true,
        lazy: {
            loadPrevNext: true,
        },
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
    })
})