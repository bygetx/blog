//top page button
document.addEventListener("DOMContentLoaded", function () {
    const topButton = document.getElementById("topButton");

      window.addEventListener("scroll", () => {
          if (window.scrollY > 20) {
              topButton.classList.add("show");
          } else {
              topButton.classList.remove("show");
          }
      });
  
      topButton.addEventListener("click", () => {
          console.log("clicked");
          window.scrollTo({ top: 0, behavior: "smooth" });
      });
  });





document.addEventListener("DOMContentLoaded", function() {
    // Triggering reflow to restart the CSS animation
    document.querySelector('.animate-fade-in').offsetHeight;
    
    // Adding a class to elements to start the transition
    document.querySelector('.animate-fade-in').classList.add('opacity-100');
    });