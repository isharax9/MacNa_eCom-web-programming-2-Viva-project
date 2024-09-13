async function loadData() {
    const popup = Notification();

    const response = await fetch(
            "LoadCheckout"
            );

    if (response.ok) {
        const json = await response.json();
        console.log(json);
    }
}