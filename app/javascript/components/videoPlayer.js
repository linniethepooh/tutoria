const activateVideo = function {
  videojs(document.querySelector('.video-js')).ready(function () {
    this.on('timeupdate', function () {
      console.log(this.currentTime());
      renderSteps();
    })
  });

}

const renderSteps = function {
  const player = videojs(document.querySelector('.video-js'))
  console.log(player.currentTime());
}
