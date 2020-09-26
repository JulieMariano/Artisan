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

import { autoSubmitForm } from '../components/auto-submit-form';
import { createFlashes } from '../components/create-flashes';
import { prepareModalCheckout } from '../components/prepare-modal-checkout';
import { readMore } from '../components/read-more';
import { refreshInputValidations } from '../components/refresh-input-validations';
import { removeValidations } from '../components/refresh-input-validations';
import { refreshOrdersIndexPage } from '../components/refresh-orders-index-page';
import { smoothPagination } from '../components/smooth-pagination';
import { starRating } from '../components/star-rating';

// Make the following JS functions accessible from the HTML files
window.autoSubmitForm = function(selectorForm, selectorInput) {
  autoSubmitForm(selectorForm, selectorInput);
}

window.createFlashes = function(alertType, text) {
  createFlashes(alertType, text);
}

window.prepareModalCheckout = function(modalCheckout, stripeKey, orderSessionId) {
  prepareModalCheckout(modalCheckout, stripeKey, orderSessionId);
}

window.readMore = function() {
  readMore();
}

window.refreshInputValidations = function(containerSelector, containerChildNum, inputType, errorMessage) {
  refreshInputValidations(containerSelector, containerChildNum, inputType, errorMessage);
}

window.removeValidations = function(containerSelector, containerChildNum, inputType) {
  removeValidations(containerSelector, containerChildNum, inputType);
}

window.refreshOrdersIndexPage = function(shoppingCart, navbarCart) {
  refreshOrdersIndexPage(shoppingCart, navbarCart);
}

window.smoothPagination = function() {
  smoothPagination();
}

window.starRating = function() {
  starRating();
}

// Upon loading a page, load the following JS functions
document.addEventListener('turbolinks:load', () => {
  const reviewsList = document.getElementById('reviews-list');
  const shoppingCart = document.getElementById('shopping-cart');

  if (reviewsList) {
    readMore();
    starRating();

    window.addEventListener('resize', () => {
      readMore();
    });
  } else if (shoppingCart) {
    autoSubmitForm('.edit_orders_item', 'input.numeric');
    smoothPagination();
  }
});
