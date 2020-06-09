fileUpload = document.querySelector('.file-upload input')

if(fileUpload) {
  fileUpload.addEventListener('input', () => {
    if(fileUpload.files.length == 1) {
      document.getElementById('pdf-file-uploaded-error').innerText = ''
      document.getElementById('pdf-file-uploaded').innerText = fileUpload.files[0].name
      if(fileUpload.files[0].type == 'application/pdf') {
        document.querySelector('#submit').disabled = false
      } else {
        document.getElementById('pdf-file-uploaded-error').innerText = ' Bitte lade eine PDF Datei hoch'
        document.querySelector('#submit').disabled = true
      }
    }
  });

  document.getElementById('exam_pdf_file').style.display = 'none'
};
