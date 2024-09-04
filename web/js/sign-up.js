async function signUp() {

    const user_dto = {
        
        first_name: document.getElementById("first_name").value,
        last_name: document.getElementById("last_name").value,
        email: document.getElementById("email").value,
        password: document.getElementById("password").value
    };


    console.log(user_dto);

    const response = await fetch(
            "SignUp",
            {
                method: "POST",
                body: JSON.stringify(user_dto),
                headers: {
                    "Content-Type": "application/json"
                }
            }
    );
    
    if (response.ok) {

        const json = await response.json();
        console.log(json.success);
        console.log(json.content);
    } else {
        console.log("error");

    }
}