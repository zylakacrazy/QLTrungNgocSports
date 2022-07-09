function checkInput(){
    var input = document.getElementById('TextBox1');
    input.oninvalid = function (event) {
        event.target.setCustomValidity('Tên tài khoản không được để rỗng!');
    }
}