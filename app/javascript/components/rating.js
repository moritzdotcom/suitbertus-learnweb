rating = document.getElementById('rating_rating');

if(rating) {
  if(rating.value) {
    document.getElementById(`star-${rating.value}`).classList.add('checked');
  }
}

$(document).ready(function(){
  // Check Radio-box
  $(".teacher-rating-inputs input:radio").attr("checked", false);

  $('.teacher-rating-inputs input').click(function () {
    $(".teacher-rating-inputs span").removeClass('checked');
    $(this).parent().addClass('checked');
  });

  $('input:radio').change(
    function(){
      $('#rating_rating').val(Number(this.value));
  });
});
