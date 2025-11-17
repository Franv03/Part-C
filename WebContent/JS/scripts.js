function openPopup(id) {
	OmegaPezza = id;
	console.log(OmegaPezza);
	const popupOverlay = document.getElementById('popupOverlay');
	popupOverlay.style.display = 'block';
}

function closePopupFunc() {
	const popupOverlay = document.getElementById('popupOverlay');
	popupOverlay.style.display = 'none';
}

function Ricerca() {
	let filtro;
	filtro = document.getElementById("input").value;

	if (filtro == null)	filtro = "";
	var currentURL = window.location.href;
	window.location.href = currentURL.substring(0, currentURL.lastIndexOf('/') + 1) + 'Shop?filter=' + filtro.toLowerCase() + '&action=ricerca'

}
