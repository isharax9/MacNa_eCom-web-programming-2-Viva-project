async function checkSignIn() {

    const response = await fetch("CheckSignIn");

    if (response.ok) {
        const json = await response.json();
        console.log(json);

        const response_dto = json.response_dto;



        if (response_dto.success) {
            //signed In

            const user = response_dto.content;


            // Get the quick link list
            var st_quick_link = document.getElementById("st-quick-link");

            // Remove the "Join Us" and "Sign In" links
            let st_quick_link_li_1 = document.getElementById("st-quick-link-li-1");
            st_quick_link_li_1.remove();

            let st_quick_link_li_2 = document.getElementById("st-quick-link-li-2");
            st_quick_link_li_2.remove();

            // Create a new <li> element for the username
            let new_li_tag1 = document.createElement("li");

            // Create a new <a> element for the username, applying the same styles
            let new_a_tag = document.createElement("a");
            new_a_tag.href = "#"; // You can change this to the user's profile link or keep it as "#"
            new_a_tag.className = "nav-item nav-link"; // Apply the same style classes
            new_a_tag.innerHTML = "Hi," + user.first_name + " " + user.last_name;

            // Append the <a> to the new <li>
            new_li_tag1.appendChild(new_a_tag);

            // Append the new <li> to the list
            st_quick_link.appendChild(new_li_tag1);


            let st_button_1 = document.getElementById("st-button-1");
            st_button_1.href = "SignOut";
            st_button_1.innerHTML = "Sign Out";

//            let st_div_1 = document.getElementById("st-div-1");
//            st_div_1.remove();


        } else {
            // User is not signed in
            console.log("not Signed In");
        }
        
        //display last 3 products
        const productList = json.products;

        let i = 1;
        productList.forEach(product => {
            document.getElementById("st-product-title-" + i).innerHTML = product.title;
            document.getElementById("st-product-link-" + i).href = "single-product.html?id=" + product.id;

            document.getElementById("st-product-image-" + i).src = "product-images/" + product.id + "/image1.png";
//            document.getElementById("st-product-price-" + i).innerHTML = new Intl.NumberFormat(
//                    "en-US",
//                    {
//                        minimumFractionDigits: 2
//                    }
//            ).format(product.price);
            i++;
        });
        
        // Header slider
    $('.header-slider').slick({
        autoplay: true,
        dots: true,
        infinite: true,
        slidesToShow: 1,
        slidesToScroll: 1
    });
    }
}