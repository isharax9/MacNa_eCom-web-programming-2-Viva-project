async function signUp() {

    const user_dto = {
        NIC:document.getElementById("NIC").value,
        first_name: document.getElementById("first_name").value,
        last_name: document.getElementById("last_name").value,
        mobile:document.getElementById("mobile").value,
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
}