//async function loadProduct() {
//    const parameters = new URLSearchParams(window.location.search);
//
//    if (parameters.has("id")) {
//        const productId = parameters.get("id");
//
//        const response = await fetch("LoadSingleProduct?id="+productId);
//
//        if (response.ok) {
//            const json = await response.json();
//            console.log(json.product.id);
////            console.log(json.productList);
//            
//            const id = json.product.id;
//            document.getElementById("image1").src="product-images/"+id+"/image1.png";
//            document.getElementById("image2").src="product-images/"+id+"/image2.png";
//            document.getElementById("image3").src="product-images/"+id+"/image3.png"; 
//            
//            
//        } else {
//            window.location = "index.html";
//        }
//    } else {
//        window.location = "index.html";
//    }
//}


async function loadProduct() {
    const parameters = new URLSearchParams(window.location.search);

    if (parameters.has("id")) {
        const productId = parameters.get("id");

        const response = await fetch("LoadSingleProduct?id=" + productId);

        if (response.ok) {
            const json = await response.json();
            console.log(json.product.id);

            const id = json.product.id;
            const imagePathBase = "product-images/" + id;



            // Update thumanil src
            document.getElementById("thum1").src = imagePathBase + "/image1.png";
            document.getElementById("thum2").src = imagePathBase + "/image2.png";
            document.getElementById("thum3").src = imagePathBase + "/image3.png";

            document.getElementById("product-title").innerHTML = json.product.title;
            document.getElementById("product-published-on").innerHTML = json.product.date_time;

            document.getElementById("product-price").innerHTML = new Intl.NumberFormat(
                    "en-US",
                    {
                        minimumFractionDigits: 2
                    }
            ).format(json.product.price);
            document.getElementById("product-category").innerHTML = json.product.model.category.name;

            document.getElementById("product-model").innerHTML = json.product.model.name;
            document.getElementById("product-condition").innerHTML = json.product.product_condition.name;
            document.getElementById("product-qty").innerHTML = json.product.qty;

            document.getElementById("product-color").innerHTML = json.product.color.name;
//            document.getElementById("color-border").style.borderColor = json.product.color.name;
//            document.getElementById("color-background").style.backgroundColor = json.product.color.name;

            document.getElementById("product-storage").innerHTML = json.product.storage.value;
            document.getElementById("product-description").innerHTML = json.product.description;


        } else {
            window.location = "index.html";
        }
    } else {
        window.location = "index.html";
    }
}
