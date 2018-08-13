import "bootstrap";
import { activateVideo } from "../components/videoPlayer";
import { startTimes } from "../components/videoPlayer";
import { renderSteps } from "../components/videoPlayer";
import { moveStep } from "../components/videoPlayer";
import { seekSteps } from "../components/videoPlayer";
import { typedjs} from "../components/typed";

const videoPlayer = document.querySelectorAll('.video-js');
if (videoPlayer.length != 0) {
  activateVideo();
}

typedjs()
