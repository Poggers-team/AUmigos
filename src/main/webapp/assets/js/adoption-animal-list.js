/*// marcar e desmarcar o toggle switch da espécie
document.getElementById('gato').addEventListener('change', function() {
    if (this.checked) {
        document.getElementById('cachorro').checked = false;
    }
});
document.getElementById('cachorro').addEventListener('change', function() {
    if (this.checked) {
        document.getElementById('gato').checked = false;
    }
});

// marcar e desmarcar o toggle switch do gênero
document.getElementById('femea').addEventListener('change', function() {
    if (this.checked) {
        document.getElementById('macho').checked = false;
    }
});
document.getElementById('macho').addEventListener('change', function() {
    if (this.checked) {
        document.getElementById('femea').checked = false;
    }
});*/

// mostrar valor do slider
const idadeSlider = document.getElementById('idade');
const idadeValor = document.getElementById('idade-valor');

idadeSlider.addEventListener('input', function() {
    idadeValor.textContent = this.value;
});