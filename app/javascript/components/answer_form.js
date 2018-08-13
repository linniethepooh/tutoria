const answerQuestion = function () {
  const buttons = document.querySelectorAll(".answer-button")
  buttons.forEach(function(element) {
    element.addEventListener("click", function(){
      let questionId = element.dataset.value;
      let questionForm = document.querySelector("#new_answer");
      questionForm.action = `/questions/${questionId}/answers` ;
      const questionHeader = document.querySelector("#modal-question");
      const questionHeaderData = element.dataset.question;
      questionHeader.innerHTML = questionHeaderData;
    }
      );
  });
}

export { answerQuestion };



