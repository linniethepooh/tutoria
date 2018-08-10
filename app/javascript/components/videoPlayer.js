import videojs from "video.js";

const activateVideo = function () {
  videojs(document.querySelector('.video-js')).ready(function () {
    this.on('timeupdate', function () {
      renderSteps();
    })
    this.on('seeking', function () {
      seekSteps();
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
  const playerTime = player.currentTime();
  const times = startTimes();
  for (let i = 0; i < times.length; i++) {
    if (Math.round(playerTime) == times[i]) {
      moveStep(`#step-${i+1}`);
      break;
    }
  }
}

const seekSteps = function () {
  const player = videojs(document.querySelector('.video-js'))
  const playerTime = player.currentTime();
  const times = startTimes();
  for (let i = 0; i < times.length; i++) {
    if (Math.round(playerTime) < times[i]) {
      moveStep(`#step-${i}`);
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
    }
  });
}

export { moveStep };
export { activateVideo };
export { startTimes };
export { renderSteps };
export { seeksteps };
