const showReviewDiv = () => {
  const btn = document.getElementById('location-review');
  const newReviewDiv = document.getElementById('new-review');
  if (btn && newReviewDiv) {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      newReviewDiv.classList.remove('location-hide');
    })
  }
}

export { showReviewDiv };
