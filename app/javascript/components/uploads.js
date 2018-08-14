const VideoUploader = function () {
  $(".js-file-upload").on('change', function () {
  var file = this.files[0]

  $.getJSON('/signed_url?name=' + encodeURIComponent(file.name) + '&content_type=' + encodeURIComponent(file.type), function (data) {
    var xhr = createCORSRequest('PUT', data.signed_url)
    console.log(data.signed_url)

    xhr.onload = function () {
      if (xhr.status === 200) {
        console.log(xhr.response)
        alert('Upload Succesfull!')
            const videoPath = xhr.responseURL.split("?")[0];
            document.querySelector("#tutorial_file").value = videoPath
            document.querySelector(".btn").disabled = false;
      } else {
        alert('Upload failed')
      }
    }
    xhr.onerror = function () {
      alert('failure')
    }
    xhr.setRequestHeader('Content-Type', file.type)
    xhr.send(file)
  })
})


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
