import "bootstrap";
import './application.css';
import { activateVideo } from "../components/videoPlayer";
import { startTimes } from "../components/videoPlayer";
import { renderSteps } from "../components/videoPlayer";
import { moveStep } from "../components/videoPlayer";
import { seekSteps } from "../components/videoPlayer";
import { playback } from "../components/videoPlayer";
import { typedjs} from "../components/typed";
import { activateButton } from "../components/collapse";
import { questionStep } from "../components/question_form";
import { answerQuestion } from "../components/answer_form";
import { activateParticles} from "../components/particles";
import { VideoUploader } from "../components/uploads";
import { setLoopMode } from "../components/videoPlayer";
import { checkScroll } from "../components/videoPlayer";
import { homepageScroll } from "../components/homepage";

const videoPlayer = document.querySelectorAll('.video-js');

if (videoPlayer.length != 0) {
  activateVideo();
  $('.collapse').collapse()
  activateButton();
};

const tutorialPage = document.querySelector('.tutorials.show');
if (tutorialPage) {
  questionStep();
  playback();
  setLoopMode();
  checkScroll();
};

const dashboard = document.querySelector('.users.dashboard');
if (dashboard) {
  answerQuestion();
};

const home = document.querySelector('.home');
if (home) {
  typedjs();
  homepageScroll();
}

const upload = document.querySelector('.tutorials.new');
if (upload) {
  VideoUploader();
}
