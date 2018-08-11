import "bootstrap";
import { activateVideo } from "../components/videoPlayer";
import { startTimes } from "../components/videoPlayer";
import { renderSteps } from "../components/videoPlayer";
import { moveStep } from "../components/videoPlayer";
import { seekSteps } from "../components/videoPlayer";
import { activateButton } from "../components/collapse";

const videoPlayer = document.querySelectorAll('.video-js');
if (videoPlayer) {
  activateVideo();
  $('.collapse').collapse()
  activateButton();
}



