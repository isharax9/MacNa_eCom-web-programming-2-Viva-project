async function checkSignIn() {

    const response = await fetch("CheckSignIn");

    if (response.ok) {
        const json = await response.json();

        if (json.success) {
            // User is signed in
            const user = json.content;
            console.log(user);

            // Get the quick link list
            var st_quick_link = document.getElementById("st-quick-link");

            // Remove the "Join Us" and "Sign In" links
            let st_quick_link_li_1 = document.getElementById("st-quick-link-li-1");
            st_quick_link_li_1.remove();

            let st_quick_link_li_2 = document.getElementById("st-quick-link-li-2");
            st_quick_link_li_2.remove();

            // Create a new <li> element for the username
            let new_li_tag1 = document.createElement("li");

            // Create a new <a> element for the username, applying the same styles
            let new_a_tag = document.createElement("a");
            new_a_tag.href = "#"; // You can change this to the user's profile link or keep it as "#"
            new_a_tag.className = "nav-item nav-link"; // Apply the same style classes
            new_a_tag.innerHTML =  "Hi,"+ user.first_name + " " + user.last_name;

            // Append the <a> to the new <li>
            new_li_tag1.appendChild(new_a_tag);

            // Append the new <li> to the list
            st_quick_link.appendChild(new_li_tag1);

        } else {
            // User is not signed in
            console.log("not Signed In");
        }
    }
}