async function loadFeatures() {
    
    
//    console.log(user_dto);
    
    const response = await fetch(
            "LoadFeatures"
            );
    
    if (response.ok) {
        
        const json = await response.json();
        console.log(json);
        
    } else {
        document.getElementById("msg").innerHTML = "Please Try Again";
        
    }
}