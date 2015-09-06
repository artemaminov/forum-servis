$(document).ready(function () {
    $('#carousel').carouFredSel({
        auto: {
            timeoutDuration: 8000
        },
        responsive: true
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
});

function scrollTo(selector) {
    if (selector == '#top') {
        margin = 0
    } else {
        margin = 20
    }
    $('html, body').animate({ scrollTop: $(selector).offset().top + margin }, 'slow');
}