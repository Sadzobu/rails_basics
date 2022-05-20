document.addEventListener('turbolinks:load', function () {
  const timer = document.querySelector('.timer')

  if (timer) { 
    createTimer(timer) 
  }

})

function createTimer(timer) {
  const duration = timeLeft(timer.dataset.deadline)

  if (duration) {
    timer.classList.remove('hide')
    setInterval(updateTimer, 1000, timer)
  }
}

function updateTimer(timer) {
    const display = document.querySelector('.time_left')
    const duration = timeLeft(timer.dataset.deadline)

    if (duration <= 0) {
      document.querySelector('.btn').click()
    }
    else {
      display.innerHTML = displayTimeLeft(duration)
    }
}

function timeLeft(deadline) {
  var now = new Date()
  var deadline = new Date(deadline)
  var timeLeftInSeconds = (deadline.getTime() - now.getTime()) / 1000
  return Math.round(timeLeftInSeconds)
}

function displayTimeLeft(duration) {
  var hours = Math.floor(duration / 3600)
  duration %= 3600
  var minutes = Math.floor(duration / 60)
  var seconds = duration % 60
  return hours + ":" + minutes + ":" + seconds
}
