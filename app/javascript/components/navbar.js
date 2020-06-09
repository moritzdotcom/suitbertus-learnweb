hamburgerIcon = document.querySelector('.navbar-toggler');
hamburgerLines = document.querySelectorAll('.hamburger-line')

if(hamburgerIcon && hamburgerLines) {
  hamburgerIcon.addEventListener('click', e => {
    hamburgerLines.forEach((line) => {
      line.classList.toggle('clicked');
    });
  });
};
