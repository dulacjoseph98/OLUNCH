const hideInputField = () => {
  const btn = document.getElementById("baronoff");
  if (btn) {
    btn.addEventListener("click", () => {
      document.querySelector('#categoryfield').classList.toggle('hidecategoryinput');
    });
  }
}

export {hideInputField}
