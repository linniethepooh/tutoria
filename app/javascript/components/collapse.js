const activateButton = function () {
  const links = document.querySelectorAll(".dropdown-item")
  links.forEach((link) => {
    link.addEventListener("click", switchSteps);
  });
}

const switchSteps = function (event) {
  document.querySelectorAll(".cardstep").forEach((step) => {
    step.style.display = "none";
  })
  document.getElementById(event.target.dataset.step).style.display = "block";
}

export { activateButton };
