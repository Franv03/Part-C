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
