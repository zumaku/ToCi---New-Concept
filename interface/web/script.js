// Fungsi close alert
const closeButton = document.querySelector('#alert-3 button');
const alertDiv = document.querySelector('#alert-3');
closeButton.addEventListener('click', function() {
    alertDiv.style.display = 'none';
});
setTimeout(() => alertDiv.style.display = 'none', 3000)



function handleButtonClick(animation) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', 'http://192.168.4.22/press?animation=' + animation, true);
    xhr.send();
}