$(function () {

    $(".gdlr-core-item-list img").lazyload({effect: "fadeIn"});

    $('.akea-normal-menu').on('click', function () {
        let that = $(this)
        let hasChildren = that.hasClass('menu-item-has-children')
        if (!hasChildren) return
        that.addClass('sfHover')
        that.find('.sub-menu').css('display', 'block')
    })

    $('.sub-menu').on('mouseleave', function () {
        let that = $(this)
        let visible = that.is(':visible')
        if (!visible) return
        that.fadeOut(500);
    })

    $('.akea-mobile-menu-button').on('click', function () {
        $('.akea-overlay-menu-content').fadeIn()
    })

    $('.akea-mobile-menu-right').on('click', '.akea-no-preload', function () {
        let that = $(this)
        that.parents('.menu-item-has-children').children('.sub-menu').addClass('akea-activ')
        that.parents('.menu-item-has-children').children('.sub-menu').fadeIn()
    })
    $('.akea-mobile-menu-right').on('click', '.akea-overlay-menu-close', function () {
        let that = $(this)
        that.parents().find('.akea-overlay-menu-content').removeClass('akea-activ')
        that.parents().find('.akea-overlay-menu-content').fadeOut()
    })

})