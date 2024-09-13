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
    let li = document.getElementById(prefix + "-li");
    options.innerHTML = "";

    dataList.forEach(data => {
        let li_clone = li.cloneNode(true);

        if (prefix === "color") {
            // Display color name only
            li_clone.querySelector("#" + prefix + "-a").innerHTML = data[property];
            li_clone.style.borderColor = data[property]; // Optional: If you still want to keep a border color
            li_clone.querySelector("#" + prefix + "-a").style.backgroundColor = ""; // Remove background color
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
