const questionStep = function () {
  const buttons = document.querySelectorAll(".tutorial-question-button")
  buttons.forEach(function(element) {
    element.addEventListener("click", function(){
      let step_num = element.dataset.value;
      let question_form = document.querySelector("#new_question");
      question_form.action = `/step/${step_num}/questions` ;
    }
      );
  });
}

export { questionStep };



