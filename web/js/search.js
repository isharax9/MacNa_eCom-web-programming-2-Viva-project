async function loadData() {
    const popup = Notification();

    const response = await fetch("LoadData");

    if (response.ok) {
        const json = await response.json();
//        console.log(json);


        //Start: load Category List
        loadOption("category", json.categoryList,"name");
        //End: load Category List


        //Start: load Condition List
        loadOption("condition", json.conditionList,"name");
        //End: load Condition List

        //Start: load Color List       
        loadOption("color", json.colorList, "name");
        //End: load Color List

        //Start: load Storage List
        loadOption("storage", json.storageList, "value");
        //End: load Storage List


    } else {
        popup.error({
            message: "Try again later!"
        });
    }
}


function loadOption(prefix, dataList, property) {
    let options = document.getElementById(prefix + "-options");
    options.innerHTML = ""; // Clear existing options

    dataList.forEach(data => {
        let link = document.createElement('a');
        link.href = "#";
        link.className = "dropdown-item";
        link.innerHTML = (prefix === "color")
            ? `<span class="color-swatch" style="background-color: ${data[property]}"></span> ${data[property]}`
            : data[property];
        options.appendChild(link);
    });

    // Add event listener to handle selection
    options.querySelectorAll('.dropdown-item').forEach(item => {
        item.addEventListener('click', function () {
            // Remove 'chosen' class from all items
            options.querySelectorAll('.dropdown-item').forEach(x => x.classList.remove('chosen'));
            // Add 'chosen' class to clicked item
            this.classList.add('chosen');
        });
    });
}

