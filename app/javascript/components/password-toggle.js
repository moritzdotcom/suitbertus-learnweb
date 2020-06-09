showButtons = document.querySelectorAll('.toggle-password');

if(showButtons) {
  showButtons.forEach(button => {
    button.addEventListener('mouseenter', e => {
      document.getElementById(button.dataset.toggle).type = 'text';
    });
    button.addEventListener('mouseleave', e => {
      document.getElementById(button.dataset.toggle).type = 'password';
    });
  });
};
