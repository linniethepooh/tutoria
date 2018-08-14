import Typed from 'typed.js';

const typedjs = () => {
 let element = document.querySelector(".element")
  if (element != null) {
    var options = {
    strings: ["Instructions for the digitial age", "Instructions for the digitial age..."],
    typeSpeed: 75,
    loop: false,
    showCursor: false,

    }

    var typed = new Typed(element, options);
  }
}

export {typedjs}
