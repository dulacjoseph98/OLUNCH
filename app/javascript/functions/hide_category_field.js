const hideInputField = () => {
  const btn = document.getElementById("baronoff");
  if (btn) {
    btn.addEventListener("click", () => {
      if (btn.checked) {
        document.querySelector('#categoryfield > .form-group').classList.add('hidecategoryinput');
      } else {
        document.querySelector('#categoryfield > .form-group').classList.remove('hidecategoryinput');
      }
    });
  }
}

export {hideInputField}
