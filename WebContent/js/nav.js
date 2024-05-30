// JavaScript para ocultar el navbar al desplazarse hacia abajo
let lastScrollTop = 0;
window.addEventListener("scroll", function() {
    let currentScroll = window.pageYOffset || document.documentElement.scrollTop;
    if (currentScroll > lastScrollTop) {
        // Scrolling hacia abajo
        document.querySelector(".navbar").style.transform = "translateY(-100%)";
    } else {
        // Scrolling hacia arriba
        document.querySelector(".navbar").style.transform = "translateY(0%)";
    }
    lastScrollTop = currentScroll <= 0 ? 0 : currentScroll;
}, false);
