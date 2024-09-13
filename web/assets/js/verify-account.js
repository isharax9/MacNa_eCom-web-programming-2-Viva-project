async function verifyAccount() {

    const dto = {
        verification: document.getElementById("verification").value,
    };


//    console.log(user_dto);

    const response = await fetch(
            "Verification",
            {
                method: "POST",
                body: JSON.stringify(dto),
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
            
                document.getElementById("msg").innerHTML = json.content;
            
        }
    } else {
        document.getElementById("msg").innerHTML = "Please Try Again";

    }
}