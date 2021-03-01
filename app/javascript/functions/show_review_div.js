const showReviewDiv = () => {
  const btn = document.getElementById('location-review');
  const newReviewDiv = document.getElementById('new-review');
  const show = document.querySelector('.show')

  if (btn && newReviewDiv) {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      newReviewDiv.classList.remove('location-hide');
    })
  }

  if (show) {
    show.addEventListener('click', () => {
      newReviewDiv.classList.add('location-hide');
    })
  }

}

export { showReviewDiv };
