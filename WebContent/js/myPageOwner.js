$(function() {

    $("#show-update").click(function (){
        $(".showbox").hide();
        $(".myinfo-update").show();
    });

    $("#show-password").click(function (){
        $(".showbox").hide();
        $(".password-update").show();
    });

    $("#show-reservation").click(function (){
        $(".showbox").hide();
        $(".reservation-table").show();
    });

    $("#show-review").click(function (){
        $(".showbox").hide();
        $(".review-list").show();
        
    });

    $("#show-bookmark").click(function (){
        $(".showbox").hide();
        $(".bookmark-list").show();
        
    });

    $("#show-withdrawal").click(function (){
        $(".showbox").hide();
        $(".withdrawal").show();
    });
})