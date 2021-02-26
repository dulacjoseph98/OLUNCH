const showReviewDiv = () => {
  const btn = document.getElementById('location-review');
  const newReviewDiv = document.getElementById('new-review');
  console.log(btn);
  btn.addEventListener('click', (event) => {
    event.preventDefault();
    newReviewDiv.classList.remove('location-hide');
  })
}

export { showReviewDiv };
