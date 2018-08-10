import "bootstrap";
import { activateVideo } from "../components/videoPlayer";
import { startTimes } from "../components/videoPlayer";
import { renderSteps } from "../components/videoPlayer";
import { moveStep } from "../components/videoPlayer";

const videoPlayer = document.querySelectorAll('.video-js');
if (videoPlayer) {
  //startTimes();
  activateVideo();
  //renderSteps();
}
