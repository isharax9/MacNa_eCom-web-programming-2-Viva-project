async function checkSignIn() {

    const response = await fetch("CheckSignIn");

    if (response.ok) {
        const json = await response.json();
//        console.log(json);

        const response_dto = json.response_dto;



        if (response_dto.success) {
            //signed In

            const user = response_dto.content;



            var st_quick_link = document.getElementById("st-quick-link");

            let st_quick_link_li_1 = document.getElementById("st-quick-link-li-1");
            st_quick_link_li_1.remove();

            let st_quick_link_li_2 = document.getElementById("st-quick-link-li-2");
            st_quick_link_li_2.remove();

            let new_li_tag1 = document.createElement("li");
            new_li_tag1.innerHTML = user.fist_name + " " + user.last_name;
            st_quick_link.appendChild(new_li_tag1);


            let st_button_1 = document.getElementById("st-button-1");
            st_button_1.href = "SignOut";
            st_button_1.innerHTML = "Sign Out";

            let st_div_1 = document.getElementById("st-div-1");
            st_div_1.remove();




        } else {
            //not signed In

//            console.log("not Signed In");

        }

        //display last 3 products
        const productList = json.products;

        let i = 1;
        productList.forEach(product => {
            document.getElementById("st-product-title-" + i).innerHTML = product.title;
            document.getElementById("st-product-link-" + i).href = "single-product.html?id=" + product.id;

            document.getElementById("st-product-image-" + i).src = "product-images/" + product.id + "/image1.png";
            document.getElementById("st-product-price-" + i).innerHTML = new Intl.NumberFormat(
                    "en-US",
                    {
                        minimumFractionDigits: 2
                    }
            ).format(product.price);
            i++;
        });

        $('.slider-content-activation-one').slick({
            infinite: true,
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            dots: false,
            focusOnSelect: false,
            speed: 500,
            fade: true,
            autoplay: false,
            asNavFor: '.slider-thumb-activation-one',
        });

        $('.slider-thumb-activation-one').slick({
            infinite: true,
            slidesToShow: 2,
            slidesToScroll: 1,
            arrows: false,
            dots: true,
            focusOnSelect: false,
            speed: 1000,
            autoplay: true,
            asNavFor: '.slider-content-activation-one',
            prevArrow: '<button class="slide-arrow prev-arrow"><i class="fal fa-long-arrow-left"></i></button>',
            nextArrow: '<button class="slide-arrow next-arrow"><i class="fal fa-long-arrow-right"></i></button>',
            responsive: [{
                    breakpoint: 991,
                    settings: {
                        slidesToShow: 1,
                    }
                }
            ]

        });

    }
}

async function viewCart() {
    const response = await fetch("cart.html");

    if (response.ok) {
        
        const cartHtmlText = await response.text();

        const parser = new DOMParser();
        const cartHtml = parser.parseFromString(cartHtmlText, "text/html");

        const cart_main = cartHtml.getElementById("cart-main");
//        console.log(cart_main);

        document.querySelector(".main-wrapper").innerHTML = cart_main.innerHTML;

        loadCartItems();

    }
}