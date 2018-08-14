const VideoUploader = function () {
  $(".js-file-upload").on('change', function () {
  var file = this.files[0]

  $.getJSON('/signed_url?name=' + encodeURIComponent(Math.floor((Math.random() * 99999999999) + 1  ).toString() + ".mp4") + '&content_type=' + encodeURIComponent(file.type), function (data) {
    var xhr = createCORSRequest('PUT', data.signed_url)
    document.querySelector(".progress").style.display = "block"
    xhr.onload = function () {
      if (xhr.status === 200) {
        alert('Upload Succesfull!')
            const videoPath = xhr.responseURL.split("?")[0];
            document.querySelector("#tutorial_file").value = videoPath
            document.querySelector(".btn").disabled = false;
      } else {
        alert('Upload failed, please try again!')
      }
    }
    xhr.onerror = function () {
      alert('Upload failed, please try again!')
    }
    xhr.upload.addEventListener("progress", updateProgress, false);
    xhr.setRequestHeader('Content-Type', file.type)
    xhr.send(file)
  })
})

function updateProgress (event) {
  let progress = event.loaded / event.total;
  let bar = $(".progress-bar")[0];
  bar.style.width = Math.round(progress * 100) + "%";
}

function createCORSRequest (method, url) {
  var xhr = new XMLHttpRequest()
  if ('withCredentials' in xhr) {
    xhr.open(method, url, true)
  } else if (typeof XDomainRequest !== 'undefined') {
    xhr = new XDomainRequest()
    xhr.open(method, url)
  } else {
    xhr = null
  }
  return xhr
}
};

export { VideoUploader };
