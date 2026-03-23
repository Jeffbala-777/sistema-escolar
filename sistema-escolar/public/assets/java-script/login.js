document.addEventListener("DOMContentLoaded", function () {

    const senha = document.getElementById("senha");
    const toggle = document.getElementById("toggleSenha");

    toggle.addEventListener("click", function () {

        if (senha.type === "password") {
            senha.type = "text";
            toggle.textContent = "👁"; // aberto
        } else {
            senha.type = "password";
            toggle.textContent = "👁"; // fechado
        }

    });

});