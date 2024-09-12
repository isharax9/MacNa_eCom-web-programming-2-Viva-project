async function checkSignIn() {
    
    const response = await fetch("CheckSignIn");

    if (response.ok) {
        const json = await response.json();

        if (json.success) {
            //signed In
            
            const user = json.content;
            console.log(user);
            
            
        } else {
            //not signed In
            
            console.log("not Signed In");
            
        }
    }
}