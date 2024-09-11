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
        
        loadSelect("categorySelect", categoryList, ["id","name"]);
        loadSelect("modelSelect", modelList, ["id","name"]);
        loadSelect("storageSelect", storageList, ["id","value"]);
        loadSelect("colorSelect", colorList,["id","name"] );
        loadSelect("conditionSelect", conditionList,["id","name"] );
    } else {
        document.getElementById("message").innerHTML = "Please try again later!";
    }
}

function loadSelect(selectTagId, list, propertyArray) {
    const SelectTag = document.getElementById(selectTagId);
    list.forEach(item => {
        let optionTag = document.createElement("option");
        optionTag.value = item[propertyArray[0]];
        optionTag.innerHTML = item[propertyArray[1]];
        SelectTag.appendChild(optionTag);
    });
}

function updateModels() {
    let modelSelectTag = document.getElementById("modelSelect");
    modelSelectTag.length = 1;
    let selectedCategoryId = document.getElementById("categorySelect").value;
    modelList.forEach(model => {
        if (model.category.id == selectedCategoryId) { // LOL found the bug here.. don't ever use eqaul for === , instead of that use only ==
            let optionTag = document.createElement("option");
            optionTag.value = model.id;
            optionTag.innerHTML = model.name;
            modelSelectTag.appendChild(optionTag);
        }
    });
}

async function productListing() {
    const categorySelectTag = document.getElementById("categorySelect");
    const modelSelectTag = document.getElementById("modelSelect");
    const titleTag = document.getElementById("title");
    const descriptionTag = document.getElementById("description");
    const storageSelectTag = document.getElementById("storageSelect");
    const colorSelectTag = document.getElementById("colorSelect");
    const conditionSelectTag = document.getElementById("conditionSelect");
    const priceTag = document.getElementById("price");
    const quantityTag = document.getElementById("quantity");
    const image1Tag = document.getElementById("image1");
    const image2Tag = document.getElementById("image2");
    const image3Tag = document.getElementById("image3");
    
    const data = new FormData();
    data.append("categoryId", categorySelectTag.value);
    data.append("modelId", modelSelectTag.value);
    data.append("title", titleTag.value);
    data.append("description", descriptionTag.value);
    data.append("storageId", storageSelectTag.value);
    data.append("colorId", colorSelectTag.value);
    data.append("conditionId", conditionSelectTag.value);
    data.append("price", priceTag.value);
    data.append("quantity", quantityTag.value);
    
    data.append("image1", image1Tag.files[0]);
    data.append("image2", image2Tag.files[0]);
    data.append("image3", image3Tag.files[0]);

    const response = await fetch(
            "ProductListing",
            {
                method: "POST",
                body: data
            }
    );
    if (response.ok) {
        const json = await response.json();
        if (json.success) {
            // Handle successful response
        } else {
            // Handle unsuccessful response
        }
    } else {
        document.getElementById("message").innerHTML = "Please try again later!";
    }
}
