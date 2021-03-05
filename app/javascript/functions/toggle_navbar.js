const toggleNavbar = () => {

  if (document.querySelector(".navbar-toggle")) {

    const navbarBtn = document.querySelector(".navbar-toggle")
    const navbar = document.querySelector(".navbar-content")

    navbarBtn.addEventListener("click", (event) => {
      console.log(event);
      navbar.classList.toggle("navbar-hidden");
      navbar.style.display = "block";
    })

    navbar.addEventListener('click', (event) => {
      navbar.classList.add("navbar-hidden")
    })

  }

}

export { toggleNavbar };
