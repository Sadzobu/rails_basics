document.addEventListener('turbolinks:load', function () {
  var form = document.querySelector('.password_matching')
  if (form) {
    form.addEventListener('input', checkPasswords)
  }
})

function checkPasswords() {
  var password = document.getElementById('user_password').value
  var passwordConfirmation = document.getElementById('user_password_confirmation').value

  if (passwordConfirmation == '') {
    hideIcons()
  }

  if (password == passwordConfirmation) {
    passwordCorrectIcon()
  } else {
    passwordIncorrectIcon()
  }
}

function passwordCorrectIcon() {
  document.querySelector('.octicon-lock').classList.remove('hide')
  document.querySelector('.octicon-unlock').classList.add('hide')
}

function passwordIncorrectIcon() {
  document.querySelector('.octicon-lock').classList.add('hide')
  document.querySelector('.octicon-unlock').classList.remove('hide')
}

function hideIcons() {
  document.querySelector('.octicon-lock').classList.add('hide')
  document.querySelector('.octicon-unlock').classList.add('hide') 
}