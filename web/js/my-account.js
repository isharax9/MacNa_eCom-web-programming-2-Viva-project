var modelList; //model list eka global tiyagatta.


async function loadFeatures() {


//    console.log(user_dto);

    const response = await fetch(
            "LoadFeactures"
            );

    if (response.ok) {
        const json = await response.json();

        const categoryList = json.categoryList;
        modelList = json.modelList; //model list eka global karaa.
        const colorList = json.colorList;
        const storageList = json.storageList;
        const conditionList = json.conditionList;

        loadSelect("categorySelect", categoryList, "name");
        loadSelect("modelSelect", modelList, "name");
        loadSelect("storageSelect", storageList, "value");
        loadSelect("colorSelect", colorList, "name");
        loadSelect("conditionSelect", conditionList, "name");

    } else {
        document.getElementById("message").innerHTML = "Please try again later!";
    }
}

function loadSelect(selectTagId, list, property) {
    const SelectTag = document.getElementById(selectTagId);
    list.forEach(item => {
        let optionTag = document.createElement("option");
        optionTag.value = item.id;
        optionTag.innerHTML = item[property];
        SelectTag.appendChild(optionTag);
    });
}

function updateModels() {
    let modelSelectTag = document.getElementById("modelSelect");
    modelSelectTag.length = 1;

    let selectedCategoryId = document.getElementById("categorySelect").value;



    modelList.forEach(model => {
        if (model.category.id === selectedCategoryId) {
            let optionTag = document.createElement("option");
            optionTag.value = model.id;
            optionTag.innerHTML = model.name;
            modelSelectTag.appendChild(optionTag);
        }
    });
}
