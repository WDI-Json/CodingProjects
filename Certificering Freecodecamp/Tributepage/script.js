var netsky_promo = document.getElementById("bg-video");

// Get the button
var btn_pause = document.getElementById("btn_pause_bg");

// Pause and play the video, and change the button text
function pause_background() {
    if (netsky_promo.paused) {
        netsky_promo.play();
        btn_pause.innerHTML = "Pause";
    } else {
        netsky_promo.pause();
        btn_pause.innerHTML = "Play";
    }
}