$(document).ready(function () {
    $('#carousel').carouFredSel({
        responsive: true
    });

    $(".up").headroom({
        // vertical offset in px before element is first unpinned
        offset : 600,
        // scroll tolerance in px before state changes
        tolerance : 100,
        // css classes to apply
        classes : {
            // when element is initialised
            initial : "",
            // when scrolling up
            pinned : "",
            // when scrolling down
            unpinned : "",
            // when above offset
            top : "fadeOutDown",
            // when below offset
            notTop : "fadeInUp"
        }
    });

});

function scrollTo(selector) {
    if (selector == '#top') {
        margin = 0
    } else {
        margin = 20
    }
    $('html, body').animate({ scrollTop:  $(selector).offset().top + margin }, 'slow');
}