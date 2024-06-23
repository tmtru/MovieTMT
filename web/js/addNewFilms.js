/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function normalizeString(input) {
    if (!input || input.trim().length === 0) {
        return input;
    }

    // Loại bỏ dấu cách thừa và tách các từ
    const words = input.trim().replace(/\s+/, ' ').split(' ');
    let normalizedString = '';

    // Viết hoa chữ cái đầu mỗi từ
    words.forEach(word => {
        if (word.length > 0) {
            normalizedString += word.charAt(0).toUpperCase() + word.slice(1).toLowerCase() + ' ';
        }
    });

    // Xóa dấu cách thừa ở cuối chuỗi
    return normalizedString.trim();
}

function isNumberInRange(number) {
    return number >= 0 && number <= 10;
}
function validateForm(event) {
    event.preventDefault();

    const title = document.getElementById('title').value;
    const releaseDate = document.getElementById('releaseDate').value;
    const rating = parseFloat(document.getElementById('rating').value);

    // Normalize the title
    const normalizedTitle = normalizeString(title);
    if (!(normalizedTitle===title)){
    document.getElementById('title').value=normalizedTitle;
    alert('Vui lòng nhập đúng định dạng title (có dấu, viết hoa chữ cái đầu mỗi từ)');
    return false;
    }

    // Check if rating is in range
    if (!isNumberInRange(rating)) {
        alert('Rating phải là số tự nhiên từ 0 đến 10');
        return false;
    }

    // Check if all required fields are filled
    if (!normalizedTitle || !releaseDate || isNaN(rating)) {
        alert('Please fill all the required fields.');
        return false;
    }

    // If everything is valid, submit the form
    document.getElementById('movieForm').submit();
}


