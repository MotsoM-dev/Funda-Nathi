jQuery.noConflict();
(function ($) {
    $(document).ready(function () {
        var $slider = $('.auth-slider');
        var $switchLinks = $('.auth-switch');

        $switchLinks.on('click', function (e) {
            e.preventDefault();
            var targetForm = $(this).data('target');
            $slider.removeClass('login signup forgot');

            if (targetForm === 'login-form') {
                $slider.addClass('login');
            } else if (targetForm === 'signup-form') {
                $slider.addClass('signup');
            } else if (targetForm === 'forgot-form') {
                $slider.addClass('forgot');
            }

            var action = targetForm === 'login-form' ? 'login' :
                targetForm === 'signup-form' ? 'signup' : 'forgot';
            history.pushState(null, '', '?action=' + action);
        });

        var urlParams = new URLSearchParams(window.location.search);
        var action = urlParams.get('action')?.toLowerCase();
        if (action === 'signup') {
            $slider.removeClass('login forgot').addClass('signup');
        } else if (action === 'forgot') {
            $slider.removeClass('login signup').addClass('forgot');
        } else {
            $slider.addClass('login');
        }
    });
})(jQuery);