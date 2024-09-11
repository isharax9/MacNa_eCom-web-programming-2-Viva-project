
/* global productId */

function loadProduct(){
    const parameters = new URLSearchParams(window.location.search);
    if (parameters.has("id")) {
        
    const productId = parameters.get("id");
    console.log(productId);
    } else {
        window.location = "index.html";
    }
}

