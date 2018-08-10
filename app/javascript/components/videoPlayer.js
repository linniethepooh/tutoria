import videojs from "video.js";

const activateVideo = function () {
  videojs(document.querySelector('.video-js')).ready(function () {
    this.on('timeupdate', function () {
      renderSteps();
    })
  });

}

const startTimes = function () {
  const times = [];
  document.querySelectorAll(".step").forEach((step) => {
  times.push(step.dataset.time);
  });
  return times;
}

const renderSteps = function () {
  const player = videojs(document.querySelector('.video-js'))
  console.log(player.currentTime());
  const playerTime = player.currentTime();
  const times = startTimes();
  for (let i = 0; i < times.length; i++) {
    if (Math.round(playerTime) == times[i]) {
      console.log(`#step-${i+1}`);
      moveStep(`#step-${i+1}`);
      break;
    }
  }
}

const moveStep = function (step) {
  $('.steps-area').animate({
      scrollTop: $(step).parent().scrollTop() + $(step).offset().top - $(step).parent().offset().top
  }, {
      duration: 1000,
      specialEasing: {
          width: 'linear',
          height: 'easeOutBounce'
      },
      complete: function (e) {
        console.log("animation completed");
    }
  });
}

export { moveStep };
export { activateVideo };
export { startTimes };
export { renderSteps };
