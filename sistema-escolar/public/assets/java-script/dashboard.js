function toggleMenu() {

    let menu = document.getElementById("menu");
    let conteudo = document.getElementById("conteudo");

    menu.classList.toggle("ativo");
    conteudo.classList.toggle("menu-aberto");

}

function carregar(pagina) {

    const conteudo = document.getElementById("conteudoTexto");

    conteudo.innerHTML = `
        <h1>${pagina}</h1>
        <p>Conteúdo da página "${pagina}" será exibido aqui.</p>
    `;

}