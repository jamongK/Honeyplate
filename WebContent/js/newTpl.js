$(window).on('load', function () {
    $('#preloader-active').delay(450).fadeOut('slow');
    $('body').delay(450).css({
        'overflow': 'visible'
    });
});

/* memberLoggedIn 받았을 때, 수정해서 작성하면 됨. 이건 그냥 템플릿 보기 위한 용도일 뿐 */
// 로그인/회원가입 버튼 보시려면 아래 코드 4줄 주석처리하시면 됩니다.
// if (true) {
//     $nav = $('#navigation');
//     $nav.html('<a href="#"><i class="fas fa-user-circle fa-3x account-icon"></i></a>').css('margin-top', '40px');
// }

function navigo() {
    const section = document.querySelector('section');
    const sectionheight = 200;
    document.addEventListener('scroll', onScroll, {
        passive: true
    });

    function onScroll() {
        const scrollposition = pageYOffset;
        const header = document.querySelector('header');
        if (sectionheight <= scrollposition) {
            header.classList.add('fix')
        } else {
            header.classList.remove('fix');
        }
    }
}

navigo();