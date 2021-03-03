const hideInputField = () => {
  const btn = document.getElementById("baronoff");
  if (btn) {
    btn.addEventListener("click", () => {
      if (btn.checked) {
        document.querySelector('#categoryfield').classList.add('hidecategoryinput');
      } else {
        document.querySelector('#categoryfield').classList.remove('hidecategoryinput');
      }
    });
  }
}

export {hideInputField}
