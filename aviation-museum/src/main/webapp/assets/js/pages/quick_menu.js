$(document).ready(function () {
  var currentPosition = parseInt($('.quick_menu').css('top'))
  $(window).scroll(function () {
    var position = $(window).scrollTop()
    $('.quick_menu')
      .stop()
      .animate({ 'top': position + currentPosition + 'px' }, 1000)
  })
})
