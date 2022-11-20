const flagElement = document.getElementById("flags");
const textsToChange = document.querySelectorAll("[data-section]");
const flagsElements = document.querySelectorAll(".flags__item");
const tooltipFlagElement = document.querySelectorAll(".item-tooltip");

const changeLanguage = async(language) => {
    const requestJson = await fetch(`Assets/json/${language}.json`);
    const texts = await requestJson.json();

    for(const element of flagsElements){
        if (element.dataset.language == language) {
            element.classList.add("flag-selected");
        } else {
            element.classList.remove("flag-selected");
        }
    }

    for(const textToChange of textsToChange){
        const section= textToChange.dataset.section;
        const value = textToChange.dataset.value;
        textToChange.innerHTML = texts[section][value];
    }
};

flagElement.addEventListener("click",(e)=>{
    if (!e.target.closest(".tooltip-language") && !document.querySelector(".tooltip-language").classList.contains("active")) {
        document.querySelector(".tooltip-language").classList.add("active");
    } else {
        document.querySelector(".tooltip-language").classList.remove("active");
    }
});

tooltipFlagElement.forEach(flag => {
    flag.addEventListener('click', (e) => {
        // Luego que guarde en cookie
        changeLanguage(e.target.closest(".item-tooltip").dataset.language);
        e.target.closest('.tooltip-language').classList.remove("active");
    });
  })

window.addEventListener('load', function() {
    changeLanguage("es");
}, false);