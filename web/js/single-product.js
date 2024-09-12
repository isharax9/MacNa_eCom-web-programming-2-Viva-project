
/* global productCloneHtml, item */

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

//            document.getElementById("color-border").style.borderColor = json.product.color.name;
//            document.getElementById("color-background").style.backgroundColor = json.product.color.name;

            document.getElementById("product-color").innerHTML = json.product.color.name;
            document.getElementById("product-storage").innerHTML = json.product.storage.value;
            document.getElementById("product-description").innerHTML = json.product.description;

            document.getElementById("add-to-cart-main").addEventListener(
                    "click",
                    (e) => {
                addToCart(json.product.id, document.getElementById("add-to-cart-qty").value);
                e.preventDefault();
            }
            );

            //end of added main single product details to front-end


            //Start of the similer product cloning thing


            let productHtml = document.getElementById("similer-product");
            document.getElementById("smiler-product-main").innerHTML = "";

            json.productList.forEach(item => {

                let productCloneHtml = productHtml.cloneNode(true);


                productCloneHtml.querySelector("#similer-product-a1").href = "single-product.html?id=" + item.id;
                productCloneHtml.querySelector("#similer-product-image").src = "product-images/" + item.id + "/image1.png";
                productCloneHtml.querySelector("#similer-product-a2").href = "single-product.html?id=" + item.id;
                productCloneHtml.querySelector("#similer-product-a3").href = "single-product.html?id=" + item.id;
                productCloneHtml.querySelector("#similer-product-a4").href = "single-product.html?id=" + item.id;
                productCloneHtml.querySelector("#similer-product-title").innerHTML = item.title;

                productCloneHtml.querySelector("#similer-product-price").innerHTML = "Rs. " + new Intl.NumberFormat(
                        "en-US",
                        {
                            minimumFractionDigits: 2
                        }
                ).format(item.price);

                document.getElementById("smiler-product-main").appendChild(productCloneHtml);
            });


            // Product Slider 3 Column
            $('.product-slider-3').slick({
                autoplay: true,
                infinite: true,
                dots: false,
                slidesToShow: 3,
                slidesToScroll: 1,
                responsive: [
                    {
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 3,
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 2,
                        }
                    },
                    {
                        breakpoint: 576,
                        settings: {
                            slidesToShow: 1,
                        }
                    },
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


async function addToCart(id, qty) {

    console.log("add to cart id: " + id);
    console.log("add to cart qty: " + qty);
    const response = await fetch(
            "AddToCart?id=" + id + "&qty=" + qty
            );

    if (response.ok) {
        const json = await response.json();
    } else {
        // Handle error
    }
}