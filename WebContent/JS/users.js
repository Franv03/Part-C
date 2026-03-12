function toggleDelete(id) {
    var div = document.getElementById("delete" + id);
    div.style.display = (div.style.display === "block") ? "none" : "block";
}

function openEditPopup(email, isAdmin) {

    document.getElementById("editPopupOverlay").style.display = "flex";

    document.getElementById("editEmail").value = email;

    if(isAdmin === "true"){
        document.getElementById("editAdmin").value = "true";
    } else {
        document.getElementById("editAdmin").value = "false";
    }
}

function closeEditPopup(){
    document.getElementById("editPopupOverlay").style.display = "none";
}

function openDeletePopup(email){
    document.getElementById("deletePopupOverlay").style.display = "flex";
    document.getElementById("deleteEmail").value = email;
}

function closeDeletePopup(){
    document.getElementById("deletePopupOverlay").style.display = "none";
}