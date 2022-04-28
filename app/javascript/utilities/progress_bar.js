document.addEventListener('turbolinks:load', function() {
	const progressBar = document.querySelector('.progress-bar')

	if (progressBar) {
		updateProgressBar(progressBar)	
	}
})

function updateProgressBar(progressBar) {

	progressBar.style.width = progressBar.dataset.progress + "%"
	progressBar.innerText = progressBar.dataset.progress + "%"
}