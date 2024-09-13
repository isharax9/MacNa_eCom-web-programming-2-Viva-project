async function loadData() {
    const popup = Notification();

    const response = await fetch("LoadData");

    if (response.ok) {
        const json = await response.json();
        console.log(json);
    } else {
        popup.error({
            message: "Try again later!"
        });
    }
}