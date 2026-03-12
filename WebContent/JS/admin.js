function openEditPopup(code, price, available) {
    document.getElementById("editPopupOverlay").style.display = "flex";
    document.getElementById("editCode").value = code;
    document.getElementById("editPrice").value = price;
    document.getElementById("editAvailable").value = available;
}

function closeEditPopup() {
    document.getElementById("editPopupOverlay").style.display = "none";
}

function openDeletePopup(code) {
    document.getElementById("deletePopupOverlay").style.display = "flex";
    document.getElementById("deleteCode").value = code;
}

function closeDeletePopup() {
    document.getElementById("deletePopupOverlay").style.display = "none";
}