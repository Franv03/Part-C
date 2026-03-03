document.addEventListener("DOMContentLoaded", () => {

  // ====== SELECT STYLE ======
  const selects = document.querySelectorAll("select");

  const updateSelectColor = (select) => {
    if (select.value) {
      select.classList.add("valid");
    } else {
      select.classList.remove("valid");
    }
  };

  selects.forEach(select => {
    select.addEventListener("change", () => {
      updateSelectColor(select);
    });
  });


  // ====== FILE INPUT ======
  const fileInput = document.querySelector(".fileInput");
  const dropArea = document.querySelector(".fileDrop");
  const fileMsg = document.querySelector(".fileMsg");

  if (!fileInput) return; // sicurezza se la pagina cambia

  fileInput.addEventListener("focus", () => dropArea.classList.add("isActive"));
  fileInput.addEventListener("click", () => dropArea.classList.add("isActive"));
  fileInput.addEventListener("dragenter", () => dropArea.classList.add("isActive"));

  fileInput.addEventListener("blur", () => dropArea.classList.remove("isActive"));
  fileInput.addEventListener("dragleave", () => dropArea.classList.remove("isActive"));
  fileInput.addEventListener("drop", () => dropArea.classList.remove("isActive"));

  fileInput.addEventListener("change", function () {
    if (this.files.length === 1) {
      fileMsg.classList.add("changeColor");
      fileMsg.textContent = this.files[0].name;
    }
  });

});