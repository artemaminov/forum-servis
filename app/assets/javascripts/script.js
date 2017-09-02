$(document).ready(function () {
    $('#carousel').carouFredSel({
        auto: {
            timeoutDuration: 8000
        },
        responsive: true,
        swipe: true
    });

    $('#offers-carousel').carouFredSel({
        auto: {
            timeoutDuration: 8000
        },
        responsive: true,
        width: "100%",
        align: "center",
        scroll: {
            items: 1
        },
        swipe: true,
        items: {
            visible: 1,
            height: 400
        }
    });

    $('.up').headroom({
        offset: 300,
        tolerance: 100,
        classes: {
            initial: "",
            pinned: "",
            unpinned: "",
            top: "fadeOutDown",
            notTop: "fadeInUp"
        }
    });

    $("[data-fancybox]").fancybox({
        loop: false,
        infobar: false,
        buttons: true,
        slideShow: false,
        fullScreen: false,
        thumbs: false,
        closeBtn: true,
        iframe: {
            scrolling: 'yes',
            // preload: false,
            css: {
                'width': '100%',
                'height': '100%',
                'margin': '0',
                'padding-top': '300px',
                'background-color': 'transparent'
            }
        },
        onComplete: function() {
            $('.carousel').toggleClass('on-top-of-hack');
            $('header, .header').toggleClass('on-top-of-fancybox');
        },
        beforeClose: function() {
            $('header, .header').toggleClass('on-top-of-fancybox');
            $('.carousel').toggleClass('on-top-of-hack');
        }
    });
});

function scrollTo(selector) {
    var margin;
    if (selector === '#top') {
        margin = 0;
    } else {
        margin = 20;
    }
    $('html, body').animate({ scrollTop: $(selector).offset().top + margin }, 'slow');
}
