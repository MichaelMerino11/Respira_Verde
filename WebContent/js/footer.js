// footer.js
window.addEventListener("scroll", function() {
    var footer = document.querySelector("footer");
    var windowHeight = window.innerHeight;
    var pageHeight = document.body.scrollHeight;
    var scrollPosition = window.scrollY || window.pageYOffset || document.documentElement.scrollTop;

    if (scrollPosition + windowHeight >= pageHeight) {
        footer.classList.add("show-footer");
    } else {
        footer.classList.remove("show-footer");
    }
});
