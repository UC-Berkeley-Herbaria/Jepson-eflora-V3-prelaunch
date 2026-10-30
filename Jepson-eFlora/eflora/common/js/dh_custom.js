(function ($) {

  $(document).ready(function () {

    $(".togglebtn").click(function () {

      $(".horizMenu").toggleClass("main");

      $(this).toggleClass("active");

    });
  });

})(jQuery);

