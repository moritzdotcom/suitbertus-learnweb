const commentContent = document.getElementById('comment_content');
const submitButton = document.querySelector('#submit-button');

if(commentContent && submitButton) {
  commentContent.addEventListener('keyup', e => {
    if(commentContent.value.length >= 2) {
      submitButton.disabled = false
    } else {
      submitButton.disabled = true
    }
  });
}
