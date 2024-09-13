async function signIn() {

    const user_dto = {
        email: document.getElementById("email").value,
        password: document.getElementById("password").value
    };


//    console.log(user_dto);

    const response = await fetch(
            "SignIn",
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
        if (json.success) {
            window.location = "index.html";
        } else {


            if (json.content === "Not Verified") {
                window.location = "verify-account.html";
            } else {
                document.getElementById("msg").innerHTML = json.content;
            }
        }
    } else {
        document.getElementById("msg").innerHTML = "Please Try Again";

    }
}