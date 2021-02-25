const toggleInput = () => {
  const btn = document.getElementById("public-btn");
  if(btn) {
    btn.addEventListener("click", (event) => {
      const input = document.getElementById("invitation");
      input.classList.toggle("hidden");
    });
  }
}

export {toggleInput}