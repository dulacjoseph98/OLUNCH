const animAv = () => {
  const av = document.getElementById("loading");
  console.log(av)
  if(av) {
    av.addEventListener("click", event => {
      av.classList.toggle("loading");
    })
  }
}

export {animAv};