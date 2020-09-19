// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { starRating } from '../components/star-rating';
import { readMore } from '../components/read-more';

// Make the following JS functions accessible from the HTML files
window.readMore = function() {
  readMore();
}

window.starRating = function() {
  starRating();
}

// Upon loading a page, load the following JS functions
document.addEventListener('turbolinks:load', () => {
  const reviewsContainer = document.querySelector('.reviews-container');

  if (reviewsContainer) {
    readMore();
    starRating();
  }
});
