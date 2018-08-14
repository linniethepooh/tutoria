import videojs from "video.js";

let loopMode = false;
let stepTimes = [];
let scroll = true;

const activateVideo = function () {
  videojs(document.querySelector('.video-js')).ready(function () {
    this.on('timeupdate', function () {
      renderSteps();
      checkScroll();
      if (loopMode == true) {
        scroll = false;
        const player = videojs(document.querySelector('.video-js'))
        const playerTime = player.currentTime();
        loop(playerTime, stepTimes);
      }
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
    if (Math.round(playerTime) == times[i + 1]) {
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
  if (scroll == true) {
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
}

const playback = function () {
  const player = videojs(document.querySelector('.video-js'));
  const buttons = document.querySelectorAll(".video-playback");
  buttons.forEach((element) => {
    element.addEventListener("click", function() {
      loopMode = false;
      const stepTime = element.dataset.value;
      player.currentTime(stepTime);
      player.play();
    });
  });
}

const setLoopMode = function () {
  const player2 = videojs(document.querySelector('.video-js'));
  const buttons = document.querySelectorAll(".video-loop");
  buttons.forEach(element => {
    element.addEventListener("click", function() {
      let endTime = player2.duration();
      if (element.dataset.end != "end") {
        endTime = parseInt(element.dataset.end);
      };
      stepTimes = [parseInt(element.dataset.start), endTime];
      const startTime = stepTimes[0];
      const player = videojs(document.querySelector('.video-js'))
      player.currentTime(startTime);
      player.play();
      scroll = false;
      loopMode = true;
    });
  })
}

const loop = function (currentTime, stepTimes) {
  const startingTime = stepTimes[0];
  const endTime = stepTimes[1];
  const playeralt = videojs(document.querySelector('.video-js'));
    if (currentTime > endTime ) {
      playeralt.currentTime(startingTime);
      playeralt.play();
    }
  }

const checkScroll = function () {
  const scrollBox = document.querySelector("#defaultCheck1");
  if (scrollBox.checked == false) {
    scroll = false;
  } else {
    scroll = true;
  }
}



export { moveStep };
export { activateVideo };
export { startTimes };
export { renderSteps };
export { seeksteps };
export { playback };
export { setLoopMode };
export { checkScroll };
