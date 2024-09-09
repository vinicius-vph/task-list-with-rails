// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()



// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


// random colors for boards background
// document.addEventListener('DOMContentLoaded', (event) => {
//   const element_arr = [...document.getElementsByClassName('random-bg')] || [];

//   element_arr.forEach((element) => {
//     const colors = ['rgba(255, 99, 71, 0.7)', 'rgba(255, 255, 0, 0.7)',
//     'rgba(0, 128, 0, 0.7)', 'rgba(0, 0, 255, 0.7)'];

//     const randomColor = colors[Math.floor(Math.random() * colors.length)];
//     element.style.backgroundColor = `${randomColor}`;
//   });
// });

document.addEventListener('DOMContentLoaded', (event) => {
  const element_arr = [...document.getElementsByClassName('random-bg')] || [];

  element_arr.forEach((element) => {
    const randomColor = `rgba(${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, ${Math.floor(Math.random() * 256)}, 0.7)`;
    element.style.backgroundColor = `${randomColor}`;
  });
});


// close flash messages
document.addEventListener('DOMContentLoaded', (event) => {
  const closeButton = document.getElementById('close-flash');

  if (closeButton) {
    closeButton.addEventListener('click', (event) => {
      event.preventDefault();
      closeButton.parentElement.remove();
    });
  }
});

import "trix"
import "@rails/actiontext"
