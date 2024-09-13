async function loadData() {
    const popup = Notification();

    const response = await fetch("LoadData");

    if (response.ok) {
        const json = await response.json();
        console.log(json);


        //Start: load Category List
        let category_options = document.getElementById("category-options");

        let category_li = document.getElementById("category-li");
        category_options.innerHTML = "";

        let categoryList = json.categoryList;
        categoryList.forEach(category => {
            let category_li_clone = category_li.cloneNode(true);
            category_li_clone.querySelector("#category-a").innerHTML = category.name;
            category_options.appendChild(category_li_clone);
        });

        //start template js
        const categoryOptions = document.querySelectorAll('#category-options li');
        categoryOptions.forEach(option => {
            option.addEventListener('click', function () {
                categoryOptions.forEach(opt => opt.classList.remove('current-cat'));
                this.classList.add('current-cat');
            });
        });
        //end template js

        //End: load Category List



        //Start: load Condition List
        let condition_options = document.getElementById("condition-options");

        let condition_li = document.getElementById("condition-li");
        condition_options.innerHTML = "";

        let conditionList = json.conditionList;
        conditionList.forEach(condition => {
            let condition_li_clone = condition_li.cloneNode(true);
            condition_li_clone.querySelector("#condition-a").innerHTML = condition.name;
            condition_options.appendChild(condition_li_clone);
        });

        //start template js 

        const conditionOptions = document.querySelectorAll('#condition-options li');
        conditionOptions.forEach(option => {
            option.addEventListener('click', function () {
                conditionOptions.forEach(opt => opt.classList.remove('chosen'));
                this.classList.add('chosen');
            });
        });

        //end template js 


//End: load Condition List













    } else {
        popup.error({
            message: "Try again later!"
        });
    }
}