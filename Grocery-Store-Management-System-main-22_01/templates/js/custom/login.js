function callApi2(method, url, data) {
    $.ajax({
        method: method,
        url: url,
        data: data
    }).done(function (msg) {
        window.location ="C:/Users/Sahana RG/Desktop/dbms mini/grocery_store/Grocery-Store-Management-System-main-22_01/templates/index.html";
    });
}