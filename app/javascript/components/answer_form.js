const answerQuestion = function () {
  const buttons = document.querySelectorAll(".answer-button")
  buttons.forEach(function(element) {
    element.addEventListener("click", function(){
      let question_id = element.dataset.value;
      let question_form = document.querySelector("#new_answer");
      question_form.action = `/questions/${question_id}/answers` ;
    }
      );
  });
}

export { answerQuestion };



