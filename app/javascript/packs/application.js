import "bootstrap";
import { activateVideo } from "../components/videoPlayer";
import { startTimes } from "../components/videoPlayer";
import { renderSteps } from "../components/videoPlayer";
import { moveStep } from "../components/videoPlayer";
import { seekSteps } from "../components/videoPlayer";
import { typedjs} from "../components/typed";
import { activateButton } from "../components/collapse";
import { questionStep } from "../components/question_form";
import { answerQuestion } from "../components/answer_form";

const videoPlayer = document.querySelectorAll('.video-js');

if (videoPlayer.length != 0) {
  activateVideo();
  $('.collapse').collapse()
  activateButton();
};

typedjs()

const tutorialPage = document.querySelector('.tutorials.show');
if (tutorialPage) {
  questionStep();
};

const dashboard = document.querySelector('.users.dashboard');
if (dashboard) {
  answerQuestion();
};

