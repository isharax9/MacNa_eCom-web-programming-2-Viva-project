
/*Start Load Product function*/

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

            // Update image src
            document.getElementById("image1").src = imagePathBase + "/image1.png";
            document.getElementById("image2").src = imagePathBase + "/image2.png";
            document.getElementById("image3").src = imagePathBase + "/image3.png";

            // Update thumanil src
            document.getElementById("thum1").src = imagePathBase + "/image1.png";
            document.getElementById("thum2").src = imagePathBase + "/image2.png";
            document.getElementById("thum3").src = imagePathBase + "/image3.png";

            // Update anchor href
            document.getElementById("link1").href = imagePathBase + "/image1.png";
            document.getElementById("link2").href = imagePathBase + "/image2.png";
            document.getElementById("link3").href = imagePathBase + "/image3.png";


            //start of added main single product details to front-end

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
            document.getElementById("color-border").style.borderColor = json.product.color.name;
            document.getElementById("color-background").style.backgroundColor = json.product.color.name;
            document.getElementById("product-storage").innerHTML = json.product.storage.value;
            document.getElementById("product-description").innerHTML = json.product.description;
            document.getElementById("add-to-cart-main").addEventListener(
                    "click",
                    (e) => {
                addToCart(json.product.id, document.getElementById("add-to-cart-qty").value);
                e.preventDefault();
            });

            //end of added main single product details to front-end




            //Start of the similer product cloning thing

            let productHtml = document.getElementById("similer-product");
            document.getElementById("smiler-product-main").innerHTML = "";

            json.productList.forEach(item => {

                let productCloneHtml = productHtml.cloneNode(true);

                productCloneHtml.querySelector("#similer-product-a1").href = "single-product.html?id=" + item.id;
                productCloneHtml.querySelector("#similer-product-image").src = "product-images/" + item.id + "/image1.png";
                productCloneHtml.querySelector("#similer-product-a2").href = "single-product.html?id=" + item.id;
                productCloneHtml.querySelector("#similer-product-title").innerHTML = item.title;
                productCloneHtml.querySelector("#similer-product-storage").innerHTML = item.storage.value;
                productCloneHtml.querySelector("#similer-product-price").innerHTML = "Rs. " + new Intl.NumberFormat(
                        "en-US",
                        {
                            minimumFractionDigits: 2
                        }
                ).format(item.price);

                productCloneHtml.querySelector("#similer-product-color-border").style.borderColor = item.color.name;
                productCloneHtml.querySelector("#similer-product-color").style.backgroundColor = item.color.name;
                productCloneHtml.querySelector("#similer-product-add-to-cart").addEventListener(
                        "click",
                        (e) => {
                    addToCart(item.id, 1);
                    e.preventDefault();
                });

                document.getElementById("smiler-product-main").appendChild(productCloneHtml);
            });

            $('.recent-product-activation').slick({
                infinite: true,
                slidesToShow: 4,
                slidesToScroll: 4,
                arrows: true,
                dots: false,
                prevArrow: '<button class="slide-arrow prev-arrow"><i class="fal fa-long-arrow-left"></i></button>',
                nextArrow: '<button class="slide-arrow next-arrow"><i class="fal fa-long-arrow-right"></i></button>',
                responsive: [{
                        breakpoint: 1199,
                        settings: {
                            slidesToShow: 3,
                            slidesToScroll: 3
                        }
                    },
                    {
                        breakpoint: 991,
                        settings: {
                            slidesToShow: 2,
                            slidesToScroll: 2
                        }
                    },
                    {
                        breakpoint: 479,
                        settings: {
                            slidesToShow: 1,
                            slidesToScroll: 1
                        }
                    }
                ]
            });


        } else {
            window.location = "index.html";
        }
    } else {
        window.location = "index.html";
    }
}

/*End Load Product function*/

//improved version of addToCart function:-

//async function addToCart(id, qty) {
//    console.log("add to cart id: " + id);
//    console.log("add to cart qty: " + qty);
//
//    try {
//        const response = await fetch("AddToCart?id=" + id + "&qty=" + qty);
//
//        if (response.ok) {
//            // Check if response body is not empty before parsing
//            const responseText = await response.text();
//            
//            if (responseText) {
//                const json = JSON.parse(responseText);
//                console.log("Product added to cart:", json);
//            } else {
//                console.error("Empty response received.");
//            }
//        } else {
//            console.error("Error with request, status:", response.status);
//        }
//    } catch (error) {
//        console.error("An error occurred while adding to cart:", error);
//    }
//}

async function addToCart(id, qty) {

    console.log("add to cart id: " + id);
    console.log("add to cart qty: " + qty);
    const response = await fetch(
            "AddToCart?id=" + id + "&qty=" + qty
            );

const popup = Notification();

    if (response.ok) {
        const json = await response.json();

        if (json.success) {
            popup.success({
                message: json.content
            });
        } else {
            popup.error({
                message: json.content
            });
        }
    } else {
        popup.error({
            message: "Unable to process your request"
        });
    }
}