async function loadData() {
    const popup = Notification();
    
    const response = await fetch("LoadData");
    
    if (response.ok) {
        const json = await response.json();
//        console.log(json);
        
        
        //Start: load Category List
        loadOption("category", json.categoryList, "name");
        //End: load Category List
        
        
        //Start: load Condition List
        loadOption("condition", json.conditionList, "name");
        //End: load Condition List
        
        //Start: load Color List       
        loadOption("color", json.colorList, "name");
        //End: load Color List
        
        //Start: load Storage List
        loadOption("storage", json.storageList, "value");
        //End: load Storage List
        
        updateProductView(json);
        
        //Start: load Product List
        let st_product_container = document.getElementById("st-product-container");
        
        let st_product = document.getElementById("st-product");
        st_product_container.innerHTML = "";
        
        json.productList.forEach(product => {
            console.log(product.id);
        });
        
        json.productList.forEach(product => {
            let st_product_clone = st_product.cloneNode(true);
            
            
            //Update details
            st_product_clone.querySelector("#st-product-a-1").href = "single-product.html?id=" + product.id;
            
            st_product_clone.querySelector("#st-product-img-1").src = "product-images/" + product.id + "/image1.png";
            
            st_product_clone.querySelector("#st-product-title-1").innerHTML = product.title;
            st_product_clone.querySelector("#st-product-price-1").innerHTML = new Intl.NumberFormat(
                    "en-US",
                    {
                        minimumFractionDigits: 2
                    }
            
            ).format(product.price);
            ;
            
            //Update details
            
            
            st_product_container.appendChild(st_product_clone);
        });
        
        //End: load Product List
        
        
//Start: Pagination
        let st_pagination_container = document.getElementById("st-pagination-container");
        let st_pagination_button = document.getElementById("st-pagination-button");
        st_pagination_container.innerHTML = "";
        
        let product_count = json.allProductCount;
        const product_per_page = 6;
        
        let pages = Math.ceil(product_count / product_per_page);
        
//Add Previous Button
        let st_pagination_button_clone_prev = st_pagination_button.cloneNode(true);
        st_pagination_button_clone_prev.innerHTML = "Prev";
        st_pagination_container.appendChild(st_pagination_button_clone_prev);
        
//Add Page Buttons
        for (var i = 0; i < pages; i++) {
            let st_pagination_button_clone = st_pagination_button.cloneNode(true);
            st_pagination_button_clone.innerHTML = i + 1;
            st_pagination_container.appendChild(st_pagination_button_clone);
        }
        
//Add Next Button
        let st_pagination_button_clone_next = st_pagination_button.cloneNode(true);
        st_pagination_button_clone_next.innerHTML = "Next";
        st_pagination_container.appendChild(st_pagination_button_clone_next);
        
//End: Pagination
        
        
        
        
    } else {
        popup.error({
            message: "Try again later!"
        });
    }
}



function loadOption(prefix, dataList, property) {
    let options = document.getElementById(prefix + "-options");
    
    let li = document.getElementById(prefix + "-li");
    options.innerHTML = "";
    
    dataList.forEach(data => {
        let li_clone = li.cloneNode(true);
        
        if (prefix === "color") {
            li_clone.style.borderColor = data[property];
            li_clone.querySelector("#" + prefix + "-a").style.backgroundColor = data[property];
        } else {
            li_clone.querySelector("#" + prefix + "-a").innerHTML = data[property];
        }
        
        options.appendChild(li_clone);
    });
    
    const all_li = document.querySelectorAll("#" + prefix + "-options li");
    all_li.forEach(x => {
        x.addEventListener('click', function () {
            all_li.forEach(y => y.classList.remove('chosen'));
            this.classList.add('chosen');
        });
    });
}

async function searchProducts(firstResult) {
    // Initialize Notification
    const popup = Notification();
    
    
    
    
    // Get selected category
//    let category_ul = document.getElementById("category-options");
//    let category_name = category_ul.querySelector(".chosen").querySelector("#category-a").innerHTML;
//    console.log(category_name);
    
    
//Start: Get search data****
    
    let category_name = document.getElementById("category-options")
            .querySelector(".chosen")
            ?.querySelector("a").innerHTML;
    
    
    
    let condition_name = document.getElementById("condition-options")
            .querySelector(".chosen")
            ?.querySelector("a").innerHTML;
    
    
    
    let color_name = document.getElementById("color-options")
            .querySelector(".chosen")
            ?.querySelector("a").style.backgroundColor;
    
    
    
    let storage_value = document.getElementById("storage-options")
            .querySelector(".chosen")
            ?.querySelector("a").innerHTML;
    
    
    
    let price_range_start = $('#slider-range').slider('values', 0);
    let price_range_end = $('#slider-range').slider('values', 1);
    
    let sort_text = document.getElementById("st-sort").value;
    
    
    
    console.log(category_name);
    console.log(condition_name);
    console.log(color_name);
    console.log(storage_value);
    console.log(price_range_start);
    console.log(price_range_end);
    console.log(sort_text);
    
    
    //End: Get search data****
    
    // Start: Prepare request data
    const data = {
        firstResult: firstResult,
        category_name: category_name,
        condition_name: condition_name,
        color_name: color_name,
        storage_value: storage_value,
        price_range_start: price_range_start,
        price_range_end: price_range_end,
        sort_text: sort_text
    };
    
    // End: Prepare request data
    
    // Send POST request
    const response = await fetch("SearchProducts", {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
            "Content-Type": "application/json"
        }
    });
    
    // Response handling
    if (response.ok) {
        // Get response json
        const json = await response.json();
        console.log(json);
        
        
        if (json.success) {
            
            
            updateProductView(json);
//            currentPage= 0;
            
            
            popup.success({
                message: "Search Applied!"
            });
        } else {
            popup.error({
                message: "Try again later!"
            });
        }
        
        
        
    } else {
        popup.error({
            message: "Try again later!"
        });
    }
}

var st_product = document.getElementById("st-product");
var st_pagination_button = document.getElementById("st-pagination-button");

var currentPage = 0;

function updateProductView(json) {
    //Start: load Product List
    let st_product_container = document.getElementById("st-product-container");
    
    
    st_product_container.innerHTML = "";
    
    json.productList.forEach(product => {
        console.log(product.id);
    });
    
    json.productList.forEach(product => {
        let st_product_clone = st_product.cloneNode(true);
        
        
        //Update details
        st_product_clone.querySelector("#st-product-a-1").href = "single-product.html?id=" + product.id;
        
        st_product_clone.querySelector("#st-product-img-1").src = "product-images/" + product.id + "/image1.png";

        
        st_product_clone.querySelector("#st-product-title-1").innerHTML = product.title;
        st_product_clone.querySelector("#st-product-price-1").innerHTML = new Intl.NumberFormat(
                "en-US",
                {
                    minimumFractionDigits: 2
                }
        
        ).format(product.price);
        ;
        
        //Update details
        
        
        st_product_container.appendChild(st_product_clone);
    });
    
    //End: load Product List
    
    
//Start: Pagination
    let st_pagination_container = document.getElementById("st-pagination-container");
    
    st_pagination_container.innerHTML = "";
    
    let product_count = json.allProductCount;
    const product_per_page = 6;
    let pages = Math.ceil(product_count / product_per_page);
    
//Add Previous Button
    if (currentPage != 0) {
        let st_pagination_button_clone_prev = st_pagination_button.cloneNode(true);
        st_pagination_button_clone_prev.innerHTML = "Prev";
        
        st_pagination_button_clone_prev.addEventListener("click", e => {
            currentPage--;
            searchProducts(currentPage * 6);
        });
        
        
        st_pagination_container.appendChild(st_pagination_button_clone_prev);
    }
    
    
//Add Page Buttons
    for (let i = 0; i < pages; i++) {
        let st_pagination_button_clone = st_pagination_button.cloneNode(true);
        st_pagination_button_clone.innerHTML = i + 1;
        
        st_pagination_button_clone.addEventListener("click", e => {
            currentPage = i;
            searchProducts(i * 6);
//            e.preventDefault();
        });
        
        
        if (i == currentPage) {
            st_pagination_button_clone.className = "axil-btn btn-bg-secondary ml-10";
        } else {
            st_pagination_button_clone.className = "axil-btn btn-bg-primary ml-10";
        }
        
        st_pagination_container.appendChild(st_pagination_button_clone);
    }
    
//Add Next Button
    
    if (currentPage != (pages - 1)) {
        let st_pagination_button_clone_next = st_pagination_button.cloneNode(true);
        st_pagination_button_clone_next.innerHTML = "Next";
        
        
        st_pagination_button_clone_next.addEventListener("click", e => {
            currentPage++;
            searchProducts(currentPage * 6);
        });
        
        
        st_pagination_container.appendChild(st_pagination_button_clone_next);
    }
    
    
    
//End: Pagination
}